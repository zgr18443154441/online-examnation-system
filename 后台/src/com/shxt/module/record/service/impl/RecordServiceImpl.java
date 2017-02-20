package com.shxt.module.record.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.examnation.model.Examnation;
import com.shxt.module.examnation.service.ExamnationService;
import com.shxt.module.group.model.Group;
import com.shxt.module.group.service.GroupService;
import com.shxt.module.record.dao.RecordDao;
import com.shxt.module.record.model.StudentAnswer;
import com.shxt.module.record.model.StudentExamnation;
import com.shxt.module.record.service.RecordService;
import com.shxt.module.user.model.User;
import com.shxt.util.DoubleTool;
@Service("recordService")
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordDao recordDao;
	@Autowired
	private ExamnationService examnationService;
	@Autowired
	private GroupService groupService;
	private List<List<StudentAnswer>> temp6;
	private List<User> temp7;
	private StudentExamnation temp8;
	private Map<String,String> map;
	
	
	
	@SuppressWarnings("unchecked")
	public List<Examnation> to_value(String teacher_id){
		return (List<Examnation>)examnationService.list_teacher(teacher_id);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<List<StudentAnswer>> value(String examnation_id,String teacher_id){
		temp6 = new ArrayList<>();
		map = new HashMap<>();
		map.put("examnation_id", examnation_id);
		temp7 = new ArrayList<>();
		for(Group e : (List<Group>)groupService.list_teacher(teacher_id)){
			temp7.addAll(e.getStudents());
		}
		for(User e : temp7){
			map.put("student_id", e.getId());
			if(recordDao.search_student(StudentAnswer.class.getName(), map).size()!=0){
				temp6.add(recordDao.search_student(StudentAnswer.class.getName(), map));
			}
		}
		return temp6;
	}
	
	public void finish_score(String student_id,String examnation_id,String score){
		map = new HashMap<>();
		map.put("student_id", student_id);
		map.put("examnation_id", examnation_id);
		temp8 = recordDao.search_examnation_one(StudentExamnation.class.getName(), map);
		temp8.setScores(Integer.parseInt(score)+temp8.getScores());
		recordDao.update(StudentExamnation.class.getName(), temp8);
		recordDao.upload(StudentExamnation.class.getName(), map);
	}
	
	public void finish_value(String examnation_id){
		examnationService.update_examnation_4(examnation_id);
	}
	
	public List<StudentExamnation> search_student_examnation(String examnation_id){
		return recordDao.search_examnation(StudentExamnation.class.getName(), examnation_id);
	}
	
	public List<StudentAnswer> search_student_answers(String examnation_id,String student_id){
		map = new HashMap<>();
		map.put("examnation_id", examnation_id);
		map.put("student_id", student_id);
		return recordDao.search_student(StudentAnswer.class.getName(), map);
	}
	
	
	public Examnation deal_data(Examnation examnation){
		List<StudentExamnation> list = this.search_student_examnation(examnation.getId());
		examnation.setAll_score(examnation.getSingle_choice_number()*examnation.getSingle_choice_score()+examnation.getMultiple_choice_number()*examnation.getMultiple_choice_score()+examnation.getJudge_number()*examnation.getJudge_score()+examnation.getFilling_blank_number()*examnation.getFilling_blank_score()+examnation.getShort_answer_number()*examnation.getShort_answer_score()+examnation.getProgramme_number()*examnation.getProgramme_score());
		int max_score  = 0;
		int min_score  = examnation.getAll_score();
		double average_score  = 0;
		double sum = 0;
		for(StudentExamnation e : list){
			if(e.getScores()>max_score){
				max_score = e.getScores();
				examnation.setMax_score(max_score);
				examnation.setMax_id(e.getStudent_id());
			}
			if(e.getScores()<min_score){
				min_score = e.getScores();
				examnation.setMin_score(min_score);
				examnation.setMin_id(e.getStudent_id());
			}
			sum+= e.getScores();
		}
		average_score = DoubleTool.divide(sum, list.size(), 2);
		examnation.setAverage_score(average_score);
		return examnation;
	}
	
}
