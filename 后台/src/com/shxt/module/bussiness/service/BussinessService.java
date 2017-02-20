package com.shxt.module.bussiness.service;

import com.shxt.module.bussiness.model.Bussiness;

public interface BussinessService {
	void add(Bussiness bussiness);
	Bussiness last_one(String group_id);
}
