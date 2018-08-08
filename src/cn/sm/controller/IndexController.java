package cn.sm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sm.entity.Student;
import cn.sm.service.StudentService;

@Controller
public class IndexController {

	@Autowired
	StudentService studentService;

	
	//登陆页面
	@RequestMapping("/login")
	public String login(Student student, HttpServletRequest request,HttpSession session) {
		
		
		if(session.getAttribute("capText") != null && session.getAttribute("capText").equals(request.getParameter("verification"))){
			
			//System.out.println("验证成功");
			
			if(student != null) {
				if(!"".equals(student.getsEmail()) && !"".equals(student.getsPasswd())) {
					//System.out.println("用户名或密码不为空");
					
					Student stu = studentService.loginService(student.getsId(), student.getsPasswd());
					//System.out.println(stu);
					if(stu != null) {
						session.setAttribute("list", studentService.getAllData());
						request.getSession().setAttribute("student", stu);
						student=null;
						return "redirect:/index";
					}
				}
			}
		}
		
		return "login";
	}
	
	
	//注册页面
	@RequestMapping("/register")
	public String register(Student student,HttpServletRequest request ,HttpSession session) {
		
		String name = student.getsName();
		String email = student.getsEmail();
		String passwd = student.getsPasswd();
		boolean status = !(name==null) && !(email==null) && !(passwd==null); // 重外面跑到这的时候
		if(!"".equals(name) && !"".equals(email) && !"".equals(passwd) && status) {
			Long sid = null;
			if((sid = studentService.isRegister(student)) != null) {
				Student stu = studentService.loginService(sid, passwd);
				session.setAttribute("list", studentService.getAllData());//向页面添加数据
				stu.setsPasswd(""); //密码清空
				request.getSession().setAttribute("student", stu);
				return "redirect:/index1";
			}
		}
		return "register";
	}
	
	//主页面
	@RequestMapping("/index")
	public String index(HttpSession session) {
		
		return "index";
	}
	
	
	@RequestMapping("/modification")
	public String modification(String oldPwd, String newPwd,HttpServletRequest request) {
		Student student = (Student)request.getSession().getAttribute("student");
		if(!"".equals(oldPwd) && !"".equals(newPwd)) {
			if(studentService.loginService(student.getsId(), oldPwd) != null) {
				student.setsPasswd(newPwd);
				if(studentService.modification(student)>0) {
					request.setAttribute("mes", "修改密码成功，密码是："+newPwd);
				}
			}
			
		}
		
		
		return "index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		System.out.println(1231321);
		request.getSession().invalidate();
		return "redirect:/login";
	}
	
}
