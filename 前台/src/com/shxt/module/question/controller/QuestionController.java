package com.shxt.module.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.shxt.module.book.service.BookService;
import com.shxt.module.question.service.QuestionService;

@Controller
@RequestMapping("question")
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	@Autowired
	private BookService bookService;
	@Autowired
	
	@RequestMapping("select")
	public ModelAndView select(){
		return new ModelAndView("question/select").addObject("courses", new Gson().toJson(bookService.course_list()));
	}
	
	@RequestMapping("random_text")
	public ModelAndView random_text(){
		return new ModelAndView("question/text").addObject("text_style", "random_text").addObject("question", questionService.random_text());
	}
	
	@RequestMapping("type_text")
	public ModelAndView type_text(String TYPE){
		return new ModelAndView("question/text").addObject("text_style", "type_text").addObject("TYPE", TYPE).addObject("question", questionService.type_text(TYPE));
	}
	
	@RequestMapping("book_text")
	public ModelAndView book_text(String id,int role){
		return new ModelAndView("question/text").addObject("text_style", "book_text").addObject("id", id).addObject("role", role).addObject("question", questionService.book_text(id, role));
	}
	
	@RequestMapping("check")
	public ModelAndView check(String text_style,String TYPE,String id,String role,int question_type,String question_id,String single_choice,String[] multiple_choice,String judge,String answer,String[] filling_blank){
		ModelAndView mav = new ModelAndView("question/check").addObject("text_style",text_style).addObject("TYPE", TYPE).addObject("id", id).addObject("role", role).addObject("question", questionService.one(question_id)).addObject("courses", bookService.course_list()).addObject("phases", bookService.phase_list()).addObject("chapters1", bookService.chapter1_list()).addObject("chapters2", bookService.chapter2_list());
		switch (question_type) {
		case 1:
			return mav.addObject("text_answer", single_choice);
		case 2:
			return mav.addObject("text_answer", multiple_choice);
		case 3:
			return mav.addObject("text_answer", judge);
		case 4:
		case 5:
			return mav.addObject("text_answer", answer);
		case 6:
			return mav.addObject("text_answer", filling_blank);
		}
		return null;
	}
	
	
}
