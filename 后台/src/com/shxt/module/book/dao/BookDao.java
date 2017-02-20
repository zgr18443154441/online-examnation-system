package com.shxt.module.book.dao;


import java.util.List;

import com.shxt.base.dao.BaseDao;

public interface BookDao extends BaseDao{
	List<?> search(String namespace,String course_id);
	List<?> search(String namespace,String id,String key);
}
