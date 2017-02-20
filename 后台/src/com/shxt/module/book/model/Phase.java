package com.shxt.module.book.model;

public class Phase {
	private String id;
	private String course_id;
	private String NAME;
	private int sort;
	private String state;
	private int chapter1_number;
	private int question_number;
	public int getQuestion_number() {
		return question_number;
	}
	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}
	public int getChapter1_number() {
		return chapter1_number;
	}
	public void setChapter1_number(int chapter1_number) {
		this.chapter1_number = chapter1_number;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
}
