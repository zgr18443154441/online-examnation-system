package com.shxt.module.problem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.module.problem.service.ProblemService;
import com.shxt.module.user.service.UserService;

@Controller
@RequestMapping("problem")
public class ProlemController{
	@Autowired
	private ProblemService problemService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("to_sel")
	public ModelAndView to_sel(HttpSession session){
		return new ModelAndView("problem/sel").addObject("problems", problemService.list_teacher((String)session.getAttribute("id"))).addObject("students", userService.list("0"));
	}
	
	@RequestMapping("to_reply")
	public ModelAndView to_reply(String id){
		return new ModelAndView("problem/reply").addObject("problem", problemService.one(id));
	}
	
	@RequestMapping("reply")
	@ResponseBody
	public void reply(String problem_id,String reply){
		problemService.update(problem_id,reply);
	}
	
}
