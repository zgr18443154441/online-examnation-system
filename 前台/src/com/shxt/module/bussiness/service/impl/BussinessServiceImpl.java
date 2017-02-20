package com.shxt.module.bussiness.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.bussiness.dao.BussinessDao;
import com.shxt.module.bussiness.model.Bussiness;
import com.shxt.module.bussiness.service.BussinessService;
@Service("bussinessService")
public class BussinessServiceImpl implements BussinessService {
	@Autowired
	private BussinessDao bussinessDao;
	
	@SuppressWarnings("unchecked")
	public List<Bussiness> sel(String group_id){
		return (List<Bussiness>)bussinessDao.list_role(Bussiness.class.getName(),group_id);
	}
}
