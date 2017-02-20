package com.shxt.module.question.service;

import java.util.List;

import com.shxt.module.examnation.model.ExamnationQuestion;
import com.shxt.module.question.model.Question;

public interface QuestionService {
	Question random_text();
	Question type_text(String TYPE);
	Question book_text(String id,int role);
	Question one(String id);
	List<Question> list_Type(String TYPE);
	List<?> right_choice(String question_id);
	void match_question(ExamnationQuestion examnationQuestion);
	void use_up(String question_id);
	void right_up(String question_id);
}
