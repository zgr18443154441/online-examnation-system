package com.shxt.module.examnation.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
	private ExamnationQuestion examnationQuestion;
	private List<Question> temp1;
	private List<Examnation> temp2;
	private List<String> temp3;
	private Map<String,Object> map;
	
	public Examnation one(String id){
		return (Examnation)examnationDao.one(Examnation.class.getName(), id);
	}
	
	public List<?> list(){
		return examnationDao.list(Examnation.class.getName());
	}
	
	public List<?> untext(String teacher_id){
		return examnationDao.list_key_role(Examnation.class.getName(),"list_untext", teacher_id);
	}
	
	public List<?> list_teacher(String teacher_id){
		return examnationDao.list_key_role(Examnation.class.getName(),"list_teacher",teacher_id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Examnation> list_finish(String teacher_id){
		temp2 = (List<Examnation>)examnationDao.list_key_role(Examnation.class.getName(),"list_finish",teacher_id);
		for(Examnation e : temp2){
			recordService.deal_data(e);
		}
		return temp2;
	}
	
	public void add(Examnation examnation,String[] group_id){
		examnation.setId(UUID.randomUUID().toString());
		if("1".equals(examnation.getSet_style())){
			if(examnation.getShort_answer_number()==0&&examnation.getProgramme_number()==0){
				examnation.setRole("1");
			}else{
				examnation.setRole("2");
			}
		}
		examnationDao.add(examnation, Examnation.class.getName());
		for(String e : group_id){
			examnationDao.match_group(Examnation.class.getName(), UUID.randomUUID().toString(), examnation.getId(), e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void change_state(){
		for(Examnation examnation : (List<Examnation>)examnationDao.list(Examnation.class.getName())){
			if(DateUtils.parseDate(DateUtils.getDateTime()).getTime()>DateUtils.parseDate(examnation.getText_date()+" "+examnation.getEnd_time()).getTime()){
				if(examnation.getRole().equals("1")){
					examnationDao.update_key_role(Examnation.class.getName(), "update_4", examnation.getId());
				}else{
					examnationDao.update_key_role(Examnation.class.getName(), "update_3", examnation.getId());
				}
			}
		}
	}
	
	public void select_set(String examnation_id,String[] single_choices,String[] multiple_choices,String[] judgements,String[] filling_blanks,String[] short_answers,String[] programmes){
		Examnation temp = this.one(examnation_id);
		Map<String,Object> param = new HashMap<>();
		param.put("id", examnation_id);
		param.put("single_choice_number", single_choices==null?0:single_choices.length);
		param.put("multiple_choice_number", multiple_choices==null?0:multiple_choices.length);
		param.put("judge_number", judgements==null?0:judgements.length);
		param.put("filling_blank_number", filling_blanks==null?0:filling_blanks.length);
		param.put("short_answer_number", short_answers==null?0:short_answers.length);
		param.put("programme_number", programmes==null?0:programmes.length);
		//是否需要人工批改
		if(temp.getShort_answer_number()==0&&temp.getProgramme_number()==0){
			param.put("role", 1);
		}else{
			param.put("role", 2);
		}
		examnationDao.update_key_role(Examnation.class.getName(), "update_question_number", param);
		
		int index = 1;
		int temp_id = 0;
		int size = 0;
		if(single_choices!=null){
			temp3 = new ArrayList<>();
			for(String e : single_choices){
				temp3.add(e);
			}
			size = temp3.size();
			for(int i = 0 ; i < size ; i++){
				temp_id = (int)(Math.random()*temp3.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation_id);
				examnationQuestion.setQuestion_id(temp3.get(temp_id));
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(temp.getSingle_choice_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp3.remove(temp3.get(temp_id));
			}
		}
		if(multiple_choices!=null){
			temp3 = new ArrayList<>();
			for(String e : multiple_choices){
				temp3.add(e);
			}
			size = temp3.size();
			for(int i = 0 ; i < size ; i++){
				temp_id = (int)(Math.random()*temp3.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation_id);
				examnationQuestion.setQuestion_id(temp3.get(temp_id));
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(temp.getMultiple_choice_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp3.remove(temp3.get(temp_id));
			}
		}
		if(judgements!=null){
			temp3 = new ArrayList<>();
			for(String e : judgements){
				temp3.add(e);
			}
			size = temp3.size();
			for(int i = 0 ; i < size ; i++){
				temp_id = (int)(Math.random()*temp3.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation_id);
				examnationQuestion.setQuestion_id(temp3.get(temp_id));
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(temp.getJudge_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp3.remove(temp3.get(temp_id));
			}
		}
		if(filling_blanks!=null){
			temp3 = new ArrayList<>();
			for(String e : filling_blanks){
				temp3.add(e);
			}
			size = temp3.size();
			for(int i = 0 ; i < size ; i++){
				temp_id = (int)(Math.random()*temp3.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation_id);
				examnationQuestion.setQuestion_id(temp3.get(temp_id));
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(temp.getFilling_blank_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp3.remove(temp3.get(temp_id));
			}
		}
		if(short_answers!=null){
			temp3 = new ArrayList<>();
			for(String e : short_answers){
				temp3.add(e);
			}
			size = temp3.size();
			for(int i = 0 ; i < size ; i++){
				temp_id = (int)(Math.random()*temp3.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation_id);
				examnationQuestion.setQuestion_id(temp3.get(temp_id));
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(temp.getShort_answer_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp3.remove(temp3.get(temp_id));
			}
		}
		if(programmes!=null){
			temp3 = new ArrayList<>();
			for(String e : programmes){
				temp3.add(e);
			}
			size = temp3.size();
			for(int i = 0 ; i < size ; i++){
				temp_id = (int)(Math.random()*temp3.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation_id);
				examnationQuestion.setQuestion_id(temp3.get(temp_id));
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(temp.getProgramme_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp3.remove(temp3.get(temp_id));
			}
		}
	}
	
	public void random_set(Examnation examnation){
		int index = 1;
		int temp_id = 0;
		if(examnation.getSingle_choice_number()>0){
			temp1 = questionService.list_Type("1");
			for(int i=0; i<examnation.getSingle_choice_number(); i++){
				temp_id = (int)(Math.random()*temp1.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation.getId());
				examnationQuestion.setQuestion_id(temp1.get(temp_id).getId());
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(examnation.getSingle_choice_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp1.remove(temp1.get(temp_id));
			}
		}
		if(examnation.getMultiple_choice_number()>0){
			temp1 = questionService.list_Type("2");
			for(int i=0; i<examnation.getMultiple_choice_number(); i++){
				temp_id = (int)(Math.random()*temp1.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation.getId());
				examnationQuestion.setQuestion_id(temp1.get(temp_id).getId());
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(examnation.getMultiple_choice_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp1.remove(temp1.get(temp_id));
			}
		}
		if(examnation.getJudge_number()>0){
			temp1 = questionService.list_Type("3");
			for(int i=0; i<examnation.getJudge_number(); i++){
				temp_id = (int)(Math.random()*temp1.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation.getId());
				examnationQuestion.setQuestion_id(temp1.get(temp_id).getId());
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(examnation.getJudge_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp1.remove(temp1.get(temp_id));
			}
		}
		if(examnation.getFilling_blank_number()>0){
			temp1 = questionService.list_Type("6");
			for(int i=0; i<examnation.getFilling_blank_number(); i++){
				temp_id = (int)(Math.random()*temp1.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation.getId());
				examnationQuestion.setQuestion_id(temp1.get(temp_id).getId());
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(examnation.getFilling_blank_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp1.remove(temp1.get(temp_id));
			}
		}
		if(examnation.getShort_answer_number()>0){
			temp1 = questionService.list_Type("4");
			for(int i=0; i<examnation.getShort_answer_number(); i++){
				temp_id = (int)(Math.random()*temp1.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation.getId());
				examnationQuestion.setQuestion_id(temp1.get(temp_id).getId());
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(examnation.getShort_answer_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp1.remove(temp1.get(temp_id));
			}
		}
		if(examnation.getProgramme_number()>0){
			temp1 = questionService.list_Type("5");
			for(int i=0; i<examnation.getProgramme_number(); i++){
				temp_id = (int)(Math.random()*temp1.size());
				examnationQuestion = new ExamnationQuestion();
				examnationQuestion.setId(UUID.randomUUID().toString());
				examnationQuestion.setExamnation_id(examnation.getId());
				examnationQuestion.setQuestion_id(temp1.get(temp_id).getId());
				examnationQuestion.setSort(index);
				examnationQuestion.setScore(examnation.getProgramme_score());
				index++;
				questionService.match_question(examnationQuestion);
				temp1.remove(temp1.get(temp_id));
			}
		}
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
	
	/**
	 * 统计试卷总分
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Integer> list_sum_score(String teacher_id){
		temp2 = (List<Examnation>)this.untext(teacher_id);
		Map<String,Integer> sum_scores = new HashMap<>();
		for(Examnation e : temp2){
			List<ExamnationQuestion> temp = this.search_sort(e.getId());
			int sum = 0;
			for(ExamnationQuestion f : temp){
				sum += f.getScore();
			}
			sum_scores.put(e.getId(), sum);
		}
		return sum_scores;
	}
	
	public void change_question(String examnation_id,String old_question_id,String new_question_id){
		map = new HashMap<>();
		map.put("examnation_id", examnation_id);
		map.put("question_id", old_question_id);
		examnationQuestion = (ExamnationQuestion)examnationDao.one(ExamnationQuestion.class.getName(), map);
		examnationQuestion.setQuestion_id(new_question_id);
		examnationDao.update(ExamnationQuestion.class.getName(), examnationQuestion);
	}
	
	public void update_examnation_4(String examnation_id){
		examnationDao.update_key_role(Examnation.class.getName(), "update_4", examnation_id);
	}
	
	public void delete(String id){
		examnationDao.delete(Examnation.class.getName(), id);
		examnationDao.delete_key_role(Examnation.class.getName(), "delete_banji", id);
	}
	
	/**
	 *题目加分 
	 */
	public void question_score_up(String examnationQuestion_id){
		examnationDao.update_key_role(ExamnationQuestion.class.getName(), "score_up", examnationQuestion_id);
	}
	
	/**
	 *题目减分 
	 */
	public void question_score_down(String examnationQuestion_id){
		examnationDao.update_key_role(ExamnationQuestion.class.getName(), "score_down", examnationQuestion_id);
	}
}
