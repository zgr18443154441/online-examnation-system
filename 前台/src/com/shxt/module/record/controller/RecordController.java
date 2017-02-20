package com.shxt.module.record.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shxt.module.examnation.service.ExamnationService;
import com.shxt.module.record.model.StudentExamnation;
import com.shxt.module.record.model.User1;
import com.shxt.module.record.service.RecordService;

@Controller
@RequestMapping("record")
public class RecordController {
	@Autowired
	private RecordService recordService;
	@Autowired
	private ExamnationService examnationService;
	
	@ResponseBody
	@RequestMapping("single_choice")
	public void record_single_choice(String student_id,String examnation_id,String question_id,String choice_id){
		recordService.record_single_choice(student_id, examnation_id, question_id, choice_id);
	}
	
	@ResponseBody
	@RequestMapping("multiple_choice")
	public void record_multiple_choice(String student_id,String examnation_id,String question_id,String choice_id){
		recordService.record_multiple_choice(student_id, examnation_id, question_id, choice_id);
	}
	
	@ResponseBody
	@RequestMapping("judge")
	public void record_judge(String student_id,String examnation_id,String question_id,String judgement){
		recordService.record_judge(student_id, examnation_id, question_id, judgement);
	}
	
	@ResponseBody
	@RequestMapping("filling")
	public void record_filling(String student_id,String examnation_id,String question_id,String[] blanks){
		recordService.record_filling(student_id, examnation_id, question_id, blanks);
	}
	
	@ResponseBody
	@RequestMapping("answer")
	public void record_answer(String student_id,String examnation_id,String question_id,String answer){
		recordService.record_answer(student_id, examnation_id, question_id, answer);
	}
	
	@RequestMapping("finish")
	public ModelAndView finish(StudentExamnation studentExamnation){
		recordService.calculate(studentExamnation);
		return new ModelAndView("index");
	}
	
	@RequestMapping("all_examnation")
	public ModelAndView all_examnation(HttpSession session){
		return new ModelAndView("record/all_examnation").addObject("examnations", examnationService.list_history()).addObject("student_examnations", recordService.search_student_all((String)session.getAttribute("id")));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//安卓用
	@ResponseBody
	@RequestMapping("webdata")
	public List<User1> webdata(){
		List<User1> users = new ArrayList<>();
		User1 user = new User1(1, "华为", 5000, "长春", "huawei.jpg");
		users.add(user);
		user = new User1(2, "索尼", 7800, "北京", "sony.jpg");
		users.add(user);
		user = new User1(3, "苹果", 6900, "上海", "iphone.jpg");
		users.add(user);
		user = new User1(4, "小辣椒", 4500, "深圳", "xlj.jpg");
		users.add(user);
		user = new User1(5, "魅族", 3800, "广州", "meizu.jpg");
		users.add(user);
		return users;
	}
	
	
}
