package com.chen.service;

import com.chen.pojo.Student;
import com.chen.untils.PageBean;

public interface StudentService {
	
	public int addStudentInfo(Student student);
		
	public int updateStudentInfo(Student student);
	
	public Student queryStudetnById(String id);
		
	public int deleteStudentInfoById(String id);
	
	public PageBean<Student> findByPage(int currentPage ,String id);

	public int restStudent(String id);
	
	
}
