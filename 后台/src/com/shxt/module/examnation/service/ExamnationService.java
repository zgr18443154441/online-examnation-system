package com.shxt.module.examnation.service;

import java.util.List;
import java.util.Map;

import com.shxt.module.examnation.model.Examnation;
import com.shxt.module.examnation.model.ExamnationQuestion;
import com.shxt.module.question.model.Question;

public interface ExamnationService {
	void change_state();
	Examnation one(String id);
	List<?> list();
	List<?> untext(String teacher_id);
	List<?> list_teacher(String teacher_id);
	List<Examnation> list_finish(String teacher_id);
	void update_examnation_4(String examnation_id);
	void add(Examnation examnation,String[] group_id);
	void change_question(String examnation_id,String old_question_id,String new_question_id);
	void random_set(Examnation examnation);
	void select_set(String examnation_id,String[] single_choices,String[] multiple_choices,String[] judgements,String[] filling_blanks,String[] short_answers,String[] programmes);
	List<ExamnationQuestion> search_sort(String examnation_id);
	List<Question> search_questions(String examnation_id);
	Map<String,Integer> list_sum_score(String teacher_id);
	void delete(String id);
	void question_score_up(String examnationQuestion_id);
	void question_score_down(String examnationQuestion_id);
}
