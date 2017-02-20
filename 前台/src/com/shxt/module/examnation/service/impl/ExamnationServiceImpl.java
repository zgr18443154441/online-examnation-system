package com.shxt.module.examnation.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.examnation.dao.ExamnationDao;
import com.shxt.module.examnation.model.Examnation;
import com.shxt.module.examnation.model.ExamnationQuestion;
import com.shxt.module.examnation.service.ExamnationService;
import com.shxt.module.question.model.Question;
import com.shxt.module.question.service.QuestionService;
import com.shxt.module.record.service.RecordService;
import com.shxt.util.DateUtils;
@Service("examnationService")
public class ExamnationServiceImpl implements ExamnationService {
	@Autowired
	private ExamnationDao examnationDao;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private RecordService recordService;
	private List<Question> temp1;
	private Examnation temp3;
	private List<Examnation> temp4;
	
	@SuppressWarnings("unchecked")
	public List<Examnation> list_group(String student_id,String group_id){
		temp4 = new ArrayList<>();
		for(String e : (List<String>)examnationDao.list_key_role(Examnation.class.getName(),"list_group",group_id)){
			temp3 = this.one(e);
			if(DateUtils.parseDate(DateUtils.getDateTime()).getTime()>DateUtils.parseDate(temp3.getText_date()+" "+temp3.getStart_time()).getTime()&&DateUtils.parseDate(DateUtils.getDateTime()).getTime()<DateUtils.parseDate(temp3.getText_date()+" "+temp3.getEnd_time()).getTime()){
				if(recordService.search_examnation(e, student_id)==null){
					temp3.setState("2");
				}else{
					temp3.setState("3");
				}
			}else if(DateUtils.parseDate(DateUtils.getDateTime()).getTime()>DateUtils.parseDate(temp3.getText_date()+" "+temp3.getEnd_time()).getTime()){
				if(recordService.search_examnation(e, student_id)==null){
					temp3.setState("5");
				}else if(recordService.search_examnation(e, student_id).getState().equals("2")){
					temp3.setState("4");
				}else{
					temp3.setState("3");
				}
			}
			temp4.add(temp3);
		}
		return temp4;
	}
	
	public Examnation one(String id){
		temp3 = (Examnation)examnationDao.one(Examnation.class.getName(), id);
		temp3.setTime(DateUtils.parseDate(temp3.getText_date()+" "+temp3.getEnd_time()).getTime()-new Date().getTime());
		temp3.setScores(temp3.getSingle_choice_number()*temp3.getSingle_choice_score()+temp3.getMultiple_choice_number()*temp3.getMultiple_choice_score()+temp3.getJudge_number()*temp3.getJudge_score()+temp3.getFilling_blank_number()*temp3.getFilling_blank_score()+temp3.getShort_answer_number()*temp3.getShort_answer_score()+temp3.getProgramme_number()*temp3.getProgramme_score());
		return temp3;
	}
	
	@SuppressWarnings("unchecked")
	public List<ExamnationQuestion> search_sort(String examnation_id){
		return (List<ExamnationQuestion>)examnationDao.list_key_role(ExamnationQuestion.class.getName(),"search_examnation", examnation_id);
	}
	
	public List<Question> search_questions(String examnation_id){
		temp1 = new ArrayList<>();
		for(ExamnationQuestion e : this.search_sort(examnation_id)){
			temp1.add(questionService.one(e.getQuestion_id()));
		}
		return temp1;
	}
	
	@SuppressWarnings("unchecked")
	public List<Examnation> list_history(){
		temp4 = (List<Examnation>)examnationDao.list_key(Examnation.class.getName(), "list_history");
		for(Examnation e : temp4){
			e.setScores(e.getSingle_choice_number()*e.getSingle_choice_score()+e.getMultiple_choice_number()*e.getMultiple_choice_score()+e.getJudge_number()*e.getJudge_score()+e.getFilling_blank_number()*e.getFilling_blank_score()+e.getShort_answer_number()*e.getShort_answer_score()+e.getProgramme_number()*e.getProgramme_score());
		}
		return temp4;
	}

	
}
