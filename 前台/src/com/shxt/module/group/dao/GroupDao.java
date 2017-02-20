package com.shxt.module.group.dao;

import com.shxt.base.dao.BaseDao;

public interface GroupDao extends BaseDao{
	Integer boy(String namespace,String group_id);
}
