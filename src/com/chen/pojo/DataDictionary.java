package com.chen.pojo;

public class DataDictionary {
	private int id;
	private String collegeId;
	private String collgte;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	public String getCollgte() {
		return collgte;
	}
	public void setCollgte(String collgte) {
		this.collgte = collgte;
	}
	@Override
	public String toString() {
		return "DataDictionary [id=" + id + ", collegeId=" + collegeId + ", collgte=" + collgte + "]";
	}
	public DataDictionary(int id, String collegeId, String collgte) {
		super();
		this.id = id;
		this.collegeId = collegeId;
		this.collgte = collgte;
	}
	public DataDictionary() {
		super();
	}
	
	

}
