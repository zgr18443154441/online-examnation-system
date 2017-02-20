package com.shxt.module.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.shxt.module.user.model.User;

public interface UserService {
	Map<String,Object> index(String group_id);
	User one(String id);
	List<?> list(String user_type);
	User loginCheck(String account,String password);
	void add(User student);
	void update(User user,MultipartFile photo_file,HttpServletRequest request);
	String built_account(String name);
	String validate(String random,String RANDOM);
}
