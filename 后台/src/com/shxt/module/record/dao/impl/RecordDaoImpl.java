package com.shxt.module.record.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.shxt.base.dao.impl.BaseDaoImpl;
import com.shxt.module.record.dao.RecordDao;
import com.shxt.module.record.model.StudentAnswer;
import com.shxt.module.record.model.StudentExamnation;
@Repository("recordDao")
public class RecordDaoImpl extends BaseDaoImpl implements RecordDao {
	private SqlSession session;
	@Autowired
    @Qualifier(value="sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        session = getSqlSession();
    }  
	public StudentAnswer search_single_choice(String namespace,Object role){
		return session.selectOne(namespace+".search_single", role);
	}
	public StudentAnswer search_multiple_choice(String namespace,Object role){
		return session.selectOne(namespace+".search_multiple", role);
	}
	public List<StudentAnswer> search_multiple_choices(String namespace,Object role){
		return session.selectList(namespace+".search_single", role);
	}
	public List<StudentAnswer> search_student(String namespace,Object role){
		return session.selectList(namespace+".search_student", role);
	}
	public StudentExamnation search_examnation_one(String namespace,Object role){
		return session.selectOne(namespace+".search", role);
	}
	public List<StudentExamnation> search_examnation(String namespace,String examnation_id){
		return session.selectList(namespace+".search_examnation", examnation_id);
	}
	public void upload(String namespace,Map<String,String> map){
		session.update(namespace+".upload",map);
	}
}
