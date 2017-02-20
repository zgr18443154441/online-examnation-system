package com.shxt.module.question.model;

import java.util.List;

public class Question {
	private String id;
	private String content;
	private String con_sub;
	private String picture;
	private String answer;
	private String course;
	private String phase;
	private String chapter1;
	private String chapter2;
	private int use_times;
	private int right_times;
	private double right_percent;
	private int LEVEL;
	private String analysis;
	private String ana_sub;
	private String state;
	private String TYPE;
	private List<QuestionChoice> right_choice;
	private List<QuestionChoice> wrong_choice;
	private List<QuestionChoice> show_choice;
	private List<FillingBlank> filling_blank;
	private int blank_number;
	private String teacher_id;
	public int getBlank_number() {
		return blank_number;
	}
	public void setBlank_number(int blank_number) {
		this.blank_number = blank_number;
	}
	public List<QuestionChoice> getShow_choice() {
		return show_choice;
	}
	public void setShow_choice(List<QuestionChoice> show_choice) {
		this.show_choice = show_choice;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public List<QuestionChoice> getRight_choice() {
		return right_choice;
	}
	public void setRight_choice(List<QuestionChoice> right_choice) {
		this.right_choice = right_choice;
	}
	public List<QuestionChoice> getWrong_choice() {
		return wrong_choice;
	}
	public void setWrong_choice(List<QuestionChoice> wrong_choice) {
		this.wrong_choice = wrong_choice;
	}
	public List<FillingBlank> getFilling_blank() {
		return filling_blank;
	}
	public void setFilling_blank(List<FillingBlank> filling_blank) {
		this.filling_blank = filling_blank;
	}
	public String getPhase() {
		return phase;
	}
	public void setPhase(String phase) {
		this.phase = phase;
	}
	public String getChapter1() {
		return chapter1;
	}
	public void setChapter1(String chapter1) {
		this.chapter1 = chapter1;
	}
	public String getChapter2() {
		return chapter2;
	}
	public void setChapter2(String chapter2) {
		this.chapter2 = chapter2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCon_sub() {
		return con_sub;
	}
	public void setCon_sub(String con_sub) {
		this.con_sub = con_sub;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getUse_times() {
		return use_times;
	}
	public void setUse_times(int use_times) {
		this.use_times = use_times;
	}
	public int getRight_times() {
		return right_times;
	}
	public void setRight_times(int right_times) {
		this.right_times = right_times;
	}
	public double getRight_percent() {
		return right_percent;
	}
	public void setRight_percent(double right_percent) {
		this.right_percent = right_percent;
	}
	public int getLEVEL() {
		return LEVEL;
	}
	public void setLEVEL(int lEVEL) {
		LEVEL = lEVEL;
	}
	public String getAnalysis() {
		return analysis;
	}
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	public String getAna_sub() {
		return ana_sub;
	}
	public void setAna_sub(String ana_sub) {
		this.ana_sub = ana_sub;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
}
