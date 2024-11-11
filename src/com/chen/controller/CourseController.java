package com.chen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.pojo.Course;
import com.chen.service.CourseService;

@Controller
@RequestMapping("/courseInfo")
public class CourseController {
	
	@Autowired
	private CourseService courseService;

	// 查询全部
	@RequestMapping("/queryCourse")
	public String findCourseInfo(Model model,@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,String id) {

		model.addAttribute("pagemsg",courseService.findByPage(currentPage, id));
		
		return "courseInfo";
	}

	// 添加课程
	@RequestMapping("/addCourse")
	public String AddCourseInfo(Course course) {

		int rows = courseService.addCourseInfo(course);
		if (rows > 0) {
			System.out.println("成功添加" + rows + "条数据！");
		} else {
			System.out.println("ִ添加失败");
		}
		return "redirect:queryCourse";
	}

	//更新课程
	@RequestMapping("/updateCourse")
	public String UpdateCourseInfo(Course course) {

		int rows = courseService.updateCourseInfo(course);
		if (rows > 0) {
			System.out.println("成功更新" + rows + "条数据！");
		} else {
			System.out.println("ִ更新失败");
		}
		return "redirect:queryCourse";
	}

	@RequestMapping("/update")
	public String findCourse(Course course1, Model model) {

		Course course = courseService.queryCourseById(course1.getCourseId());
		System.out.println(course);
		model.addAttribute("course", course);
		return "updateCourse";
	}

	// 删除课程
	@RequestMapping("/deleteCourse")
	@ResponseBody
	public String DeleteCourse(String id) {

		int rows = courseService.deleteCourseInfoById(id);
		if (rows > 0) {
			System.out.println("成功删除" + rows + "条数据！");
			return "OK";
		} else {
			System.out.println("ִ删除失败");
			return "F";
		}

		//return "redirect:queryCourse";
	}

	// 批量删除
	@RequestMapping("/delselected")
	public String DelCourse(HttpServletRequest request) {

		String[] name = request.getParameterValues("uid");
		int rs = 0;
		for (int i = 0; i < name.length; i++) {
			rs = rs + courseService.deleteCourseInfoById(name[i]);
		}
		if (rs > 0) {
			System.out.println("成功删除" + rs + "条数据！");
		} else {
			System.out.println("ִ删除失败");
		}

		return "redirect:queryCourse";
	}
	
	@RequestMapping("/queryById")
	public String QueryById(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("name");
		System.out.println(id);
		model.addAttribute("pagemsg",courseService.query(currentPage, id));
		
		return "courseInfo1";
		
	}

}
