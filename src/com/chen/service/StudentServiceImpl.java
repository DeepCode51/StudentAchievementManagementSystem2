package com.chen.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.dao.StudentMapper;
import com.chen.pojo.Student;
import com.chen.untils.PageBean;

@Service
public class StudentServiceImpl implements StudentService {
	
	//调用dao层
	@Autowired
	private StudentMapper studentMapper;

	public void setStudentmapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}

	//添加学生信息
	@Override
	public int addStudentInfo(Student student) {
		return studentMapper.addStudentInfo(student);
	}

	//查询要更新的学生信息
	@Override
	public Student queryStudetnById(String id) {
		return studentMapper.queryStudentById(id);
	}
	
	//更新学生信息
	@Override
	public int updateStudentInfo(Student student) {
		return studentMapper.updateStudentInfo(student);
	}

	//删除学生信息
	@Override
	public int deleteStudentInfoById(String id) {	
		return studentMapper.deleteStudentInfoById(id);
	}

	//查询全部学生信息
	@Override
	public PageBean<Student> findByPage(int currentPage,String id) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<Student> pageBean = new PageBean<Student>();
		
        pageBean.setCurrPage(currentPage);//封装当前页
        pageBean.setId(id);
        
		int pageSize=7;//每页显示的数据数
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = studentMapper.selectCount(id);
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize); //向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		map.put("studentId",id);
		
		//封装每页显示的数据		
		List<Student> lists = studentMapper.findByPage(map);
		pageBean.setLists(lists);
		
		return pageBean;
	}

	@Override
	public int restStudent(String id) {
		return studentMapper.restStudent(id);
	}



	

}
