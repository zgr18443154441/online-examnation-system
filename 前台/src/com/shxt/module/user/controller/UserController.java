package com.shxt.module.user.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.shxt.module.group.service.GroupService;
import com.shxt.module.user.model.User;
import com.shxt.module.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private GroupService groupService;
	private ModelAndView mav;
	private User user;
	@RequestMapping("login")
	public ModelAndView loginCheck(String account,String password,HttpSession session,String rand){
		String randomMessage  = userService.validate(rand, (String)session.getAttribute("RANDOM"));
		if(randomMessage!="通过验证"){
			return new ModelAndView("user/login_fail").addObject("message", "validate");
		}
		user = userService.loginCheck(account, password);
		mav = new ModelAndView("user/login_fail");
		if(user==null){
			mav.addObject("message", "error");
		}else if(user.getState().equals("1")){
			mav.addObject("message", "1");
		}else if(user.getState().equals("4")){
			mav.addObject("message", "4");
		}else if(user.getState().equals("2")){
			session.setAttribute("islogin", "success");
			session.setAttribute("id", user.getId());
			session.setAttribute("group_id", user.getGroup_id());
			session.setAttribute("name", user.getNAME());
			session.setAttribute("user_type", user.getUser_type());
			session.setAttribute("photo", user.getPhoto());
			return this.index(null,session);
		}else{
			mav.addObject("message", "0");
		}
		return mav;
	}
	
	@RequestMapping("to_register")
	public ModelAndView to_register(){
		return new ModelAndView("user/register").addObject("groups", groupService.list_alive());
	}
	
	@RequestMapping("register")
	public String register(User student,String sex_message){
		if(sex_message==null){
			student.setSex("0");
		}else{
			student.setSex("1");
		}
		userService.add(student);
		return InternalResourceViewResolver.REDIRECT_URL_PREFIX+"/wait.jsp";
	}
	
	@RequestMapping("exit")
	public String exit(HttpSession session){
		session.removeAttribute("islogin");
		return InternalResourceViewResolver.REDIRECT_URL_PREFIX+"/login.jsp";
	}
	
	
	@RequestMapping("index")
	public ModelAndView index(String state,HttpSession session){
		return new ModelAndView("index").addObject("map",userService.index((String)session.getAttribute("group_id"))).addObject("state", state);
	}
	
	@RequestMapping("to_update")
	public ModelAndView to_update(HttpSession session){
		return new ModelAndView("user/update").addObject("user", userService.one((String)session.getAttribute("id"))).addObject("groups", groupService.list());
	}
	
	@RequestMapping("update")
	public ModelAndView update(User user,MultipartFile photo_file,HttpServletRequest request,HttpSession session){
		userService.update(user, photo_file, request);
		session.setAttribute("photo", user.getPhoto());
		return this.index("1",session);
	}
	
	@ResponseBody
	@RequestMapping("built_account")
	public String built_account(String name){
		return userService.built_account(name);
	}
}
