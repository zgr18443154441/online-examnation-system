package com.shxt.module.user.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.shxt.base.dao.impl.BaseDaoImpl;
import com.shxt.module.user.dao.UserDao;
import com.shxt.module.user.model.User;
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl implements UserDao{
	private SqlSession session;
	private Map<String,String> map;
	@Autowired
    @Qualifier(value="sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        session = getSqlSession();
    }  
	public User loginCheck(String namespace,String account){
		return session.selectOne(namespace+".login",account);
	}
	public void accept(String register_date,String namespace,String id){
		map = new HashMap<>();
		map.put("register_date", register_date);
		map.put("id", id);
		session.update(namespace+".accept",map);
	}
	public void refuse(String namespace,String id){
		session.update(namespace+".refuse",id);
	}
}
