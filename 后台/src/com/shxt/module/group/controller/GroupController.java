package com.shxt.module.group.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.shxt.module.group.model.Group;
import com.shxt.module.group.service.GroupService;
import com.shxt.module.problem.service.ProblemService;
import com.shxt.module.user.service.UserService;

@Controller
@RequestMapping("group")
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProblemService problemService;
	@RequestMapping("list")
	public ModelAndView list(){
		return new ModelAndView("group/sel").addObject("groups_Json",new Gson().toJson(groupService.list())).addObject("groups", groupService.list()).addObject("teachers", userService.checked());
	}
	@RequestMapping("to_add")
	public ModelAndView to_add(){
		return new ModelAndView("group/add").addObject("teachers", userService.list("1"));
	}
	@RequestMapping("to_manage")
	public ModelAndView to_manage(){
		return new ModelAndView("group/manage").addObject("teachers", userService.list("1")).addObject("groups", groupService.list()).addObject("groups_Json",new Gson().toJson(groupService.list()));
	}
	@RequestMapping("update")
	public ModelAndView update(Group group){
		groupService.update(group);
		return new ModelAndView("group/sel").addObject("groups_Json",new Gson().toJson(groupService.list())).addObject("groups", groupService.list()).addObject("teachers", userService.checked());
	}
	@RequestMapping("delete")
	public ModelAndView update(String id){
		groupService.delete(id);
		return new ModelAndView("group/sel").addObject("groups_Json",new Gson().toJson(groupService.list())).addObject("groups", groupService.list()).addObject("teachers", userService.checked());
	}
	@RequestMapping("add")
	public ModelAndView add(Group group){
		groupService.add(group);
		return new ModelAndView("group/sel").addObject("groups_Json",new Gson().toJson(groupService.list())).addObject("groups", groupService.list()).addObject("teachers", userService.checked());
	}
	@RequestMapping("teacher_sel")
	public ModelAndView teacher_sel(HttpSession session){
		return new ModelAndView("group/teacher_sel").addObject("groups", groupService.list_teacher((String)session.getAttribute("id")));
	}
	@RequestMapping("business_sel")
	public ModelAndView business_sel(HttpSession session){
		return new ModelAndView("group/business_sel").addObject("groups", groupService.list_unchecked((String)session.getAttribute("id"))).addObject("problems", problemService.list_teacher((String)session.getAttribute("id"))).addObject("students", userService.list("0"));
	}
	@RequestMapping("accept")
	public ModelAndView accept(HttpSession session,String id){
		userService.accept(id);
		return this.business_sel(session);
	}
	@RequestMapping("refuse")
	public ModelAndView refuse(HttpSession session,String id){
		userService.refuse(id);
		return this.business_sel(session);
	}
}
