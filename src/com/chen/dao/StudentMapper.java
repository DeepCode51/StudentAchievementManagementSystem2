package com.chen.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.chen.pojo.Student;

public interface StudentMapper {
	
	//添加学生
	public int addStudentInfo(Student student);
	
	//更新学生
	public int updateStudentInfo(Student student);
	
	//获取要修改的学生信息
	public Student queryStudentById(String id);
	
	//删除学生
	public int deleteStudentInfoById(@Param("studentId") String id);

	//查询学生
	public List<Student> findByPage(HashMap<String,Object> map);
	
	//查询总条数
    int selectCount(@Param("studentId")String id);
    
    public int restStudent(@Param("studentId")String id);

	public int changePwd(@Param("studentId")String studentId, @Param("newPass")String newPass);
	
	

    
}
