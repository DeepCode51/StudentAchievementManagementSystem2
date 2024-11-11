package com.chen.service;

import com.chen.pojo.Student;

public interface LoginService {

	boolean login(String name,String password);

	boolean studentlogin(String name,String password);
	
	public Student queryStudentById(String loginUser);
	
	public int updateStudentPad(String id,String newPad);

}