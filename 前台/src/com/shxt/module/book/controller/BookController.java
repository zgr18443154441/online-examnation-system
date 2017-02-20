package com.shxt.module.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.shxt.module.book.model.Chapter;
import com.shxt.module.book.model.Course;
import com.shxt.module.book.model.Phase;
import com.shxt.module.book.service.BookService;

@Controller
@RequestMapping("book")
public class BookController {
	@Autowired
	private BookService bookService;
	
	
	@RequestMapping("list")
	public ModelAndView courseList(){
		return new ModelAndView("book/sel").addObject("courses", bookService.course_list());
	}
	@RequestMapping("add")
	public ModelAndView add(int type,Course course,Phase phase,Chapter chapter1,Chapter chapter2){
		switch (type) {
		case 1:
			bookService.add_course(course);
			break;
		case 2:
			bookService.add_phase(phase);
			break;
		case 3:
			bookService.add_chapter1(chapter1);
			break;
		case 4:
			bookService.add_chapter2(chapter2);
			break;
		}
		return new ModelAndView("book/manage").addObject("message", bookService.manage());
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(String id,int type){
		bookService.delete(id, type);
		return new ModelAndView("book/manage").addObject("message", bookService.manage());
	}
	
	@RequestMapping("to_add")
	public ModelAndView to_add(int type){
		switch (type) {
		case 1:
			return new ModelAndView("book/add").addObject("type", type);
		case 2:
			return new ModelAndView("book/add").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type);
		case 3:
			return new ModelAndView("book/add").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type);
		case 4:
			return new ModelAndView("book/add").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type);
		}
		return null;
	}
	@RequestMapping("update")
	public ModelAndView update(int type,Course course,Phase phase,Chapter chapter1,Chapter chapter2){
		switch (type) {
		case 1:
			bookService.update_course(course);
			break;
		case 2:
			bookService.update_phase(phase);
			break;
		case 3:
			bookService.update_chapter(chapter1);
			break;
		case 4:
			bookService.update_chapter(chapter2);
			break;
		}
		return new ModelAndView("book/manage").addObject("message", bookService.manage());
	}
	@RequestMapping("to_update")
	public ModelAndView to_update(int type,String course_id,String phase_id,String chapter1_id,String chapter2_id){
		switch (type) {
		case 1:
			return new ModelAndView("book/update").addObject("type", type).addObject("course", bookService.one_course(course_id));
		case 2:
			return new ModelAndView("book/update").addObject("courses", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("phase", bookService.one_phase(phase_id));
		case 3:
			return new ModelAndView("book/update").addObject("courses", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("chapter1", bookService.one_chapter(chapter1_id));
		case 4:
			return new ModelAndView("book/update").addObject("courses", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("chapter2", bookService.one_chapter(chapter2_id));
		}
		return null;
	}
	@RequestMapping("to_manage_sel")
	public ModelAndView to_manage_sel(int type,int style){
		switch (type) {
		case 1:
			return new ModelAndView("book/manage_sel").addObject("course", bookService.course_list()).addObject("type", type).addObject("style", style);
		case 2:
			return new ModelAndView("book/manage_sel").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("style", style).addObject("phase", bookService.phase_list());
		case 3:
			return new ModelAndView("book/manage_sel").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("style", style).addObject("chapter1", bookService.chapter1_list());
		case 4:
			return new ModelAndView("book/manage_sel").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("style", style).addObject("chapter2", bookService.chapter2_list());
		}
		return null;
	}
	@RequestMapping("to_sel")
	public ModelAndView to_sel(int type){
		switch (type) {
		case 1:
			return new ModelAndView("book/sel").addObject("course", bookService.course_list()).addObject("type", type);
		case 2:
			return new ModelAndView("book/sel").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("phase", bookService.phase_list());
		case 3:
			return new ModelAndView("book/sel").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("chapter1", bookService.chapter1_list());
		case 4:
			return new ModelAndView("book/sel").addObject("course", new Gson().toJson(bookService.course_list())).addObject("type", type).addObject("chapter2", bookService.chapter2_list());
		}
		return null;
	}
	@RequestMapping("search")
	@ResponseBody
	public List<?> search_phase(String course_id,String phase_id,String parent_id,int type){
		switch (type) {
		case 2:
			return bookService.search_phase(course_id);
		case 3:
			return bookService.search_chapter1(phase_id);
		case 4:
			return bookService.search_chapter2(parent_id);
		}
		return null;
	}
	
	@RequestMapping("manage")
	public ModelAndView manage(){
		return new ModelAndView("book/manage").addObject("message", bookService.manage());
	}
	
	@RequestMapping("direct_sel")
	public ModelAndView direct_sel(String id,int type){
		switch (type) {
		case 2:
			return new ModelAndView("book/direct_sel").addObject("phase", bookService.search_phase(id)).addObject("type", type);
		case 3:
			return new ModelAndView("book/direct_sel").addObject("chapter1", bookService.search_chapter1(id)).addObject("type", type);
		case 4:
			return new ModelAndView("book/direct_sel").addObject("chapter2", bookService.search_chapter2(id)).addObject("type", type);
		}
		return null;
	}
	
}
