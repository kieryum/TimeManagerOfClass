package cn.sm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sm.entity.ClassTable;
import cn.sm.entity.Student;
import cn.sm.mapper.ClassMapper;
import cn.sm.mapper.StudentMapper;
import cn.sm.utils.MD5;

@Service
public class StudentService {

	@Autowired
	StudentMapper studentMapper;
	
	@Autowired
	ClassMapper classMapper;
	
	//登陆服务
	public Student loginService(Long sid, String passwd) {
		MD5 md5 = new MD5();
		String pwd;
		try {
			pwd = md5.md5Encode(passwd);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MD5 加密失败");
			return null;
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("sid", sid);
		map.put("passwd",pwd);
		Student student = studentMapper.selectByUserPasswd(map);
		return student;
	}
	
	//返回最大的学生学号 以便于注册时给定学号
	public Long getMaxSid() {
		return studentMapper.getMaxSid();
	}
	
	//学生注册方法
	public Long isRegister(Student student) {
		student.setsId(getMaxSid()+1);
		MD5 md5 = new MD5();
		String pwd = null;
		try {
			pwd = md5.md5Encode(student.getsPasswd());
		} catch (Exception e) {
			System.out.println("md5 错误");
			e.printStackTrace();
			return null;
		}
		student.setsPasswd(pwd);
		if(studentMapper.insert(student) > 0) {
			System.out.println("学生注册成功");
			return student.getsId();
		}else {
			return null;
		}
		
	}
	
	//更改密码
	public int modification(Student student) {
		MD5 md5 = new MD5();
		String pwd = student.getsPasswd();
		
		try {
			student.setsPasswd(md5.md5Encode(pwd));
		} catch (Exception e) {
			
			e.printStackTrace();
			return 0;
		}
		int flag = studentMapper.updateByPrimaryKey(student);
		
		if(flag > 0) {
			return flag;
		}
		return 0;
	}
	
	//主页面需要的链表数据
	public List<ClassTable> getAllData(){
		return classMapper.getAll();
	}
}
