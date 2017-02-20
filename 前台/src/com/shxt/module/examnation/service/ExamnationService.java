package com.shxt.module.examnation.service;

import java.util.List;

import com.shxt.module.examnation.model.Examnation;
import com.shxt.module.examnation.model.ExamnationQuestion;
import com.shxt.module.question.model.Question;

public interface ExamnationService {
	List<Examnation> list_group(String student_id,String group_id);
	Examnation one(String id);
	List<ExamnationQuestion> search_sort(String examnation_id);
	List<Question> search_questions(String examnation_id);
	List<Examnation> list_history();
	
}
