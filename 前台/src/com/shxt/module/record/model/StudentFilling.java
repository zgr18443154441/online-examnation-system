package com.shxt.module.record.model;

public class StudentFilling {
	private String id;
	private String filling;
	private int location;
	private String answer_id;
	public String getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(String answer_id) {
		this.answer_id = answer_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFilling() {
		return filling;
	}
	public void setFilling(String filling) {
		this.filling = filling;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
}
