package com.shxt.module.question.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.shxt.base.dao.impl.BaseDaoImpl;
import com.shxt.module.question.dao.QuestionDao;
import com.shxt.module.question.model.Question;
import com.shxt.util.PageTool;
@Repository("questionDao")
public class QuestionDaoImpl extends BaseDaoImpl implements QuestionDao {
	private SqlSession session;
	private Map<String,Object> map;
	@Autowired
    @Qualifier(value="sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        session = getSqlSession();
    }  
	
	public List<?> search_chapter2(String namespace,PageTool pageTool,String chapter2) {
		map = new HashMap<>();
		pageTool.setCount(session.selectOne(namespace+".count_chapter2",chapter2));	
		pageTool.setAll(pageTool.getCount()/pageTool.getSize()+(pageTool.getCount()%pageTool.getSize()==0?0:1));
		if(pageTool.getIndex()<=1){
			pageTool.setIndex(1);
		}else if(pageTool.getIndex()>pageTool.getAll()){
			pageTool.setIndex(pageTool.getAll());
		}
		map.put("start", pageTool.getSize()*(pageTool.getIndex()-1));
		map.put("size", pageTool.getSize());
		map.put("chapter2", chapter2);
		return session.selectList(namespace + ".search_chapter2",map);
	}
	
	public List<?> new_question(String namespace,PageTool pageTool) {
		map = new HashMap<>();
		pageTool.setCount(session.selectOne(namespace+".count_new"));	
		pageTool.setAll(pageTool.getCount()/pageTool.getSize()+(pageTool.getCount()%pageTool.getSize()==0?0:1));
		if(pageTool.getIndex()<=1){
			pageTool.setIndex(1);
		}else if(pageTool.getIndex()>pageTool.getAll()){
			pageTool.setIndex(pageTool.getAll());
		}
		map.put("start", pageTool.getSize()*(pageTool.getIndex()-1));
		map.put("size", pageTool.getSize());
		return session.selectList(namespace + ".new_question",map);
	}
	
	public void accept(String namespace,Question question){
		session.update(namespace+".accept", question);
	}
	public void refuse(String namespace,Question question){
		session.update(namespace+".refuse", question);
	}
	
	
	public void use_up(String question_id){
		session.update(Question.class.getName()+".use_up", question_id);
	}
	
	public void right_up(String question_id){
		session.update(Question.class.getName()+".right_up", question_id);
	}

}
