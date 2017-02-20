package com.shxt.module.examnation.model;

public class ExamnationQuestion {
	private String id;
	private String question_id;
	private String examnation_id;
	private int sort;
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getExamnation_id() {
		return examnation_id;
	}
	public void setExamnation_id(String examnation_id) {
		this.examnation_id = examnation_id;
	}
	public String getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}
}
