package com.chen.pojo;

public class Score {
	
	private Integer id;
	private String studentId;
	private String courseId;
	private String score;
	private Student student;
	private Course course;
	
	public Score() {
		super();
	}
	public Score(Integer id,String studentId, String courseId, String score, Student student, Course course) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.courseId = courseId;
		this.score = score;
		this.student = student;
		this.course = course;
	}

	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Score [id=" + id + ", studentId=" + studentId + ", courseId=" + courseId + ", score=" + score
				+ ", student=" + student + ", course=" + course + "]";
	}
	
	
	
	

}
