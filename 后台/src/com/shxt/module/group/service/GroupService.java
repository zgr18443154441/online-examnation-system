package com.shxt.module.group.service;

import java.util.List;

import com.shxt.module.group.model.Group;

public interface GroupService {
	List<?> list();
	List<?> list_teacher(String teacher_id);
	List<?> list_unchecked(String teacher_id);
	void add(Group group);
	void update(Group group);
	void delete(String id);
	Integer boy(String group_id);
	void student_number_up(String id);
}
