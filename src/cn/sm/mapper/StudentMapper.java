package cn.sm.mapper;

import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.sm.entity.Student;

@Repository
public interface StudentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer id);
    
    // key:sid key:passwd
    Student selectByUserPasswd(Map map);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    
    //获取sid最大的值
    Long getMaxSid();
    
}