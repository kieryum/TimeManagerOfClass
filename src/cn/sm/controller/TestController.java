package cn.sm.controller;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.pol.demo.Demo;
import cn.sm.service.StudentService;

@Controller
public class TestController {

	@Autowired
	StudentService studentService;
	
	@RequestMapping("/export")
	public void export(HttpServletRequest request, HttpServletResponse response) {
		// @See http://www.cnblogs.com/dingjiaoyang/p/5831049.html
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-disposition", "attachment;filename=myExcel.xls");
	OutputStream ouputStream = null;
	
	Demo demo = new Demo();
	
	HSSFWorkbook wb = demo.exportData("ClassManageSystem",studentService.getAllData());
	try {
		ouputStream = response.getOutputStream();
		wb.write(ouputStream);
	} catch (Exception e) {
		throw new RuntimeException("系统异常");
	} finally {
		try {
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			throw new RuntimeException("系统异常");
		}
	}
	}
}
