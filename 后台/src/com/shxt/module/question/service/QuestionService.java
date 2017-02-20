package com.shxt.module.question.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.shxt.module.examnation.model.ExamnationQuestion;
import com.shxt.module.question.model.Question;
import com.shxt.util.PageTool;

public interface QuestionService {
	Question one(String id);
	List<Question> list_Type(String TYPE);
	List<?> page(PageTool pageTool,String TYPE);
	Integer new_question_number();
	List<?> new_question(PageTool pageTool);
	Object type(String id);
	List<?> right_choice(String question_id);
	List<?> wrong_choice(String question_id);
	void add_option(Question question,String[] right,String[] wrong,MultipartFile picture,HttpServletRequest request,String user_type);
	void add_answer(Question question,MultipartFile picture,HttpServletRequest request,String user_type);
	void add_blank(Question question,String[] blanks,MultipartFile picture,HttpServletRequest request,String user_type);
	Integer type_count(String TYPE);
	List<?> search_chapter2(PageTool pageTool,String chapter2);
	List<?> all_type();
	void accept(Question question);
	void all_accept();
	void refuse(Question question);
	void match_question(ExamnationQuestion examnationQuestion);
	void delete(String id);
	void delete_course(String id);
	void delete_phase(String id);
	void delete_chapter1(String id);
	void delete_chapter2(String id);
}
