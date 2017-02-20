package com.shxt.module.examnation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.module.book.service.BookService;
import com.shxt.module.examnation.model.Examnation;
import com.shxt.module.examnation.service.ExamnationService;
import com.shxt.module.group.service.GroupService;
import com.shxt.module.question.service.QuestionService;
import com.shxt.module.user.service.UserService;

@Controller
@RequestMapping("examnation")
public class ExamnationController {
	@Autowired
	private ExamnationService examnationService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private BookService bookService;
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("to_add")
	public ModelAndView to_add(){
		return new ModelAndView("examnation/add").addObject("group", groupService.list_teacher((String)session.getAttribute("id")));
	}
	
	@RequestMapping("to_set")
	public ModelAndView to_set(Examnation examnation,String[] group_id){
		examnationService.add(examnation,group_id);
		switch (examnation.getSet_style()) {
		case "1":
			examnationService.random_set(examnation);
			return this.to_sel(examnation.getId());
		case "2":
			return new ModelAndView("examnation/select").addObject("examnation", examnation).addObject("user", userService.list("1")).addObject("single_choices", questionService.list_Type("1")).addObject("multiple_choices", questionService.list_Type("2")).addObject("judgements", questionService.list_Type("3")).addObject("short_answers", questionService.list_Type("4")).addObject("programmes", questionService.list_Type("5")).addObject("filling_blanks", questionService.list_Type("6")).addObject("courses", bookService.course_list()).addObject("phases", bookService.phase_list()).addObject("chapters1", bookService.chapter1_list()).addObject("chapters2", bookService.chapter2_list());
		}
		return null;
	}
	
	@RequestMapping("select")
	public ModelAndView to_sel(String examnation_id,String[] single_choices,String[] multiple_choices,String[] judgements,String[] filling_blanks,String[] short_answers,String[] programmes){
		examnationService.select_set(examnation_id, single_choices, multiple_choices, judgements, filling_blanks, short_answers, programmes);
		return this.to_sel(examnation_id);
	}
	
	@RequestMapping("to_list")
	public ModelAndView to_list(){
		return new ModelAndView("examnation/list").addObject("examnations", examnationService.untext((String)session.getAttribute("id"))).addObject("sum_scores", examnationService.list_sum_score((String)session.getAttribute("id")));
	}
	
	@RequestMapping("to_sel")
	public ModelAndView to_sel(String id){
		return new ModelAndView("examnation/sel").addObject("questions", examnationService.search_questions(id)).addObject("sort", examnationService.search_sort(id)).addObject("examnation", examnationService.one(id));
	}
	
	@RequestMapping("to_change")
	public ModelAndView to_change(String examnation_id,String question_id,String TYPE){
		return new ModelAndView("examnation/change").addObject("questions", questionService.list_Type(TYPE)).addObject("examnation_id", examnation_id).addObject("old_question_id", question_id).addObject("TYPE", TYPE).addObject("courses", bookService.course_list()).addObject("phases", bookService.phase_list()).addObject("chapters1", bookService.chapter1_list()).addObject("chapters2", bookService.chapter2_list()).addObject("user", userService.list("1"));
	}
	
	@RequestMapping("change")
	public ModelAndView change(String examnation_id,String old_question_id,String new_question_id){
		examnationService.change_question(examnation_id, old_question_id, new_question_id);
		return this.to_sel(examnation_id);
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(String id){
		examnationService.delete(id);
		return this.to_add();
	}
	
	@RequestMapping("score_up")
	@ResponseBody
	public void score_up(String id){
		examnationService.question_score_up(id);
	}
	
	@RequestMapping("score_down")
	@ResponseBody
	public void score_down(String id){
		examnationService.question_score_down(id);
	}
}
