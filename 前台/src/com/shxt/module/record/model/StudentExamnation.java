package com.shxt.module.record.model;

public class StudentExamnation {
	private String id;
	private String student_id;
	private String examnation_id;
	private int scores;
	private int time;
	private String state;
	private int max_score;
	private int min_score;
	private double average_score;
	private int index;
	private int size;
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getMax_score() {
		return max_score;
	}
	public void setMax_score(int max_score) {
		this.max_score = max_score;
	}
	public int getMin_score() {
		return min_score;
	}
	public void setMin_score(int min_score) {
		this.min_score = min_score;
	}
	public double getAverage_score() {
		return average_score;
	}
	public void setAverage_score(double average_score) {
		this.average_score = average_score;
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
