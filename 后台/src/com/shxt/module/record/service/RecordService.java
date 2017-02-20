package com.shxt.module.record.service;

import java.util.List;

import com.shxt.module.examnation.model.Examnation;
import com.shxt.module.record.model.StudentAnswer;
import com.shxt.module.record.model.StudentExamnation;

public interface RecordService {
	List<StudentExamnation> search_student_examnation(String examnation_id);
	List<StudentAnswer> search_student_answers(String examnation_id,String student_id);
	List<List<StudentAnswer>> value(String examnation_id,String teacher_id);
	void finish_score(String student_id,String examnation_id,String score);
	void finish_value(String examnation_id);
	Examnation deal_data(Examnation examnation);
}
