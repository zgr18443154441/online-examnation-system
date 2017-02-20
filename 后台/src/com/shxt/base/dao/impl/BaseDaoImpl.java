package com.shxt.base.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.shxt.base.dao.BaseDao;
import com.shxt.util.PageTool;
@Repository("baseDao")
public class BaseDaoImpl extends SqlSessionDaoSupport implements BaseDao{
	private Map<String,Object> map;
	private SqlSession session;
	@Autowired
    @Qualifier(value="sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        session = getSqlSession();
    }  
	
	public void add(Object o, String namespace) {
		session.insert(namespace + ".add", o);
	}
	
	public List<?> list(String namespace) {
		return session.selectList(namespace + ".list");
	}
	
	public List<?> list_role(String namespace,Object role) {
		return session.selectList(namespace + ".list",role);
	}
	
	public List<?> list_key(String namespace,String key) {
		return session.selectList(namespace + "."+key);
	}
	
	public List<?> list_key_role(String namespace,String key,Object role) {
		return session.selectList(namespace + "."+key,role);
	}
	
	public Object one(String namespace, String id) {
		return session.selectOne(namespace + ".one" , id);
	}
	
	public Object one_key_role(String namespace,String key, Object id) {
		return session.selectOne(namespace + "."+key , id);
	}
	
	public Object one(String namespace, Map<String,Object> role) {
		return session.selectOne(namespace + ".one" , role);
	}
	
	public List<?> page(String namespace,PageTool pageTool) {
		map = new HashMap<>();
		pageTool.setCount(session.selectOne(namespace+".count"));	
		pageTool.setAll(pageTool.getCount()/pageTool.getSize()+(pageTool.getCount()%pageTool.getSize()==0?0:1));
		if(pageTool.getIndex()<=1){
			pageTool.setIndex(1);
		}else if(pageTool.getIndex()>pageTool.getAll()){
			pageTool.setIndex(pageTool.getAll());
		}
		map.put("start", pageTool.getSize()*(pageTool.getIndex()-1));
		map.put("size", pageTool.getSize());
		return session.selectList(namespace + ".page",map);
	}
	
	public List<?> page(String namespace,PageTool pageTool,String TYPE) {
		map = new HashMap<>();
		pageTool.setCount(session.selectOne(namespace+".count",TYPE));	
		pageTool.setAll(pageTool.getCount()/pageTool.getSize()+(pageTool.getCount()%pageTool.getSize()==0?0:1));
		if(pageTool.getIndex()<=1){
			pageTool.setIndex(1);
		}else if(pageTool.getIndex()>pageTool.getAll()){
			pageTool.setIndex(pageTool.getAll());
		}
		map.put("start", pageTool.getSize()*(pageTool.getIndex()-1));
		map.put("size", pageTool.getSize());
		map.put("TYPE", TYPE);
		return session.selectList(namespace + ".page",map);
	}
	
	public void update(String namespace,Object o) {
		session.update(namespace + ".update", o);
	}
	
	public void update_key_role(String namespace,String key,Object role) {
		session.update(namespace + "."+key, role);
	}
	
	public void delete(String namespace,String id){
		session.delete(namespace+".delete", id);
	}
	
	public void delete_key_role(String namespace,String key,Object role){
		session.delete(namespace+"."+key, role);
	}
	
	public Integer count(String namespace,String role){
		return session.selectOne(namespace+".count", role);
	}
	
}
