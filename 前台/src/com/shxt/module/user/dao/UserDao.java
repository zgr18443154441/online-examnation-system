package com.shxt.module.user.dao;

import com.shxt.base.dao.BaseDao;
import com.shxt.module.user.model.User;

public interface UserDao extends BaseDao{
	User loginCheck(String namespace,String account);
	void accept(String register_date,String namespace,String id);
	void refuse(String namespace,String id);
}
