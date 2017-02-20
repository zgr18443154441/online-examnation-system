package com.shxt.module.problem.service;

import java.util.List;

import com.shxt.module.problem.model.Problem;

public interface ProblemService {
	Integer new_number(String teacher_id);
	Problem one(String id);
	List<?> list_teacher(String student_id);
	void update(String problem_id,String reply);
}
