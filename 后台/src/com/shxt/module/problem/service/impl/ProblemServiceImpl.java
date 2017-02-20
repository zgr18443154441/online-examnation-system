package com.shxt.module.problem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.problem.dao.ProblemDao;
import com.shxt.module.problem.model.Problem;
import com.shxt.module.problem.service.ProblemService;
import com.shxt.util.DateUtils;
@Service("problemService")
public class ProblemServiceImpl implements ProblemService {
	@Autowired
	private ProblemDao problemDao;
	
	public List<?> list_teacher(String teacher_id){
		return problemDao.list_key_role(Problem.class.getName(), "list_teacher", teacher_id);
	}
	
	public Problem one(String id){
		return (Problem)problemDao.one(Problem.class.getName(), id);
	}
	
	public void update(String problem_id,String reply){
		Problem problem = this.one(problem_id);
		problem.setReply(reply);
		problem.setReply_date(DateUtils.getDate());
		problemDao.update(Problem.class.getName(), problem);
	}
	
	public Integer new_number(String teacher_id){
		return (Integer)problemDao.one_key_role(Problem.class.getName(), "list_new", teacher_id);
	}
}
