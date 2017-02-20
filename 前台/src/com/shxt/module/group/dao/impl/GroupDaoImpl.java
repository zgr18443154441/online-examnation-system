package com.shxt.module.group.dao.impl;



import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.shxt.base.dao.impl.BaseDaoImpl;
import com.shxt.module.group.dao.GroupDao;
@Repository("groupDao")
public class GroupDaoImpl extends BaseDaoImpl implements GroupDao {
	private SqlSession session;
	@Autowired
    @Qualifier(value="sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        session = getSqlSession();
    }  
	public Integer boy(String namespace,String group_id){
		return session.selectOne(namespace+".boy",group_id);
	}
}
