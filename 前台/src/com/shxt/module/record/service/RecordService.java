package com.shxt.module.record.service;

import java.util.List;

import com.shxt.module.record.model.StudentAnswer;
import com.shxt.module.record.model.StudentExamnation;

public interface RecordService {
	void record_single_choice(String student_id,String examnation_id,String question_id,String choice_id);
	void record_multiple_choice(String student_id,String examnation_id,String question_id,String choice_id);
	void record_judge(String student_id,String examnation_id,String question_id,String judgement);
	void record_filling(String student_id,String examnation_id,String question_id,String[] blanks);
	void record_answer(String student_id,String examnation_id,String question_id,String answer);
	void calculate(StudentExamnation studentExamnation);
	StudentExamnation search_examnation(String examnation_id,String student_id);
	List<StudentExamnation> search_student_all(String student_id);
	List<StudentAnswer> search_student_answers(String examnation_id,String student_id);
}
