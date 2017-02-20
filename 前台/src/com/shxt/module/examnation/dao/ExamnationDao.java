package com.shxt.module.examnation.dao;

import com.shxt.base.dao.BaseDao;

public interface ExamnationDao extends BaseDao{
	void match_group(String namespace,String id,String examnation_id,String group_id);
}
