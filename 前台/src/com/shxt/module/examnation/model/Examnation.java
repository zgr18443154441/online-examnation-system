package com.shxt.module.examnation.model;

import java.util.List;

import com.shxt.module.group.model.Group;

public class Examnation {
	private String id;
	private String title;
	private int judge_number;
	private int judge_score;
	private int single_choice_number;
	private int single_choice_score;
	private int multiple_choice_number;
	private int multiple_choice_score;
	private int filling_blank_number;
	private int filling_blank_score;
	private int short_answer_number;
	private int short_answer_score;
	private int programme_number;
	private int programme_score;
	private int use_times;
	private String state;
	private String teacher_id;
	private String start_time;
	private String end_time;
	private long time;
	private String text_date;
	private List<Group> groups;
	private int scores;
	public int getScores() {
		return scores;
	}
	public void setScores(int scores) {
		this.scores = scores;
	}
	public long getTime() {
		return time;
	}
	public void setTime(long time) {
		this.time = time;
	}
	public List<Group> getGroups() {
		return groups;
	}
	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
	public String getText_date() {
		return text_date;
	}
	public void setText_date(String text_date) {
		this.text_date = text_date;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getJudge_number() {
		return judge_number;
	}
	public void setJudge_number(int judge_number) {
		this.judge_number = judge_number;
	}
	public int getJudge_score() {
		return judge_score;
	}
	public void setJudge_score(int judge_score) {
		this.judge_score = judge_score;
	}
	public int getSingle_choice_number() {
		return single_choice_number;
	}
	public void setSingle_choice_number(int single_choice_number) {
		this.single_choice_number = single_choice_number;
	}
	public int getSingle_choice_score() {
		return single_choice_score;
	}
	public void setSingle_choice_score(int single_choice_score) {
		this.single_choice_score = single_choice_score;
	}
	public int getMultiple_choice_number() {
		return multiple_choice_number;
	}
	public void setMultiple_choice_number(int multiple_choice_number) {
		this.multiple_choice_number = multiple_choice_number;
	}
	public int getMultiple_choice_score() {
		return multiple_choice_score;
	}
	public void setMultiple_choice_score(int multiple_choice_score) {
		this.multiple_choice_score = multiple_choice_score;
	}
	public int getFilling_blank_number() {
		return filling_blank_number;
	}
	public void setFilling_blank_number(int filling_blank_number) {
		this.filling_blank_number = filling_blank_number;
	}
	public int getFilling_blank_score() {
		return filling_blank_score;
	}
	public void setFilling_blank_score(int filling_blank_score) {
		this.filling_blank_score = filling_blank_score;
	}
	public int getShort_answer_number() {
		return short_answer_number;
	}
	public void setShort_answer_number(int short_answer_number) {
		this.short_answer_number = short_answer_number;
	}
	public int getShort_answer_score() {
		return short_answer_score;
	}
	public void setShort_answer_score(int short_answer_score) {
		this.short_answer_score = short_answer_score;
	}
	public int getProgramme_number() {
		return programme_number;
	}
	public void setProgramme_number(int programme_number) {
		this.programme_number = programme_number;
	}
	public int getProgramme_score() {
		return programme_score;
	}
	public void setProgramme_score(int programme_score) {
		this.programme_score = programme_score;
	}
	public int getUse_times() {
		return use_times;
	}
	public void setUse_times(int use_times) {
		this.use_times = use_times;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
