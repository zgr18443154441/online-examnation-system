package com.shxt.module.bussiness.service.impl;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.bussiness.dao.BussinessDao;
import com.shxt.module.bussiness.model.Bussiness;
import com.shxt.module.bussiness.service.BussinessService;
import com.shxt.util.DateUtils;
@Service("bussinessService")
public class BussinessServiceImpl implements BussinessService {
	@Autowired
	private BussinessDao bussinessDao;
	
	public void add(Bussiness bussiness){
		bussiness.setId(UUID.randomUUID().toString());
		bussiness.setBuilt_date(DateUtils.getDate());
		bussinessDao.add(bussiness, Bussiness.class.getName());
	}
	
	public Bussiness last_one(String group_id){
		return (Bussiness)bussinessDao.one(Bussiness.class.getName(), group_id);
	}
}
