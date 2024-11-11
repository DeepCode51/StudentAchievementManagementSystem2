package com.chen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.dao.LoginMapper;
import com.chen.dao.StudentMapper;
import com.chen.pojo.Student;
import com.chen.pojo.User;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
	private StudentMapper studentMapper;
	
	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}

	public void setUserMapper(LoginMapper loginMapper) {
		this.loginMapper = loginMapper;
	}

	@Override
	public boolean login(String name, String password) {

		User user = loginMapper.findUserByName(name);
		System.out.println(user);
        if (user!=null&&user.getPassword().equals(password)){
        	System.out.println("获取用户名密码成功");
            return true; 
        }
        System.out.println("获取用户名密码失败");
        return false;
	}

	@Override
	public boolean studentlogin(String name, String password) {
		
		Student student = loginMapper.findUserById(name);
		System.out.println(student);
        if (student!=null&&student.getStudentPad().equals(password)){
        	System.out.println("获取用户名密码成功");
            return true; 
        }
        System.out.println("获取用户名密码失败");
        return false;
	}

	
	public Student queryStudentById(String loginUser) {
		return  studentMapper.queryStudentById(loginUser);
	}
		
     public int updateStudentPad(String id,String newPad) {
    	 return studentMapper.changePwd(id,newPad);
     }

     
    
}
