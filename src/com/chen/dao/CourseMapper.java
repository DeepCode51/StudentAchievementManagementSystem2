package com.chen.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.chen.pojo.Course;

public interface CourseMapper {
	
	//获取要更新课程的信息
	public Course queryCourseById(@Param("courseId") String id);
	
	//添加课程
	public int addCourseInfo(Course course);

	// 更新课程
	public int updateCourseInfo(Course course);

	// 删除课程
	public int deleteCourseInfoById(@Param("courseId")String id);
	
	//查询课程
	public List<Course> findByPage(HashMap<String,Object> map);

	//查询总条数
	public int selectCount(@Param("courseId")String id);
	
	public List<Course> query(HashMap<String,Object> map);
	
	public int selectcount(String id);
	
	public Course query1(String id);
}
