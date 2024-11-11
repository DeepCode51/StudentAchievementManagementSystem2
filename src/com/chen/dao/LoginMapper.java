package com.chen.dao;

import com.chen.pojo.Student;
import com.chen.pojo.User;

public interface LoginMapper {
	public User findUserByName(String name);
	
	public Student findUserById(String studentId);
}
