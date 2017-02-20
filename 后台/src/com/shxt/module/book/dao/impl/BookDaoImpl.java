package com.shxt.module.book.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.shxt.base.dao.impl.BaseDaoImpl;
import com.shxt.module.book.dao.BookDao;
@Repository("bookDao")
public class BookDaoImpl extends BaseDaoImpl implements BookDao {
	private SqlSession session;
	//private Map<String,Integer> map;
	@Autowired
    @Qualifier(value="sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        session = getSqlSession();
    }  
	public List<?> search(String namespace,String id){
		return session.selectList(namespace+".search",id);
	}
	public List<?> search(String namespace,String id,String key){
		return session.selectList(namespace+"."+key,id);
	}
}
