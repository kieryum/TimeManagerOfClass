package cn.sm.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.sm.entity.ClassTable;
import cn.sm.entity.Student;
import cn.sm.mapper.ClassMapper;
import cn.sm.mapper.StudentMapper;
import cn.sm.utils.MD5;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MybatisTest {

	@Autowired
	SqlSessionFactory sqlSessionFactory;
	SqlSession session;
	@Test
	public void MyBatisTest() {
		SqlSession session = sqlSessionFactory.openSession();
		if(session != null) {
			System.out.println("数据库链接成功。。。");
		}else{
			System.out.println("数据库链接失败。。。");
		}
	}
	
	
	//获取登陆用户
	@Test
	public void TestSelectUP() {
		StudentMapper studentMapper = sqlSessionFactory.openSession().getMapper(StudentMapper.class);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("sid", new Long(20160105));
		map.put("passwd", "670b14728ad9902aecba32e22fa4f6bd");
		Student student = studentMapper.selectByUserPasswd(map);
		System.out.println(student.getsName());
	}
	
	//获取最大sid值
	@Test 
	public void getMaxNum() {
		StudentMapper studentMapper = sqlSessionFactory.openSession().getMapper(StudentMapper.class);
		Long num = studentMapper.getMaxSid();
		System.out.println(num);
	}
	
	@Test
	public void InsertTest() {
		StudentMapper studentMapper = sqlSessionFactory.openSession().getMapper(StudentMapper.class);
		Student student = new Student();
		student.setsId(new Long(20160103));
		student.setsName("admin2");
		student.setsEmail("admin@admin1.com");
		MD5 ms5 = new MD5();
		try {
			student.setsPasswd(ms5.md5Encode("000000"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		studentMapper.insert(student);
	}
	
	@Test
	public void testClasstable() {
		ClassMapper classMapper = sqlSessionFactory.openSession().getMapper(ClassMapper.class);
		List<ClassTable> classTable = classMapper.getAll();
		System.out.println(classTable.size());
		for(ClassTable table : classTable) {
			System.out.println(table.getAddress());
		}
	}
	
	@Test
	public void testSearch() {
		ClassMapper classMapper = sqlSessionFactory.openSession().getMapper(ClassMapper.class);
		List<ClassTable> list = classMapper.search("2018%");
		System.out.println(list.size());
	}
	
	@Test 
	public void TestDelet() {
		ClassMapper classMapper = sqlSessionFactory.openSession().getMapper(ClassMapper.class);
		System.out.println(classMapper.delete(13));
	}
	
	@Test
	public void TestUpdate() {
		ClassMapper classMapper = sqlSessionFactory.openSession().getMapper(ClassMapper.class);
		ClassTable classTable = new ClassTable();
		classTable.setId(26);
		classTable.setDate(new Date());
		classTable.setWeek(new Date());
		classTable.setCreatedate(new Date());
		classTable.setClasstype("python");
		classTable.setClassconversion(3);
		classTable.setClasscontent("main");
		classTable.setAddress("民族大学1123");
		System.out.println(classMapper.update(classTable));
	}
	
	
	@Test
	public void TestSelectByID() {
		ClassMapper classMapper = sqlSessionFactory.openSession().getMapper(ClassMapper.class);
		ClassTable map = classMapper.selectByID(23);
		System.out.println(map.getAddress());
	}
	
	@Test
	public void TestInsert() {
		ClassMapper classMapper = sqlSessionFactory.openSession().getMapper(ClassMapper.class);
		ClassTable classTable = new ClassTable();
		classTable.setId(26);
		classTable.setDate(new Date());
		classTable.setWeek(new Date());
		classTable.setCreatedate(new Date());
		classTable.setClasstype("python");
		classTable.setClassconversion(3);
		classTable.setClasscontent("main");
		classTable.setAddress("民族大学1123");
		int num = classMapper.insertDate(classTable);
		System.out.println(num);
	}
}
