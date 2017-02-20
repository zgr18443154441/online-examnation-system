package com.shxt.module.user.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shxt.module.bussiness.model.Bussiness;
import com.shxt.module.bussiness.service.BussinessService;
import com.shxt.module.user.dao.UserDao;
import com.shxt.module.user.model.User;
import com.shxt.module.user.service.UserService;
import com.shxt.util.DateUtils;
import com.shxt.util.PinyinTool;
import com.shxt.util.UploadTool;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Autowired
	private BussinessService bussinessService;
	private User u;
	private List<Bussiness> temp1;
	private List<Bussiness> temp2;
	
	public List<?> list(String user_type){
		return userDao.list_role(User.class.getName(),user_type);
	}
	
	public User loginCheck(String account,String password){
		u = userDao.loginCheck(User.class.getName(), account);
		if(u==null||!u.getPassword().equals(password)) return null;
		return u;
	}
	
	public void add(User student){
		student.setApply_date(DateUtils.getDate());
		student.setId(UUID.randomUUID().toString());
		userDao.add(student, User.class.getName());
	}
	
	public Map<String,Object> index(String group_id){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("year", DateUtils.getYear());
		map.put("month", DateUtils.getMonth());
		map.put("day", DateUtils.getDay());
		map.put("time", DateUtils.getTime());
		map.put("week", DateUtils.getWeek());
		temp1 = bussinessService.sel(group_id);
		temp2 = new ArrayList<Bussiness>();
		for(Bussiness e :temp1){
			if(new Date().getTime()-DateUtils.parseDate(e.getBuilt_date()).getTime()<(1000*60*60*24*7)){
				temp2.add(e);
			}
		}
		map.put("bussiness", temp2);
		if(Integer.parseInt(DateUtils.getTime().substring(0, 2))>=5&&Integer.parseInt(DateUtils.getTime().substring(0, 2))<12){
			map.put("state", "1");
		}else if(Integer.parseInt(DateUtils.getTime().substring(0, 2))>=12&&Integer.parseInt(DateUtils.getTime().substring(0, 2))<18){
			map.put("state", "2");
		}else{
			map.put("state", "3");
		}
		return map;
	}
	
	public void update(User user,MultipartFile photo_file,HttpServletRequest request){
		if(!photo_file.isEmpty()){
			String photo = UploadTool.upload(photo_file, request);
			user.setPhoto(photo);
			System.out.println(photo);
		}
		userDao.update(User.class.getName(), user);
	}
	
	public User one(String id){
		return (User)userDao.one(User.class.getName(), id);
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
}
