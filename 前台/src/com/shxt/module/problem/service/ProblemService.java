package com.shxt.module.problem.service;

import java.util.List;

import com.shxt.module.problem.model.Problem;

public interface ProblemService {
	void add(Problem problem,String course,String phase,String chapter1,String chapter2,String student_id);
	List<?> list_student(String student_id);
	void delete(String id);
}
