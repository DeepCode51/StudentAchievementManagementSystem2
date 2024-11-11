package com.chen.pojo;

public class Course {
	
	private String id;
	private String courseId;  //课程号
	private String courseName;   //课程名
	private String schoolYear;   //学年
	private String teacher;   //任课教师
	private String creditHour; //学分
		
	public Course() {
		super();
	}

	public Course(String id, String courseId, String courseName, String schoolYear, String teacher, String creditHour) {
		super();
		this.id = id;
		this.courseId = courseId;
		this.courseName = courseName;
		this.schoolYear = schoolYear;
		this.teacher = teacher;
		this.creditHour = creditHour;
	}

	public String getSchoolYear() {
		return schoolYear;
	}

	public void setSchoolYear(String schoolYear) {
		this.schoolYear = schoolYear;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getCreditHour() {
		return creditHour;
	}

	public void setCreditHour(String creditHour) {
		this.creditHour = creditHour;
	}

	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", courseId=" + courseId + ", courseName=" + courseName + ", schoolYear="
				+ schoolYear + ", teacher=" + teacher + ", creditHour=" + creditHour + "]";
	}
	

}
