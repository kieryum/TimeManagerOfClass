package cn.sm.controller;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
 

@Controller
@RequestMapping(value = "/captcha")
public class CaptchaController {
 
    //private static final Log log = LogFactory.getLog(CaptchaController.class);
	
    @Autowired
    private Producer captchaProducer;
 
    
    @RequestMapping(value = "/getCaptcha", method = RequestMethod.GET)
    public String getCaptcha(Model model) {
        model.addAttribute("timestamp", System.currentTimeMillis());
        return "captcha";
    }
 
    
    @RequestMapping(value="/getCaptchaImage")
    public ModelAndView getCaptchaImage(Model model,HttpServletRequest request, HttpServletResponse response,
                                        @RequestParam(value = "timestamp", required = false) String timestamp) throws IOException {
    	
    	
    	if (StringUtils.isEmpty(timestamp)) {
            model.addAttribute("timestamp", System.currentTimeMillis());
        } else {
            model.addAttribute("timestamp", timestamp);
        }
 
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        
        String capText = captchaProducer.createText();
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        System.out.println("getCaptchaImage ====== >>>"   +  capText );
        request.getSession().setAttribute("capText", capText);//刷新session中验证码
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }
 
    @RequestMapping(value = "/checkCaptcha", method = RequestMethod.POST)
    @ResponseBody
    public String checkCaptcha(@RequestParam(value = "timestamp", required = false) String timestamp, @RequestParam(value = "code", required = false) String code,HttpServletRequest request) {
        boolean returnStr = false;
 
        String original =(String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
 
        if (StringUtils.isNotEmpty(code)) {
            if (code.equalsIgnoreCase(original)) {
                returnStr = true;
            }
        }
        return returnStr + "";
 
    }
}