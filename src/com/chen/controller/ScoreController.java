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
import com.chen.pojo.Score;
import com.chen.pojo.Student;
import com.chen.service.CourseService;
import com.chen.service.ScoreService;
import com.chen.service.StudentService;


@Controller
@RequestMapping("/scoreInfo")
public class ScoreController {
	
	@Autowired
	private ScoreService scoreService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseService;
	
	//查询全部信息
	@RequestMapping("/queryScore")
	public String findStudentInfo(Model model,@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,String id) {

		model.addAttribute("pagemsg",scoreService.findByPage(currentPage, id));
		
		return "StudentScores";
	}
	
	//添加成绩信息
	@RequestMapping("/addscore")
	public String AddCourseInfo(Score score,Model model) {
		
		Student student = studentService.queryStudetnById(score.getStudentId());
		
		if(student != null) {
			Course course = courseService.query1(score.getCourseId());
			if(course==null){
				model.addAttribute("msg", "该课程不存在!");
				System.out.println("课程不存在");
				return "addscoreinfo";
			}else {
				int rows = scoreService.addScoreInfo(score);
				if (rows > 0) {
					System.out.println("成功添加" + rows + "条数据！");
					model.addAttribute("msg","添加成功！");
				} else {
					System.out.println("ִ添加失败");
					model.addAttribute("msg","添加失败！");
				}
				return "redirect:queryScore";
			}
		}
		model.addAttribute("msg", "该学生不存在!");
		System.out.println("学生不存在");
		return "addscoreinfo";
	}

	// 更新成绩
	@RequestMapping("/updateScore")
	public String UpdateCourseInfo(Score score) {
		
		int rows = scoreService.updateScoreInfo(score);
		if (rows > 0) {
			System.out.println("成功更新" + rows + "条数据！");
		} else {
			System.out.println("ִ更新失败");
		}
		return "redirect:queryScore";
	}

	//获取要修改的成绩
	@RequestMapping("/update")
	public String findCourse(Score score1, Model model) {

		Score score = scoreService.queryScoreById(score1);
		System.out.println(score);
		model.addAttribute("score", score);
		return "updateScore";
	}

	//删除成绩
	@RequestMapping("/deleteScore")
	@ResponseBody
	public String DeleteCourse(String id) {

		int rows = scoreService.deleteScoreInfoById(id);
		if (rows > 0) {
			System.out.println("成功删除" + rows + "条数据！");
			return "OK";
		} else {
			System.out.println("ִ删除失败");
			return "F";
		}

		//return "redirect:queryScore";
	}

	//批量删除
	@RequestMapping("/delselected")
	public String DelCourse(HttpServletRequest request) {

		String[] name = request.getParameterValues("uid");
		int rs = 0;
		for (int i = 0; i < name.length; i++) {
			rs = rs + scoreService.deleteScoreInfoById(name[i]);
		}
		if (rs > 0) {
			System.out.println("成功删除" + rs + "条数据！");
		} else {
			System.out.println("ִ删除失败");
		}

		return "redirect:queryScore";
	}
	
	@RequestMapping("/queryById")
	public String QueryById(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("name");
		System.out.println(id);
		model.addAttribute("pagemsg",scoreService.findByPage(currentPage, id));
		
		return "StudentScores2";
		
	}
}
