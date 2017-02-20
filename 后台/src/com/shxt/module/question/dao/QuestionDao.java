package com.shxt.module.question.dao;



import java.util.List;

import com.shxt.base.dao.BaseDao;
import com.shxt.module.question.model.Question;
import com.shxt.util.PageTool;

public interface QuestionDao extends BaseDao {
	List<?> new_question(String namespace,PageTool pageTool);
	List<?> search_chapter2(String namespace,PageTool pageTool,String chapter2);
	void accept(String namespace,Question question);
	void refuse(String namespace,Question question);
}
