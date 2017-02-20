package com.shxt.module.question.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.examnation.model.ExamnationQuestion;
import com.shxt.module.question.dao.QuestionDao;
import com.shxt.module.question.model.Question;
import com.shxt.module.question.model.QuestionChoice;
import com.shxt.module.question.service.QuestionService;
import com.shxt.util.DoubleTool;
@Service("questionService")
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionDao questionDao;
	private Map<String,String> map;
	private List<Question> temp1;
	private Question temp2;
	private List<QuestionChoice> temp3;
	private QuestionChoice temp4;
	
	
	
	public Question random_text(){
		return this.random(this.list_all());
	}
	
	public Question type_text(String TYPE){
		return this.random(this.list_Type(TYPE));
	}
	
	@SuppressWarnings("unchecked")
	public Question book_text(String id,int role){
		switch (role) {
		case 1:
			return this.random((List<Question>)questionDao.list_key_role(Question.class.getName(), "search_course", id));
		case 2:
			return this.random((List<Question>)questionDao.list_key_role(Question.class.getName(), "search_phase", id));
		case 3:
			return this.random((List<Question>)questionDao.list_key_role(Question.class.getName(), "search_chapter1", id));
		case 4:
			return this.random((List<Question>)questionDao.list_key_role(Question.class.getName(), "search_chapter2", id));
		}
		return null;
	}
	
	public Question random(List<Question> list){
		temp2 = list.get((int)(Math.random()*list.size()));
		if(temp2.getTYPE().equals("1")||temp2.getTYPE().equals("2")){
			temp2 = this.add_show_choice(temp2);
		}
		return temp2;
	}
	
	public Question add_show_choice(Question question){
		question.setShow_choice(new ArrayList<QuestionChoice>());
		temp3 = new ArrayList<QuestionChoice>();
		temp3.addAll(question.getRight_choice());
		temp3.addAll(question.getWrong_choice());
		char a = 'A';
		int size = temp3.size();
		for(int i = 0 ; i < size ; i++){
			temp4 = temp3.get((int)(Math.random()*temp3.size()));
			temp4.setSort(String.valueOf(a));
			question.getShow_choice().add(temp4);
			temp3.remove(temp4);
			a++;
		}
		return question;
	}
	
	@SuppressWarnings("unchecked")
	public List<Question> list_all(){
		temp1 = (List<Question>)questionDao.list_key(Question.class.getName(), "random");
		for(Question e : temp1){
			this.deal(e);
		}
		return temp1;
	}
	
	@SuppressWarnings("unchecked")
	public List<Question> list_Type(String TYPE){
		temp1 = (List<Question>)questionDao.list_role(Question.class.getName(), TYPE);
		for(Question e : temp1){
			this.deal(e);
		}
		return temp1;
	}
	
	public Question deal(Question question){
		if(question.getContent().length()>6){
			question.setCon_sub(question.getContent().substring(0, 6)+"……");
		}else{
			question.setCon_sub(question.getContent());
		}
		if(question.getAnalysis().length()>6){
			question.setAna_sub(question.getAnalysis().substring(0, 6)+"……");
		}else{
			question.setAna_sub(question.getAnalysis());
		}
		if(question.getUse_times()>0){
			question.setRight_percent(DoubleTool.divide((double)(question.getRight_times()*100), (double)question.getUse_times(), 2));
			if(question.getRight_percent()>90){
				question.setLEVEL(1);
			}else if(question.getRight_percent()>70){
				question.setLEVEL(2);
			}else if(question.getRight_percent()>50){
				question.setLEVEL(3);
			}else if(question.getRight_percent()>30){
				question.setLEVEL(4);
			}else if(question.getRight_percent()>10){
				question.setLEVEL(5);
			}
		}else{
			question.setLEVEL(0);
		}
		return question;
	}
	
	public Question one(String id){
		temp2 = (Question)questionDao.one(Question.class.getName(), id);
		if(temp2.getTYPE().equals("1")||temp2.getTYPE().equals("2")){
			temp2 = this.add_show_choice(temp2);
		}
		return temp2;
	}
	
	public void match_question(ExamnationQuestion examnationQuestion){
		questionDao.add(examnationQuestion,  ExamnationQuestion.class.getName());
	}
	
	public List<?> right_choice(String question_id){
		map = new HashMap<>();
		map.put("question_id", question_id);
		map.put("isright", "1");
		return questionDao.list_role(QuestionChoice.class.getName(), map);
	}
	
	
	public void use_up(String question_id){
		questionDao.use_up(question_id);
	}
	
	public void right_up(String question_id){
		questionDao.right_up(question_id);
	}

}
