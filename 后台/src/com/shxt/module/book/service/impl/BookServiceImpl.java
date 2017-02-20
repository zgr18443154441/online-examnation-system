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
import com.shxt.module.question.service.QuestionService;
@Service("bookService")
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao bookDao;
	@Autowired
	private QuestionService questionService;
	private Course course;
	private Phase phase;
	private Chapter chapter1;
	private Chapter chapter2;
	private Map<String,String> map;
	public List<?> course_list(){
		return bookDao.list(Course.class.getName());
	}
	
	public Object one_course(String course_id){
		return bookDao.one(Course.class.getName(), course_id);
	}
	
	public List<?> phase_list(){
		return bookDao.list(Phase.class.getName());
	}
	
	public Object one_phase(String phase_id){
		return bookDao.one(Phase.class.getName(), phase_id);
	}
	
	public Object one_chapter(String chapter_id){
		return bookDao.one(Chapter.class.getName(), chapter_id);
	}
	
	public List<?> chapter1_list(){
		return bookDao.list_key(Chapter.class.getName(),"list1");
	}
	
	public List<?> chapter2_list(){
		return bookDao.list_key(Chapter.class.getName(),"list2");
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
		phase.setSort((int)bookDao.one_key_role(Phase.class.getName(), "phase_number", phase.getCourse_id())+1);
		this.course_plus(phase);
		bookDao.add(phase, Phase.class.getName());
	}
	
	public void add_chapter1(Chapter chapter1){
		chapter1.setId(UUID.randomUUID().toString());
		chapter1.setC_level(1);
		chapter1.setSort((int)bookDao.one_key_role(Chapter.class.getName(),"chapter1_number", chapter1.getPhase_id())+1);
		this.phase_plus(chapter1);
		bookDao.add(chapter1, Chapter.class.getName());
	}
	
	public void add_chapter2(Chapter chapter2){
		chapter2.setId(UUID.randomUUID().toString());
		chapter2.setC_level(2);
		chapter2.setSort((int)bookDao.one_key_role(Chapter.class.getName(),"chapter2_number", chapter2.getParent_id())+1);
		this.chapter1_plus(chapter2);
		bookDao.add(chapter2, Chapter.class.getName());
	}
	
	public void update_up(String id,String type){
		switch (type) {
		case "2":
			Phase down2 = (Phase)bookDao.one(Phase.class.getName(), id);
			if(down2.getSort()>1){
				map = new HashMap<>();
				map.put("course_id", down2.getCourse_id());
				map.put("sort", String.valueOf(down2.getSort()-1));
				Phase up = (Phase)bookDao.one_key_role(Phase.class.getName(),"sort_phase", map);
				down2.setSort(down2.getSort()-1);
				bookDao.update(Phase.class.getName(), down2);
				up.setSort(down2.getSort()+1);
				bookDao.update(Phase.class.getName(), up);
			}
			break;
		case "3":
			Chapter down3 = (Chapter)bookDao.one(Chapter.class.getName(), id);
			if(down3.getSort()>1){
				map = new HashMap<>();
				map.put("phase_id", down3.getPhase_id());
				map.put("sort", String.valueOf(down3.getSort()-1));
				Chapter up = (Chapter)bookDao.one_key_role(Chapter.class.getName(),"sort_chapter1", map);
				down3.setSort(down3.getSort()-1);
				bookDao.update(Chapter.class.getName(), down3);
				up.setSort(down3.getSort()+1);
				bookDao.update(Chapter.class.getName(), up);
			}
			break;
		case "4":
			Chapter down4 = (Chapter)bookDao.one(Chapter.class.getName(), id);
			if(down4.getSort()>1){
				map = new HashMap<>();
				map.put("parent_id", down4.getParent_id());
				map.put("sort", String.valueOf(down4.getSort()-1));
				Chapter up = (Chapter)bookDao.one_key_role(Chapter.class.getName(),"sort_chapter2", map);
				down4.setSort(down4.getSort()-1);
				bookDao.update(Chapter.class.getName(), down4);
				up.setSort(down4.getSort()+1);
				bookDao.update(Chapter.class.getName(), up);
			}
			break;
		}
	}
	
	public void update_down(String id,String type){
		switch (type) {
		case "2":
			Phase up2 = (Phase)bookDao.one(Phase.class.getName(), id);
			if(up2.getSort()<(int)bookDao.one_key_role(Phase.class.getName(),"phase_number",up2.getCourse_id())){
				map = new HashMap<>();
				map.put("course_id", up2.getCourse_id());
				map.put("sort", String.valueOf(up2.getSort()+1));
				Phase down = (Phase)bookDao.one_key_role(Phase.class.getName(),"sort_phase", map);
				up2.setSort(up2.getSort()+1);
				bookDao.update(Phase.class.getName(), up2);
				down.setSort(up2.getSort()-1);
				bookDao.update(Phase.class.getName(), down);
			}
			break;
		case "3":
			Chapter up3 = (Chapter)bookDao.one(Chapter.class.getName(), id);
			if(up3.getSort()<(int)bookDao.one_key_role(Chapter.class.getName(),"chapter1_number",up3.getPhase_id())){
				map = new HashMap<>();
				map.put("phase_id", up3.getPhase_id());
				map.put("sort", String.valueOf(up3.getSort()+1));
				Chapter down = (Chapter)bookDao.one_key_role(Chapter.class.getName(),"sort_chapter1", map);
				up3.setSort(up3.getSort()+1);
				bookDao.update(Chapter.class.getName(), up3);
				down.setSort(up3.getSort()-1);
				bookDao.update(Chapter.class.getName(), down);
			}
			break;
		case "4":
			Chapter up4 = (Chapter)bookDao.one(Chapter.class.getName(), id);
			if(up4.getSort()<(int)bookDao.one_key_role(Chapter.class.getName(),"chapter2_number",up4.getParent_id())){
				map = new HashMap<>();
				map.put("parent_id", up4.getParent_id());
				map.put("sort", String.valueOf(up4.getSort()+1));
				Chapter down = (Chapter)bookDao.one_key_role(Chapter.class.getName(),"sort_chapter2", map);
				up4.setSort(up4.getSort()+1);
				bookDao.update(Chapter.class.getName(), up4);
				down.setSort(up4.getSort()-1);
				bookDao.update(Chapter.class.getName(), down);
			}
			break;
		}
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
	
	@SuppressWarnings("unchecked")
	public void delete(String id,int type){
		int index = 0;
		switch (type) {
		case 1:
			bookDao.update_key_role(Course.class.getName(), "delete", id);
			bookDao.update_key_role(Phase.class.getName(), "delete_course", id);
			bookDao.update_key_role(Chapter.class.getName(), "delete_course", id);
			questionService.delete_course(id);
			break;
		case 2:
			List<Phase> list2 = (List<Phase>)this.search_phase(((Phase)bookDao.one(Phase.class.getName(), id)).getCourse_id());
			index = 1;
			for(Phase e : list2){
				e.setSort(index);
				bookDao.update(Phase.class.getName(), e);
				index++;
			}
			bookDao.update_key_role(Phase.class.getName(), "delete", id);
			bookDao.update_key_role(Chapter.class.getName(), "delete_phase", id);
			questionService.delete_phase(id);
			break;
		case 3:
			List<Chapter> list3 = (List<Chapter>)this.search_chapter1(((Chapter)bookDao.one(Chapter.class.getName(), id)).getPhase_id());
			index = 1;
			for(Chapter e : list3){
				e.setSort(index);
				bookDao.update(Chapter.class.getName(), e);
				index++;
			}
			bookDao.update_key_role(Chapter.class.getName(), "delete_chapter1", id);
			bookDao.update_key_role(Phase.class.getName(), "delete", id);
			questionService.delete_chapter1(id);
			break;
		case 4:
			List<Chapter> list4 = (List<Chapter>)this.search_chapter2(((Chapter)bookDao.one(Chapter.class.getName(), id)).getParent_id());
			index = 1;
			for(Chapter e : list4){
				e.setSort(index);
				bookDao.update(Chapter.class.getName(), e);
				index++;
			}
			bookDao.update_key_role(Phase.class.getName(), "delete", id);
			questionService.delete_chapter2(id);
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
