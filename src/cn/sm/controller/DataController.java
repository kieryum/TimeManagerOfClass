package cn.sm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.sm.entity.ClassTable;
import cn.sm.service.DateService;
import cn.sm.service.StudentService;

@Controller
public class DataController {

	@Autowired
	StudentService studentService;
	
	@Autowired
	DateService dataService;
	
	@RequestMapping("/search")
	public String search(String search , HttpServletRequest request,HttpSession session) {
		System.out.println(search);
		List<ClassTable> list = dataService.searchClass(search);
		System.out.println(list != null? "数据不为空" : "数据为空");
		
		request.getSession().setAttribute("list", list);
		session.setAttribute("search", search);
		return "redirect:/index";
	}
	
	@RequestMapping("/add")
	public String addData() {
		return "edit";
	}
	
	@RequestMapping("/amend")
	public String modification(String data ,HttpSession session) {
		String tmpData = data.replace(" ", "");
		String[] list = tmpData.split(",");
		session.setAttribute("trueDate", dataService.selectByID(Integer.parseInt(list[7])));
		session.setAttribute("modificationData", list);
		return "modification";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") String id,HttpSession session) {
		String[] str = id.split(",");
		for(String idi : str) {
			dataService.delete(Integer.parseInt(idi));
		}
		session.setAttribute("list",dataService.searchClass((String)session.getAttribute("search")));
		return "redirect:/index";
	}
	
	//修改课时数据
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(ClassTable classTable,String dateD,String weekD,String createdateD,HttpSession session) {
		Date date = null;
		Date week = null;
		Date createdate = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateD);
			week = new SimpleDateFormat("yyyy-MM-dd").parse(weekD);
			createdate = new SimpleDateFormat("yyyy-MM-dd").parse(createdateD);
		} catch (ParseException e) {
			System.out.println("时间转化错误");
			e.printStackTrace();
		}
		classTable.setDate(date);
		classTable.setWeek(week);
		classTable.setCreatedate(createdate);
		
		//数据更新
		if(dataService.update(classTable) > 0) {
			if(session.getAttribute("search") == null || "".equals(session.getAttribute("search"))) {
				session.setAttribute("list", studentService.getAllData());
			}else {
				session.setAttribute("list",dataService.searchClass((String)session.getAttribute("search")));
			}
			
		}
		return "redirect:/index";
	}
	
	//添加一条新的数据
	@RequestMapping("/addNewData")
	public String addNewData(ClassTable classTable,HttpSession session,String dateD,String weekD,String createdateD) {
		Date date = null;
		Date week = null;
		Date createdate = null;
		
		System.out.println(dateD+">>>>"+weekD+">>>"+createdateD);
		
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateD);
			week = new SimpleDateFormat("yyyy-MM-dd").parse(weekD);
			createdate = new SimpleDateFormat("yyyy-MM-dd").parse(createdateD);
		} catch (ParseException e) {
			System.out.println("时间转化错误");
			e.printStackTrace();
		}
		classTable.setDate(date);
		classTable.setWeek(week);
		classTable.setCreatedate(createdate);
		classTable.setId(8080); //数据在后端没有使用，在这使用只是为了在做类对象的属性时条过
		System.out.println(classTable.getAddress()+">>"+classTable.getClasscontent()+">>"+classTable.getClassconversion()+">>"+classTable.getClasstype());
		
		if(dataService.insertDate(classTable)) {
			if(session.getAttribute("search") == null || "".equals(session.getAttribute("search"))) {
				session.setAttribute("list", studentService.getAllData());
			}else {
				session.setAttribute("list",dataService.searchClass((String)session.getAttribute("search")));
			}
			return "redirect:/index";
		}
		return "redirect:/add";
	}
	
}
