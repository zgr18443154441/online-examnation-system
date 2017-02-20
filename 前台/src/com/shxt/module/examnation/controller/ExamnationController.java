package com.shxt.module.examnation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.module.examnation.service.ExamnationService;
import com.shxt.module.record.service.RecordService;

@Controller
@RequestMapping("examnation")
public class ExamnationController {
	@Autowired
	private ExamnationService examnationService;
	@Autowired
	private RecordService recordService;
	
	@RequestMapping("list_group")
	public ModelAndView list_group(HttpSession session){
		return new ModelAndView("examnation/list").addObject("examnations", examnationService.list_group((String)session.getAttribute("id"),(String)session.getAttribute("group_id")));
	}
	
	@RequestMapping("to_text")
	public ModelAndView to_text(String id){
		return new ModelAndView("examnation/paper").addObject("examnation", examnationService.one(id)).addObject("questions", examnationService.search_questions(id)).addObject("sort", examnationService.search_sort(id));
	}
	
	@RequestMapping("to_record")
	public ModelAndView to_record(String id,HttpSession session){
		return new ModelAndView("record/sel_record").addObject("student_examnation", recordService.search_examnation(id, (String)session.getAttribute("id"))).addObject("student_answers", recordService.search_student_answers(id,(String)session.getAttribute("id"))).addObject("questions", examnationService.search_questions(id)).addObject("sort", examnationService.search_sort(id)).addObject("examnation", examnationService.one(id));
	}
	
	
}
