package com.shxt.module.user.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shxt.module.group.model.Group;
import com.shxt.module.group.service.GroupService;
import com.shxt.module.user.dao.UserDao;
import com.shxt.module.user.model.User;
import com.shxt.module.user.service.UserService;
import com.shxt.util.DateUtils;
import com.shxt.util.PageTool;
import com.shxt.util.PinyinTool;
import com.shxt.util.UploadTool;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Autowired
	private GroupService groupService;
	
	private User u;
	private List<User> temp;
	
	
	public User loginCheck(String account,String password){
		u = userDao.loginCheck(User.class.getName(), account);
		if(u==null||!u.getPassword().equals(password)) return null;
		return u;
	}
	
	public User one(String id){
		return (User)userDao.one(User.class.getName(), id);
	}
	
	public List<?> list(String user_type){
		return userDao.list_role(User.class.getName(),user_type);
	}
	
	public List<?> checked(){
		return userDao.list_key(User.class.getName(),"checked");
	}
	
	public List<?> unchecked(){
		return userDao.list_key(User.class.getName(),"unchecked");
	}
	
	public List<?> page(PageTool pageTool){
		pageTool.setSize(5);
		return userDao.page(User.class.getName(), pageTool);
	}
	
	public void add(User teacher){
		teacher.setApply_date(DateUtils.getDate());
		teacher.setId(UUID.randomUUID().toString());
		userDao.add(teacher, User.class.getName());
	}
	
	public void accept(String id){
		groupService.student_number_up(this.one(id).getGroup_id());
		userDao.accept(DateUtils.getDate(),User.class.getName(), id);
	}
	
	public void refuse(String id){
		userDao.refuse(User.class.getName(), id);
	}
	
	public void remove_right(String id){
		userDao.update_key_role(User.class.getName(), "remove_right", id);
	}
	
	public void recover_right(String id){
		userDao.update_key_role(User.class.getName(), "recover_right", id);
	}
	
	public void update(User user,MultipartFile photo_file,HttpServletRequest request){
		if(!photo_file.isEmpty()){
			user.setPhoto(UploadTool.upload(photo_file, request));
		}
		userDao.update(User.class.getName(), user);
	}
	
	public Map<String,String> index(){
		Map<String,String> map = new HashMap<String, String>();
		map.put("year", DateUtils.getYear());
		map.put("month", DateUtils.getMonth());
		map.put("day", DateUtils.getDay());
		map.put("time", DateUtils.getTime());
		map.put("week", DateUtils.getWeek());
		if(Integer.parseInt(DateUtils.getTime().substring(0, 2))>5&&Integer.parseInt(DateUtils.getTime().substring(0, 2))<12){
			map.put("state", "上午好");
		}else if(Integer.parseInt(DateUtils.getTime().substring(0, 2))>12&&Integer.parseInt(DateUtils.getTime().substring(0, 2))<18){
			map.put("state", "下午好");
		}else{
			map.put("state", "晚上好");
		}
		return map;
	}
	
	public String built_account(String name){
		return PinyinTool.converterToSpell(name)+(int)(Math.random()*100);
	}
	
	public String validate(String random,String RANDOM){
		if ("".equals(random) || null == random) {
			return "请输入验证码";
		}
		if (RANDOM == null || "".equals(RANDOM)) {
			return "服务器验证码错误";
		}
		if (!random.equalsIgnoreCase(RANDOM)) {
			return "输入的验证码有误";
		}
		return "通过验证";
	}
	
	@SuppressWarnings("unchecked")
	public List<User> photos(){
		List<User> users = (List<User>)userDao.list_key(User.class.getName(), "list_photo");
		temp = new ArrayList<>();
		for(int i=0; i<(users.size()>10?10:users.size()); i++){
			int luck  =(int)(Math.random()*users.size());
			temp.add(users.get(luck));
			users.remove(luck);
		}
		return temp;
	}
	
	@SuppressWarnings({ "unchecked", "unused" })
	public int new_student_number(String teacher_id) {
		List<Group> list = (List<Group>)groupService.list_unchecked(teacher_id);
		int index = 0;
		for(Group e : list){
			for(User f : e.getStudents()){
				index++;
			}
		}
		return index;
	}
	
}
