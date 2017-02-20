package com.shxt.module.group.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.group.dao.GroupDao;
import com.shxt.module.group.model.Group;
import com.shxt.module.group.service.GroupService;
import com.shxt.module.user.service.UserService;
import com.shxt.util.DateUtils;
@Service("groupService")
public class GroupServiceImpl implements GroupService {
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private UserService userService;
	private List<Group> list;
	
	@SuppressWarnings("unchecked")
	public List<?> list_alive(){
		list = (List<Group>)groupDao.list_key(Group.class.getName(),"list_alive");
		for(Group e : list){
			e.setBoy_number(this.boy(e.getId()));
		}
		return list;
	}

	public String search_teacher_id(String student_id){
		return ((Group)(groupDao.one(Group.class.getName(), userService.one(student_id).getGroup_id()))).getTeacher_id();
	}
	
	//old
	
	
	
	
	@SuppressWarnings("unchecked")
	public List<?> list(){
		list = (List<Group>)groupDao.list(Group.class.getName());
		for(Group e : list){
			e.setBoy_number(this.boy(e.getId()));
		}
		return list;
	}
	
	
	public List<?> list_teacher(String teacher_id){
		return groupDao.list_key_role(Group.class.getName(), "list_teacher", teacher_id);
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
}
