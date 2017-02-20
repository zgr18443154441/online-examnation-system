package com.shxt.module.examnation.dao.impl;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.shxt.base.dao.impl.BaseDaoImpl;
import com.shxt.module.examnation.dao.ExamnationDao;
@Repository("examnationDao")
public class ExamnationDaoImpl extends BaseDaoImpl implements ExamnationDao {
	private Map<String,String> map;
	private SqlSession session;
	@Autowired
    @Qualifier(value="sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        session = getSqlSession();
    }  
	public void match_group(String namespace,String id,String examnation_id,String group_id){
		map = new HashMap<>();
		map.put("id", id);
		map.put("examnation_id", examnation_id);
		map.put("group_id", group_id);
		session.insert(namespace+".match_group", map);
	}
}
