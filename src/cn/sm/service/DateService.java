package cn.sm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sm.entity.ClassTable;
import cn.sm.mapper.ClassMapper;
import cn.sm.utils.IsNull;

@Service
public class DateService {

	
	@Autowired
	ClassMapper classMapper;
	
	IsNull isNull = new IsNull();
	
	/**
	 * 根据日期查找数据
	 * @param search
	 * @return
	 */
	public List<ClassTable> searchClass(String search){
		if("".equals(search) && search == null) {
			return classMapper.getAll();
		}else{
			//System.out.println("进入方法体啦");
			//System.out.println(search+"%");
			return classMapper.search(search+"%");
		}
	}
	
	/**
	 * 删除数据
	 * @param id
	 * @return
	 */
	public int delete(Integer id) {
		//获取删除时的变化条数
		
		return classMapper.delete(id);
	}
	
	/**
	 * 更新数据
	 * @param classTable
	 * @return
	 */
	public int update(ClassTable classTable) {
		if(isNull.isNull(classTable)) {
			return classMapper.update(classTable);
		}
		return 0;
	}
	
	public ClassTable selectByID(Integer id) {
		
		return classMapper.selectByID(id);
	}
	
	public boolean insertDate(ClassTable classTable) {
		if(isNull.isNull(classTable)) {
			if(classMapper.insertDate(classTable) > 0) {
				return true;
			}
		}
		
		return false;
	}
}
