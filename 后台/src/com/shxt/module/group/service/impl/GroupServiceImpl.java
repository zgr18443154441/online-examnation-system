package com.shxt.module.group.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.bussiness.service.BussinessService;
import com.shxt.module.group.dao.GroupDao;
import com.shxt.module.group.model.Group;
import com.shxt.module.group.service.GroupService;
import com.shxt.util.DateUtils;
@Service("groupService")
public class GroupServiceImpl implements GroupService {
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private BussinessService bussinessService;
	private List<Group> list;
	
	
	@SuppressWarnings("unchecked")
	public List<?> list(){
		list = (List<Group>)groupDao.list(Group.class.getName());
		for(Group e : list){
			e.setBoy_number(this.boy(e.getId()));
			e.setBussiness(bussinessService.last_one(e.getId()));
		}
		return list;
	}
	
	public List<?> list_teacher(String teacher_id){
		return groupDao.list_key_role(Group.class.getName(), "list_teacher", teacher_id);
	}
	
	public List<?> list_unchecked(String teacher_id){
		return groupDao.list_key_role(Group.class.getName(), "list_unchecked", teacher_id);
	}
	
	public Integer boy(String group_id){
		return groupDao.boy(Group.class.getName(), group_id);
	}
	
	public void add(Group group){
		group.setId(UUID.randomUUID().toString());
		group.setStart_date(DateUtils.getDate());
		groupDao.add(group, Group.class.getName());
	}
	
	public void update(Group group){
		groupDao.update(Group.class.getName(), group);
	}
	
	public void delete(String id){
		groupDao.delete(Group.class.getName(), id);
	}
	
	public void student_number_up(String id){
		groupDao.update_key_role(Group.class.getName(), "student_number_add", id);
	}
}
