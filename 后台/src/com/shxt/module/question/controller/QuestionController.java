package com.shxt.module.question.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.shxt.module.book.service.BookService;
import com.shxt.module.question.model.Question;
import com.shxt.module.question.model.QuestionType;
import com.shxt.module.question.service.QuestionService;
import com.shxt.module.user.service.UserService;
import com.shxt.util.PageTool;

@Controller
@RequestMapping("question")
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	@Autowired
	private BookService bookService;
	@Autowired
	private UserService userService;
	@RequestMapping("page")
	public ModelAndView page(PageTool pageTool,String TYPE){
		return new ModelAndView("question/sel").addObject("questions", questionService.page(pageTool, TYPE)).addObject("question_type", questionService.type(TYPE)).addObject("courses", bookService.course_list()).addObject("phases", bookService.phase_list()).addObject("chapters1", bookService.chapter1_list()).addObject("chapters2", bookService.chapter2_list()).addObject("page", pageTool);
	}
	@RequestMapping("new_question")
	public ModelAndView new_question(PageTool pageTool){
		return new ModelAndView("question/new_sel").addObject("new_question", questionService.new_question(pageTool)).addObject("courses", bookService.course_list()).addObject("phases", bookService.phase_list()).addObject("chapters1", bookService.chapter1_list()).addObject("chapters2", bookService.chapter2_list()).addObject("page", pageTool).addObject("user", userService.list("1"));
	}
	@ResponseBody
	@RequestMapping("right")
	public List<?> right(String quetion_id){
		return questionService.right_choice(quetion_id);
	}
	@ResponseBody
	@RequestMapping("wrong")
	public List<?> wrong(String quetion_id){
		return questionService.wrong_choice(quetion_id);
	}
	@RequestMapping("to_add")
	public ModelAndView to_add(QuestionType questionType){
		switch (questionType.getId()) {
		case "1":
		case "2":
			return new ModelAndView("question/add_option").addObject("question_type", questionType).addObject("course", new Gson().toJson(bookService.course_list()));
		case "3":
		case "4":
		case "5":
			return new ModelAndView("question/add_answer").addObject("question_type", questionType).addObject("course", new Gson().toJson(bookService.course_list()));
		case "6":
			return new ModelAndView("question/add_blank").addObject("question_type", questionType).addObject("course", new Gson().toJson(bookService.course_list()));
		}
		return null;
	}
	@RequestMapping("add")
	public ModelAndView add(PageTool pageTool,Question question,String[] right,String[] wrong,String[] blanks,MultipartFile picture_file,HttpServletRequest request,HttpSession session){
		switch (question.getTYPE()) {
		case "1":
		case "2":
			questionService.add_option(question, right, wrong,picture_file,request,(String)session.getAttribute("user_type"));
			break;
		case "3":
		case "4":
		case "5":
			questionService.add_answer(question,picture_file,request,(String)session.getAttribute("user_type"));
			break;
		case "6":
			questionService.add_blank(question, blanks,picture_file,request,(String)session.getAttribute("user_type"));
			break;
		}
		return this.page(pageTool, question.getTYPE());
	}
	@RequestMapping("serch_right")
	public List<?> serch_right(String question_id){
		return questionService.right_choice(question_id);
	}
	@RequestMapping("serch_wrong")
	public List<?> serch_wrong(String question_id){
		return questionService.wrong_choice(question_id);
	}
	
	@RequestMapping("serch_chapter2")
	public ModelAndView serch_chapter2(String chapter2,PageTool pageTool){
		return new ModelAndView("question/chapter2_sel").addObject("questions", questionService.search_chapter2(pageTool, chapter2)).addObject("all_type", questionService.all_type()).addObject("chapter2", bookService.chapter2_list()).addObject("page", pageTool);
	}
	
	@RequestMapping("accept")
	public ModelAndView accept(Question question){
		questionService.accept(question);
		return this.new_question(new PageTool());
	}
	
	@RequestMapping("refuse")
	public ModelAndView refuse(Question question){
		questionService.refuse(question);
		return this.new_question(new PageTool());
	}
	
	@RequestMapping("type_count")
	@ResponseBody
	public Integer type_count(String TYPE){
		return questionService.type_count(TYPE);
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(String id){
		questionService.delete(id);
		return new ModelAndView("index").addObject("map", userService.index());
	}
	
	@RequestMapping("all_accept")
	public ModelAndView all_accept(PageTool pageTool){
		questionService.all_accept();
		return this.new_question(pageTool);
	}
}
