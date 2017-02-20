package com.shxt.module.book.service;

import java.util.List;
import java.util.Map;

import com.shxt.module.book.model.Chapter;
import com.shxt.module.book.model.Course;
import com.shxt.module.book.model.Phase;
import com.shxt.module.question.model.Question;

public interface BookService {
	Object one_course(String course_id);
	Object one_phase(String phase_id);
	Object one_chapter(String chapter_id);
	List<?> course_list();
	List<?> phase_list();
	List<?> chapter1_list();
	List<?> chapter2_list();
	List<?> search_phase(String course_id);
	List<?> search_chapter1(String phase_id);
	List<?> search_chapter2(String parent_id);
	Map<String,String> manage();
	void add_course(Course course);
	void add_phase(Phase phase);
	void add_chapter1(Chapter chapter1);
	void add_chapter2(Chapter chapter2);
	void update_course(Course course);
	void update_phase(Phase phase);
	void update_chapter(Chapter chapter);
	void delete(String id,int type);
	void number_plus(Question question);
	void update_up(String id,String type);
	void update_down(String id,String type);
}
