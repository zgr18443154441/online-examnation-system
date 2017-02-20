package com.shxt.module.bussiness.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.module.bussiness.model.Bussiness;
import com.shxt.module.bussiness.service.BussinessService;
import com.shxt.module.group.service.GroupService;
import com.shxt.module.user.service.UserService;

@Controller
@RequestMapping("bussiness")
public class BussinessController {
	@Autowired
	private BussinessService bussinessService;
	@Autowired
	private UserService userService;
	@Autowired
	private GroupService groupService;
	
	@RequestMapping("to_add")
	public ModelAndView to_add(HttpSession session){
		return new ModelAndView("bussiness/add").addObject("groups",groupService.list_teacher( (String)session.getAttribute("id")) );
	}
	
	@RequestMapping("add")
	public ModelAndView add(Bussiness bussiness,String[] groups){
		for(String e : groups){
			bussiness.setGroup_id(e);
			bussinessService.add(bussiness);
		}
		return new ModelAndView("index").addObject("map", userService.index());
	}
}
