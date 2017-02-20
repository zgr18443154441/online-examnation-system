package com.shxt.module.record.model;

import com.shxt.module.user.model.User;

public class StudentExamnation {
	private String id;
	private String student_id;
	private String examnation_id;
	private int scores;
	private int time;
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getExamnation_id() {
		return examnation_id;
	}
	public void setExamnation_id(String examnation_id) {
		this.examnation_id = examnation_id;
	}
	public int getScores() {
		return scores;
	}
	public void setScores(int scores) {
		this.scores = scores;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
}
