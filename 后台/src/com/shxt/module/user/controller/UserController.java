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

import com.shxt.module.examnation.service.ExamnationService;
import com.shxt.module.group.service.GroupService;
import com.shxt.module.problem.service.ProblemService;
import com.shxt.module.question.service.QuestionService;
import com.shxt.module.user.model.User;
import com.shxt.module.user.service.UserService;
import com.shxt.util.PageTool;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private ProblemService problemService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private ExamnationService examnationService;
	private ModelAndView mav;
	private User user;
	@RequestMapping("login")
	public ModelAndView loginCheck(String account,String password,HttpSession session,String rand){
		String randomMessage  = userService.validate(rand, (String)session.getAttribute("RANDOM"));
		if(randomMessage!="通过验证"){
			return new ModelAndView("login/login_fail").addObject("message", "validate");
		}
		user = userService.loginCheck(account, password);
		mav = new ModelAndView("login/login_fail");
		if(user==null){
			mav.addObject("message", "error");
		}else if(user.getState().equals("1")){
			mav.addObject("message", "1");
		}else if(user.getState().equals("4")){
			mav.addObject("message", "4");
		}else if(user.getState().equals("2")){
			session.setAttribute("islogin", "success");
			session.setAttribute("id", user.getId());
			session.setAttribute("name", user.getNAME());
			session.setAttribute("user_type", user.getUser_type());
			session.setAttribute("photo", user.getPhoto());
			return this.index(session);
		}else{
			mav.addObject("message", "0");
		}
		return mav;
	}
	
	@RequestMapping("exit")
	public String exit(HttpSession session){
		session.removeAttribute("islogin");
		return InternalResourceViewResolver.REDIRECT_URL_PREFIX+"/login.jsp";
	}
	
	@RequestMapping("list")
	public ModelAndView list(){
		mav = new ModelAndView("teacher/sel");
		mav.addObject("checked", userService.checked());
		mav.addObject("unchecked", userService.unchecked());
		return mav;
	}
	
	@RequestMapping("page")
	public ModelAndView page(PageTool pageTool){
		mav = new ModelAndView("student/sel");
		mav.addObject("students", userService.page(pageTool)).addObject("page", pageTool);
		mav.addObject("groups", groupService.list());
		return mav;
	}
	
	@RequestMapping("add")
	public String add(User teacher){
		userService.add(teacher);
		return InternalResourceViewResolver.REDIRECT_URL_PREFIX+"/wait.jsp";
	}
	
	@RequestMapping("accept")
	public void accept(String id){
		userService.accept(id);
	}
	
	@RequestMapping("refuse")
	public void refuse(String id){
		userService.refuse(id);
	}
	
	@RequestMapping("remove_right")
	public ModelAndView remove_right(String teacher_id){
		userService.remove_right(teacher_id);
		return this.list();
	}
	
	@RequestMapping("recover_right")
	public ModelAndView recover_right(String teacher_id){
		userService.recover_right(teacher_id);
		return this.list();
	}
	
	@RequestMapping("to_update")
	public ModelAndView to_update(String id){
		return new ModelAndView("teacher/update").addObject("user", userService.one(id)).addObject("group", groupService.list_teacher(id));
	}
	
	@RequestMapping("update")
	public ModelAndView update(User user,MultipartFile photo_file,HttpServletRequest request,HttpSession session){
		userService.update(user, photo_file, request);
		session.setAttribute("photo", user.getPhoto());
		return new ModelAndView("index");
	}
	
	@RequestMapping("index")
	public ModelAndView index(HttpSession session){
		examnationService.change_state();
		return new ModelAndView("index").addObject("map",userService.index()).addObject("photos", userService.photos()).addObject("new_teacher_number",userService.unchecked().size()).addObject("new_student_number", userService.new_student_number((String)session.getAttribute("id"))).addObject("new_problem_number", problemService.new_number((String)session.getAttribute("id"))).addObject("new_question_number",questionService.new_question_number());
	}
	
	@ResponseBody
	@RequestMapping("built_account")
	public String built_account(String name){
		return userService.built_account(name);
	}
	
	@RequestMapping("delete_student")
	public ModelAndView delete(String id,HttpSession session){
		userService.remove_right(id);
		return new ModelAndView("group/teacher_sel").addObject("groups", groupService.list_teacher((String)session.getAttribute("id")));
	}
	
}
