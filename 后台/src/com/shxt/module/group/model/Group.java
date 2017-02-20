package com.shxt.module.group.model;

import java.util.List;

import com.shxt.module.bussiness.model.Bussiness;
import com.shxt.module.user.model.User;

public class Group {
	private String id;
	private String NAME;
	private int student_number;
	private int boy_number;
	private String state;
	private String start_date;
	private String end_date;
	private String teacher_id;
	private List<User> students;
	private Bussiness bussiness;
	public Bussiness getBussiness() {
		return bussiness;
	}
	public void setBussiness(Bussiness bussiness) {
		this.bussiness = bussiness;
	}
	public List<User> getStudents() {
		return students;
	}
	public void setStudents(List<User> students) {
		this.students = students;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getStudent_number() {
		return student_number;
	}
	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}
	public int getBoy_number() {
		return boy_number;
	}
	public void setBoy_number(int boy_number) {
		this.boy_number = boy_number;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	
	
}
