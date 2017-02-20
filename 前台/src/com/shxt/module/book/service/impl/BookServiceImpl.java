package com.shxt.module.book.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.book.dao.BookDao;
import com.shxt.module.book.model.Chapter;
import com.shxt.module.book.model.Course;
import com.shxt.module.book.model.Phase;
import com.shxt.module.book.service.BookService;
import com.shxt.module.question.model.Question;
@Service("bookService")
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao bookDao;
	private Course course;
	private Phase phase;
	private Chapter chapter1;
	private Chapter chapter2;
	private Map<String,String> map;
	public List<?> course_list(){
		return bookDao.list(Course.class.getName());
	}
	
	public List<?> phase_list(){
		return bookDao.list(Phase.class.getName());
	}
	
	public List<?> chapter1_list(){
		return bookDao.list_key(Chapter.class.getName(),"list1");
	}
	
	public List<?> chapter2_list(){
		return bookDao.list_key(Chapter.class.getName(),"list2");
	}
	
	//old
	
	
	
	public Object one_course(String course_id){
		return bookDao.one(Course.class.getName(), course_id);
	}
	
	public Object one_phase(String phase_id){
		return bookDao.one(Phase.class.getName(), phase_id);
	}
	
	public Object one_chapter(String chapter_id){
		return bookDao.one(Chapter.class.getName(), chapter_id);
	}
	
	
	public List<?> search_phase(String course_id){
		return bookDao.search(Phase.class.getName(), course_id);
	}
	
	public List<?> search_chapter1(String phase_id){
		return bookDao.search(Chapter.class.getName(), phase_id,"search_phase");
	}
	
	public List<?> search_chapter2(String parent_id){
		return bookDao.search(Chapter.class.getName(), parent_id,"search_parent");
	}
	
	public Map<String,String> manage(){
		map = new HashMap<>();
		if(this.course_list().isEmpty()){
			map.put("course", "0");
		}else{
			map.put("course", "1");
		}
		if(this.phase_list().isEmpty()){
			map.put("phase", "0");
		}else{
			map.put("phase", "1");
		}
		if(this.chapter1_list().isEmpty()){
			map.put("chapter1", "0");
		}else{
			map.put("chapter1", "1");
		}
		if(this.chapter2_list().isEmpty()){
			map.put("chapter2", "0");
		}else{
			map.put("chapter2", "1");
		}
		return map;
	}
	
	public void update_course(Course course){
		bookDao.update(Course.class.getName(), course);
	}
	
	public void update_phase(Phase phase){
		bookDao.update(Phase.class.getName(), phase);
	}
	
	public void update_chapter(Chapter chapter){
		bookDao.update(Chapter.class.getName(), chapter);
	}
	
	public void add_course(Course course){
		course.setId(UUID.randomUUID().toString());
		bookDao.add(course, Course.class.getName());
	}
	
	public void add_phase(Phase phase){
		phase.setId(UUID.randomUUID().toString());
		this.course_plus(phase);
		bookDao.add(phase, Phase.class.getName());
	}
	
	public void add_chapter1(Chapter chapter1){
		chapter1.setId(UUID.randomUUID().toString());
		chapter1.setC_level(1);
		this.phase_plus(chapter1);
		bookDao.add(chapter1, Chapter.class.getName());
	}
	
	public void add_chapter2(Chapter chapter2){
		chapter2.setId(UUID.randomUUID().toString());
		chapter2.setC_level(2);
		this.chapter1_plus(chapter2);
		bookDao.add(chapter2, Chapter.class.getName());
	}
	
	public void course_plus(Phase phase){
		Course course = (Course)bookDao.one(Course.class.getName(), phase.getCourse_id());
		course.setPhase_number(course.getPhase_number()+1);
		bookDao.update(Course.class.getName(),course);
	}
	
	public void phase_plus(Chapter chapter1) {
		Phase phase = (Phase)bookDao.one(Phase.class.getName(), chapter1.getPhase_id());
		phase.setChapter1_number(phase.getChapter1_number()+1);
		bookDao.update(Phase.class.getName(), phase);
	}
	
	public void chapter1_plus(Chapter chapter2){
		Chapter chapter = (Chapter)bookDao.one(Chapter.class.getName(), chapter2.getParent_id());
		chapter.setSon_number(chapter.getSon_number()+1);
		bookDao.update(Chapter.class.getName(), chapter);
	}
	
	public void delete(String id,int type){
		switch (type) {
		case 1:
			bookDao.delete(Course.class.getName(), id);
			break;
		case 2:
			bookDao.delete(Phase.class.getName(), id);
			break;
		case 3:
		case 4:
			bookDao.delete(Chapter.class.getName(), id);
			break;
		}
	}
	
	public void number_plus(Question question){
		course = (Course)bookDao.one(Course.class.getName(), question.getCourse());
		course.setQuestion_number(course.getQuestion_number()+1);
		bookDao.update(Course.class.getName(), course);
		
		phase = (Phase)bookDao.one(Phase.class.getName(), question.getPhase());
		phase.setQuestion_number(phase.getQuestion_number()+1);
		bookDao.update(Phase.class.getName(), phase);
		
		chapter1 = (Chapter)bookDao.one(Chapter.class.getName(), question.getChapter1());
		chapter1.setQuestion_number(chapter1.getQuestion_number()+1);
		bookDao.update(Chapter.class.getName(), chapter1);
		
		chapter2 = (Chapter)bookDao.one(Chapter.class.getName(), question.getChapter2());
		chapter2.setQuestion_number(chapter2.getQuestion_number()+1);
		bookDao.update(Chapter.class.getName(), chapter2);
	}
}
