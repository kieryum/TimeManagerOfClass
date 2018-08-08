package cn.sm.mapper;

import java.util.List;

import cn.sm.entity.ClassTable;

public interface ClassMapper {

	List<ClassTable> getAll();
	
	List<ClassTable> search(String search);
	
	int delete(Integer id);
	
	int update(ClassTable classTable);
	
	ClassTable selectByID(Integer id);
	
	int insertDate(ClassTable classTable);
}
