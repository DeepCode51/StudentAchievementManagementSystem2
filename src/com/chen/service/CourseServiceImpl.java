package com.chen.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.dao.CourseMapper;
import com.chen.pojo.Course;
import com.chen.untils.PageBean;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;
	
	public void setCourseMapper(CourseMapper courseMapper) {
		this.courseMapper = courseMapper;
	}

	//添加课程
	@Override
	public int addCourseInfo(Course course) {
		return courseMapper.addCourseInfo(course);
	}
	
	//更新课程
	@Override
	public int updateCourseInfo(Course course) {
		return courseMapper.updateCourseInfo(course);
	}

	//删除课程
	@Override
	public int deleteCourseInfoById(String id) {
		return courseMapper.deleteCourseInfoById(id);
	}

	//获取要更新课程的信息
	@Override
	public Course queryCourseById(String id) {
		return courseMapper.queryCourseById(id);
	}

	//查询课程
	@Override
	public PageBean<Course> findByPage(int currentPage,String id) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<Course> pageBean = new PageBean<Course>();
		
		pageBean.setId(id);
        pageBean.setCurrPage(currentPage);//封装当前页数
        
		int pageSize=7;//每页显示的数据
		pageBean.setPageSize(7);
		
		//封装记录总数
		int totalCount = courseMapper.selectCount(id);
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		map.put("courseId",id);
		
		//封装每页显示的数据
		List<Course> lists = courseMapper.findByPage(map);
		pageBean.setLists(lists);
		
		return pageBean;
	}

	@Override
	public PageBean<Course> query(int currentPage,String id) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<Course> pageBean = new PageBean<Course>();
		
		pageBean.setId(id);
        pageBean.setCurrPage(currentPage);//封装当前页数
        
		int pageSize=7;//每页显示的数据
		pageBean.setPageSize(7);
		
		//封装记录总数
		int totalCount = courseMapper.selectcount(id);
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		map.put("id",id);
		
		//封装每页显示的数据
		List<Course> lists = courseMapper.query(map);
		pageBean.setLists(lists);
		
		return pageBean;
	}

	@Override
	public Course query1(String id) {
		
		return courseMapper.query1(id);
	}

}
