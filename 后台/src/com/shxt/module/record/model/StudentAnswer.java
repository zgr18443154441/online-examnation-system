package com.shxt.module.record.model;

import java.util.List;

public class StudentAnswer {
	private String id;
	private String question_id;
	private String student_id;
	private String examnation_id;
	private String single_choice_id;
	private String multiple_choice_id;
	private String answer;
	private List<StudentFilling> fillings;
	public List<StudentFilling> getFillings() {
		return fillings;
	}
	public void setFillings(List<StudentFilling> fillings) {
		this.fillings = fillings;
	}
	public String getSingle_choice_id() {
		return single_choice_id;
	}
	public void setSingle_choice_id(String single_choice_id) {
		this.single_choice_id = single_choice_id;
	}
	public String getMultiple_choice_id() {
		return multiple_choice_id;
	}
	public void setMultiple_choice_id(String multiple_choice_id) {
		this.multiple_choice_id = multiple_choice_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
