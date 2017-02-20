package com.shxt.module.problem.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.book.model.Chapter;
import com.shxt.module.book.model.Course;
import com.shxt.module.book.model.Phase;
import com.shxt.module.book.service.BookService;
import com.shxt.module.group.service.GroupService;
import com.shxt.module.problem.dao.ProblemDao;
import com.shxt.module.problem.model.Problem;
import com.shxt.module.problem.service.ProblemService;
import com.shxt.util.DateUtils;
@Service("problemService")
public class ProblemServiceImpl implements ProblemService {
	@Autowired
	private ProblemDao problemDao;
	@Autowired
	private GroupService groupService;
	@Autowired
	private BookService bookService;
	
	public void add(Problem problem,String course,String phase,String chapter1,String chapter2,String student_id){
		problem.setId(UUID.randomUUID().toString());
		problem.setConsult_date(DateUtils.getDate());
		problem.setStudent_id(student_id);
		problem.setTeacher_id(groupService.search_teacher_id(student_id));
		if(course!=""){
			course = ((Course)bookService.one_course(course)).getNAME();
		}
		if(phase!=""){
			phase = ((Phase)bookService.one_phase(phase)).getNAME();
		}
		if(chapter1!=""){
			chapter1 = ((Chapter)bookService.one_chapter(chapter1)).getNAME();
		}
		if(chapter2!=""){
			chapter2 = ((Chapter)bookService.one_chapter(chapter2)).getNAME();
		}
		String str = (course==""?"":course+"；")+(phase==""?"":phase+"；")+(chapter1==""?"":chapter1+"；")+(chapter2==""?"":chapter2);
		problem.setAbout(str);;
		problemDao.add(problem, Problem.class.getName());
	}
	
	public List<?> list_student(String student_id){
		return problemDao.list_key_role(Problem.class.getName(), "list_student", student_id);
	}
	
	public void delete(String id){
		problemDao.delete(Problem.class.getName(), id);
	}
}
