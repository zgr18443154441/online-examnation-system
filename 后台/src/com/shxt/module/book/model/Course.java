package com.shxt.module.book.model;

public class Course {
	private String id;
	private String NAME;
	private int phase_number;
	private int question_number;
	private String state;
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
	public int getPhase_number() {
		return phase_number;
	}
	public void setPhase_number(int chapter_number) {
		this.phase_number = chapter_number;
	}
	public int getQuestion_number() {
		return question_number;
	}
	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
