package com.chen.pojo;

public class User {
	private String name;
	private String password;
	
	public User() {
		super();
	}
	public User(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}
	
	public User(String name) {
		super();
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", password=" + password + "]";
	}
	

}
