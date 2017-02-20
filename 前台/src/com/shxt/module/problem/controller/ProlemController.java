package com.shxt.module.problem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.shxt.module.book.service.BookService;
import com.shxt.module.problem.model.Problem;
import com.shxt.module.problem.service.ProblemService;
import com.shxt.module.user.service.UserService;

@Controller
@RequestMapping("problem")
public class ProlemController{
	@Autowired
	private ProblemService problemService;
	@Autowired
	private BookService bookService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("to_add")
	public ModelAndView to_add(){
		return new ModelAndView("problem/add").addObject("courses", new Gson().toJson(bookService.course_list()));
	}
	
	@RequestMapping("add")
	public ModelAndView add(Problem problem,String course,String phase,String chapter1,String chapter2,HttpSession session){
		problemService.add(problem, course, phase, chapter1, chapter2,(String)session.getAttribute("id"));
		return new ModelAndView("index");
	}
	
	@RequestMapping("sel_reply")
	public ModelAndView sel_reply(HttpSession session){
		return new ModelAndView("problem/sel").addObject("problems", problemService.list_student((String)session.getAttribute("id"))).addObject("teachers", userService.list("1"));
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(String id,HttpSession session){
		problemService.delete(id);
		return this.sel_reply(session);
	}
}
