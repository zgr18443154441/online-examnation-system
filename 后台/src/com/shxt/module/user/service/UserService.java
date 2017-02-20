package com.shxt.module.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.shxt.module.user.model.User;
import com.shxt.util.PageTool;

public interface UserService {
	List<User> photos();
	int new_student_number(String teacher_id);
	Map<String,String> index();
	User one(String id);
	User loginCheck(String account,String password);
	List<?> list(String user_type);
	List<?> checked();
	List<?> unchecked();
	List<?> page(PageTool pageTool);
	void add(User teacher);
	void accept(String id);
	void refuse(String id);
	void remove_right(String id);
	void recover_right(String id);
	void update(User user,MultipartFile photo_file,HttpServletRequest request);
	String built_account(String name);
	String validate(String random,String RANDOM);
}
