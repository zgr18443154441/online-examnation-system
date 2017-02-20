package com.shxt.module.group.service;

import java.util.List;

import com.shxt.module.group.model.Group;

public interface GroupService {
	List<?> list_alive();
	String search_teacher_id(String student_id);
	
	//old
	
	
	List<?> list();
	List<?> list_teacher(String teacher_id);
	void add(Group group);
	void update(Group group);
	void delete(String id);
	Integer boy(String group_id);
}
