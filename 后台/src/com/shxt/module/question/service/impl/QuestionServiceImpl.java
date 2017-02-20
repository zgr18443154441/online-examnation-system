package com.shxt.module.question.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shxt.module.book.service.BookService;
import com.shxt.module.examnation.model.ExamnationQuestion;
import com.shxt.module.question.dao.QuestionDao;
import com.shxt.module.question.model.FillingBlank;
import com.shxt.module.question.model.Question;
import com.shxt.module.question.model.QuestionChoice;
import com.shxt.module.question.model.QuestionType;
import com.shxt.module.question.service.QuestionService;
import com.shxt.util.DoubleTool;
import com.shxt.util.PageTool;
import com.shxt.util.UploadTool;
@Service("questionService")
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private BookService bookService;
	private QuestionType question_type;
	private Map<String,String> map;
	private QuestionChoice questionChoice;
	private FillingBlank fillingBlank;
	
	public Question one(String id){
		return (Question)questionDao.one(Question.class.getName(), id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Question> list_Type(String TYPE){
		return this.deal((List<Question>)questionDao.list_role(Question.class.getName(), TYPE));
	}
	
	public List<Question> deal(List<Question> list){
		for(Question e : list){
			if(e.getAnalysis()==""){
				e.setAna_sub("无");
			}else{
				boolean notfound = true;
				for(int i=0; i<e.getAnalysis().split("").length; i++){
					if(Pattern.matches(">", String.valueOf(e.getAnalysis().charAt(i)))){
						e.setAna_sub(e.getAnalysis().substring(i+1,i+6)+"……");
						notfound = false;
						break;
					}
				}
				if(notfound){
					if(e.getAnalysis().length()>8){
						e.setAna_sub(e.getAnalysis().substring(0,6)+"……");
					}else{
						e.setAna_sub(e.getAnalysis());
					}
				}
			}
			boolean notfound = true;
			for(int i=0; i<e.getContent().split("").length; i++){
				if(Pattern.matches(">", String.valueOf(e.getContent().charAt(i)))){
					e.setCon_sub(e.getContent().substring(i+1,i+6)+"……");
					notfound = false;
					break;
				}
			}
			if(notfound){
				if(e.getContent().length()>8){
					e.setCon_sub(e.getContent().substring(0,6)+"……");
				}else{
					e.setCon_sub(e.getContent());
				}
			}
			if(!e.getTYPE().equals("4")&&!e.getTYPE().equals("5")&&e.getUse_times()>0){
				e.setRight_percent(DoubleTool.divide((double)(e.getRight_times()*100), (double)e.getUse_times(), 2));
				if(e.getRight_percent()>90){
					e.setLEVEL(1);
				}else if(e.getRight_percent()>70){
					e.setLEVEL(2);
				}else if(e.getRight_percent()>50){
					e.setLEVEL(3);
				}else if(e.getRight_percent()>30){
					e.setLEVEL(4);
				}else if(e.getRight_percent()>10){
					e.setLEVEL(5);
				}
			}else{
				e.setLEVEL(0);
			}
		}
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<?> page(PageTool pageTool,String TYPE){
		pageTool.setSize(5);
		return this.deal((List<Question>)questionDao.page(Question.class.getName(), pageTool, TYPE));
	}
	@SuppressWarnings("unchecked")
	public List<?> search_chapter2(PageTool pageTool,String chapter2){
		pageTool.setSize(5);
		return this.deal((List<Question>)questionDao.search_chapter2(Question.class.getName(), pageTool, chapter2));
	}
	public Integer new_question_number(){
		return (Integer)questionDao.one_key_role(Question.class.getName(), "new_number", null);
	}
	
	@SuppressWarnings("unchecked")
	public List<?> new_question(PageTool pageTool){
		pageTool.setSize(5);
		return this.deal((List<Question>)questionDao.new_question(Question.class.getName(), pageTool));
	}
	
	public Object type(String id){
		return questionDao.one(QuestionType.class.getName(), id);
	}
	
	public List<?> right_choice(String question_id){
		map = new HashMap<>();
		map.put("question_id", question_id);
		map.put("isright", "1");
		return questionDao.list_role(QuestionChoice.class.getName(), map);
	}
	
	public List<?> wrong_choice(String question_id){
		map = new HashMap<>();
		map.put("question_id", question_id);
		map.put("isright", "0");
		return questionDao.list_role(QuestionChoice.class.getName(), map);
	}
	
	public void add_option(Question question,String[] right,String[] wrong,MultipartFile picture,HttpServletRequest request,String user_type){
		String question_id = UUID.randomUUID().toString();
		question.setId(question_id);
		question.setPicture(UploadTool.upload(picture, request));
		if(user_type.equals("1")){
			question.setState("2");
		}else{
			question.setState("1");
			this.number_plus(question);
		}
		questionDao.add(question, Question.class.getName());
		for(String e: right){
			questionChoice = new QuestionChoice();
			questionChoice.setContent(e);
			questionChoice.setId(UUID.randomUUID().toString());
			questionChoice.setIsright("1");
			questionChoice.setQuestion_id(question_id);
			questionDao.add(questionChoice, QuestionChoice.class.getName());
		}
		for(String e: wrong){
			questionChoice = new QuestionChoice();
			questionChoice.setContent(e);
			questionChoice.setId(UUID.randomUUID().toString());
			questionChoice.setIsright("0");
			questionChoice.setQuestion_id(question_id);
			questionDao.add(questionChoice, QuestionChoice.class.getName());
		}
	}
	
	public void add_answer(Question question,MultipartFile picture,HttpServletRequest request,String user_type){
		question.setId(UUID.randomUUID().toString());
		question.setPicture(UploadTool.upload(picture, request));
		if(user_type.equals("1")){
			question.setState("2");
		}else{
			question.setState("1");
			this.number_plus(question);
		}
		questionDao.add(question, Question.class.getName());
	}
	
	public void add_blank(Question question,String[] blanks,MultipartFile picture,HttpServletRequest request,String user_type){
		String question_id = UUID.randomUUID().toString();
		question.setId(question_id);
		question.setPicture(UploadTool.upload(picture, request));
		if(user_type.equals("1")){
			question.setState("2");
		}else{
			question.setState("1");
			this.number_plus(question);
		}
		questionDao.add(question, Question.class.getName());
		for(int i=0;i<blanks.length;i++){
			fillingBlank = new FillingBlank();
			fillingBlank.setContent(blanks[i]);
			fillingBlank.setId(UUID.randomUUID().toString());
			fillingBlank.setQuestion_id(question_id);
			fillingBlank.setLocation(i);
			questionDao.add(fillingBlank, FillingBlank.class.getName());
		}
	}
	
	public List<?> all_type(){
		return questionDao.list(QuestionType.class.getName());
	}
	
	public void number_plus(Question question){
		bookService.number_plus(question);
		question_type = (QuestionType)this.type(question.getTYPE());
		question_type.setType_number(question_type.getType_number()+1);
		questionDao.update(QuestionType.class.getName(), question_type);
	}
	
	public void accept(Question question){
		questionDao.accept(Question.class.getName(), question);
		this.number_plus(question);
	}
	
	@SuppressWarnings("unchecked")
	public void all_accept(){
		List<Question> temp = (List<Question>)questionDao.list_key(Question.class.getName(), "new_question_all");
		for(Question e : temp){
			this.accept(e);
		}
	}
	
	public void refuse(Question question){
		questionDao.refuse(Question.class.getName(), question);
	}
	
	public Integer type_count(String TYPE){
		return questionDao.count(Question.class.getName(), TYPE);
	}
	
	public void match_question(ExamnationQuestion examnationQuestion){
		questionDao.add(examnationQuestion,  ExamnationQuestion.class.getName());
	}
	
	public void delete(String id){
		questionDao.delete(Question.class.getName(), id);
	}
	
	public void delete_course(String id){
		questionDao.update_key_role(Question.class.getName(), "delete_course", id);
	}
	
	public void delete_phase(String id){
		questionDao.update_key_role(Question.class.getName(), "delete_phase", id);
	}
	
	public void delete_chapter1(String id){
		questionDao.update_key_role(Question.class.getName(), "delete_chapter1", id);
	}
	
	public void delete_chapter2(String id){
		questionDao.update_key_role(Question.class.getName(), "delete_chapter2", id);
	}
}
