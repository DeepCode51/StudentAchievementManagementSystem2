package com.chen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.pojo.Student;
import com.chen.service.StudentService;

@Controller
@RequestMapping("/studentInfo")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	//查询全部
	@RequestMapping("/query")
	public String findStudentInfo(Model model,@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,String id ) {

		model.addAttribute("pagemsg",studentService.findByPage(currentPage, id));
		
		return "studentInfo";
	}
	
	//添加学生
	@RequestMapping("/addstudent")
	public String AddStudentInfo(Student student,Model model) {
		
		Student student1 = studentService.queryStudetnById(student.getStudentId());
		if(student1==null) {
			int rows = studentService.addStudentInfo(student);
			if (rows > 0) {
				System.out.println("成功添加" + rows + "条数据！");
				model.addAttribute("msg", "添加成功！");
			} else {
				System.out.println("ִ添加失败");
				model.addAttribute("msg", "添加失败！");
			}
			return "redirect:query";
		}
		model.addAttribute("msg", "学号重复！");
		return "addstudentinfo";
	}
	
	//获取要更新的学生信息
	@RequestMapping("/update")
	public String findStudentInfo(Student student1 , Model model) {

		Student student = studentService.queryStudetnById(student1.getStudentId());
		System.out.println(student);
		model.addAttribute("student", student);
		return "updatestudent";
	}
	
	//更新学生
	@RequestMapping("/updatestudent")
	public String UpdateStudentinfo(Student student) {
		
		int rows = studentService.updateStudentInfo(student);
		if (rows > 0) {
			System.out.println("成功更新" + rows + "条数据！");
		} else {
			System.out.println("ִ更新失败");
		}
		return "redirect:query";
	}
	
	@RequestMapping("/update2")
	public String findStudent(Student student1 , Model model) {

		Student student = studentService.queryStudetnById(student1.getStudentId());
		System.out.println(student);
		model.addAttribute("student", student);
		return "updatestudent2";
	}
	@RequestMapping("/updatestudent2")
	public String UpdateStudent(Student student) {
		
		int rows = studentService.updateStudentInfo(student);
		if (rows > 0) {
			System.out.println("成功更新" + rows + "条数据！");
		} else {
			System.out.println("ִ更新失败");
		}
		return "redirect:queryByName";
	}
	
	//删除学生
	@RequestMapping("/deletestudent")
	@ResponseBody
	public String DeleteStudent(String id) {

		//String studentId = request.getParameter("studentId");
		
		int rows = studentService.deleteStudentInfoById(id);
		if (rows > 0) {
			System.out.println("成功删除" + rows + "条数据！");
			return "OK";
		} else {
			System.out.println("ִ删除失败");
			return "FAIL";
		}
		
		//return "redirect:query";
	}
	
	//批量删除
	@RequestMapping("/delselected")
	public String DelSelectedServlet(HttpServletRequest request) {
		
		String[] name = request.getParameterValues("uid");
		int rs = 0;
        for(int i=0;i<name.length;i++){
            rs = rs + studentService.deleteStudentInfoById(name[i]);
        }
        if (rs > 0) {
			System.out.println("成功删除" + rs + "条数据！");
		} else {
			System.out.println("ִ删除失败");
		}	
		
		return "redirect:query";
	}
	
	//重置学生密码
	@RequestMapping("/rest")
	@ResponseBody
	public String  RestServlet(String id) {
		
		int rows = studentService.restStudent(id);
		if (rows > 0) {
			System.out.println("成功重置" + rows + "条数据！");
			return "OK";
	    }else{
	        	
			System.out.println("ִ重置失败");
			return "FAIL";
		}
		//return "redirect:query";
	}
	
	//通过学号获取学生信息
	@RequestMapping("/queryByName")
	public String QueryById(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("name");
		System.out.println(id);
		model.addAttribute("student",studentService.queryStudetnById( id));
		
		return "user";
		
	}
}
