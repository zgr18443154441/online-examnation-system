package com.shxt.module.record.dao;

import java.util.List;

import com.shxt.base.dao.BaseDao;
import com.shxt.module.record.model.StudentAnswer;
import com.shxt.module.record.model.StudentExamnation;

public interface RecordDao extends BaseDao{
	StudentAnswer search_single_choice(String namespace,Object role);
	StudentAnswer search_multiple_choice(String namespace,Object role);
	List<StudentAnswer> search_multiple_choices(String namespace,Object role);
	StudentExamnation search_examnation(String namespace,Object role);
	List<StudentExamnation> search_student_all(String namespace,String student_id);
	List<StudentExamnation> search_examnation_all(String namespace,String examnation_id);
	List<StudentAnswer> search_student(String namespace,Object role);
}
