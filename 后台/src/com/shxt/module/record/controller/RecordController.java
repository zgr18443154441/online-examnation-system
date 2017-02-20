package com.shxt.module.record.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.module.examnation.service.ExamnationService;
import com.shxt.module.record.model.StudentExamnation;
import com.shxt.module.record.service.RecordService;
import com.shxt.module.user.service.UserService;

@Controller
@RequestMapping("record")
public class RecordController {
	@Autowired
	private RecordService recordService;
	@Autowired
	private ExamnationService examnationService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("to_value")
	public ModelAndView to_value(HttpSession session){
		return new ModelAndView("record/select_value").addObject("examnations", examnationService.list_teacher((String)session.getAttribute("id")));
	}
	@RequestMapping("value")
	public ModelAndView value(String id,HttpSession session){
		return new ModelAndView("record/value").addObject("examnation", examnationService.one(id)).addObject("questions", examnationService.search_questions(id)).addObject("sort", examnationService.search_sort(id)).addObject("student_answers", recordService.value(id, (String)session.getAttribute("id")));
	}

	@RequestMapping("finish_score")
	@ResponseBody
	public void finish_score(String student_id,String examnation_id,String score){
		recordService.finish_score(student_id, examnation_id, score);
	}
	
	@RequestMapping("to_sel")
	public ModelAndView to_sel(HttpSession session){
		return new ModelAndView("record/select_sel").addObject("examnations",  examnationService.list_finish((String)session.getAttribute("id"))).addObject("students",userService.list("0"));
	}
	
	@RequestMapping("sel_record")
	public ModelAndView sel_record(String examnation_id,String student_id){
		return new ModelAndView("record/sel").addObject("student_answers", recordService.search_student_answers(examnation_id, student_id)).addObject("questions", examnationService.search_questions(examnation_id)).addObject("sort", examnationService.search_sort(examnation_id)).addObject("examnation", examnationService.one(examnation_id));
	}
	
	
	@RequestMapping("finish_value")
	public ModelAndView finish_value(HttpSession session,String examnation_id){
		recordService.finish_value(examnation_id);
		return this.to_sel(session);
	}
	
	@RequestMapping("search_student_examnation")
	@ResponseBody
	public List<StudentExamnation> search_student_examnation(String examnation_id){
		return recordService.search_student_examnation(examnation_id);
	}
	
	
}
