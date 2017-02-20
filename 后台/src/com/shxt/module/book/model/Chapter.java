package com.shxt.module.book.model;

public class Chapter {
	private String id;
	private String course_id;
	private String phase_id;
	private String parent_id;
	private String NAME;
	private int question_number;
	private int son_number;
	private int c_level;
	private int sort;
	private String state;
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getSon_number() {
		return son_number;
	}
	public void setSon_number(int son_number) {
		this.son_number = son_number;
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
	public String getPhase_id() {
		return phase_id;
	}
	public void setPhase_id(String phase_id) {
		this.phase_id = phase_id;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getQuestion_number() {
		return question_number;
	}
	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}
	public int getC_level() {
		return c_level;
	}
	public void setC_level(int c_level) {
		this.c_level = c_level;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
}
