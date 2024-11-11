package com.chen.service;

import org.apache.ibatis.annotations.Param;
import com.chen.pojo.Course;
import com.chen.untils.PageBean;

public interface CourseService {

	//获取要修改的课程信息
	public Course queryCourseById(String id);

	//查询课程
	public PageBean<Course> findByPage(int currentPage,String id);
	
	//添加课程
	public int addCourseInfo(Course course);

	//更新课程
	public int updateCourseInfo(Course course);

	//删除课程
	public int deleteCourseInfoById(@Param("courseId") String id);
	
	public PageBean<Course> query(int currentPage,String id);
	
	public Course query1(String id);

}
