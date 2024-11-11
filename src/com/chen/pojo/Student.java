package com.chen.pojo;

public class Student {
	private String studentId;  
    private String studentName;  
    private String studentSex; 
    private String studentAge;  
    private String studentBifthday; 
    private String studentDept;  
    private String studentMajor;  
    private String studentClassId; 
    private String studentCellPhone; 
    private String studentPad;

    
    public Student() {
		super();
	}

	public Student(String studentId, String studentName, String studentSex, String studentAge, String studentBifthday,
			String studentDept, String studentMajor, String studentClassId, String studentCellPhone,String studentPad) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.studentSex = studentSex;
		this.studentAge = studentAge;
		this.studentBifthday = studentBifthday;
		this.studentDept = studentDept;
		this.studentMajor = studentMajor;
		this.studentClassId = studentClassId;
		this.studentCellPhone = studentCellPhone;
		this.studentPad = studentPad;
	}

	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}
	public String getStudentAge() {
		return studentAge;
	}
	public void setStudentAge(String studentAge) {
		this.studentAge = studentAge;
	}
	public String getStudentDept() {
		return studentDept;
	}
	public void setStudentDept(String studentDept) {
		this.studentDept = studentDept;
	}
	public String getStudentMajor() {
		return studentMajor;
	}
	public void setStudentMajor(String studentMajor) {
		this.studentMajor = studentMajor;
	}
	public String getStudentClassId() {
		return studentClassId;
	}
	public void setStudentClassId(String studentClassId) {
		this.studentClassId = studentClassId;
	}
	public String getStudentCellPhone() {
		return studentCellPhone;
	}
	public void setStudentCellPhone(String studentCellPhone) {
		this.studentCellPhone = studentCellPhone;
	}

	public String getStudentBifthday() {
		return studentBifthday;
	}

	public void setStudentBifthday(String studentBifthday) {
		this.studentBifthday = studentBifthday;
	}

	public String getStudentPad() {
		return studentPad;
	}

	public void setStudentPad(String studentPad) {
		this.studentPad = studentPad;
	}

	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", studentName=" + studentName + ", studentSex=" + studentSex
				+ ", studentAge=" + studentAge + ", studentBifthday=" + studentBifthday + ", studentDept=" + studentDept
				+ ", studentMajor=" + studentMajor + ", studentClassId=" + studentClassId + ", studentCellPhone="
				+ studentCellPhone + ", studentPad=" + studentPad + "]";
	}

}
