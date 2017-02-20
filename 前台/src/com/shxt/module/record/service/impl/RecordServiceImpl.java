package com.shxt.module.record.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shxt.module.examnation.model.Examnation;
import com.shxt.module.examnation.service.ExamnationService;
import com.shxt.module.question.model.FillingBlank;
import com.shxt.module.question.model.Question;
import com.shxt.module.question.model.QuestionChoice;
import com.shxt.module.question.service.QuestionService;
import com.shxt.module.record.dao.RecordDao;
import com.shxt.module.record.model.StudentAnswer;
import com.shxt.module.record.model.StudentExamnation;
import com.shxt.module.record.model.StudentFilling;
import com.shxt.module.record.service.RecordService;
import com.shxt.util.DoubleTool;
@Service("recordService")
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordDao recordDao;
	@Autowired
	private ExamnationService examnationService;
	@Autowired
	private QuestionService questionService;
	private StudentAnswer temp1;
	private StudentFilling temp2;
	private Examnation temp3;
	private List<Question> temp4;
	private List<StudentFilling> temp5;
	private List<StudentExamnation> temp6;
	private Map<String,String> map;
	
	
	public StudentExamnation deal_data(StudentExamnation studentExamnation){
		List<StudentExamnation> all_student = recordDao.search_examnation_all(StudentExamnation.class.getName(), studentExamnation.getExamnation_id());
		int max_score  = studentExamnation.getScores();
		int min_score  = studentExamnation.getScores();
		double average_score  = 0;
		double sum = 0;
		int index = 1;
		for(StudentExamnation e : all_student){
			max_score = e.getScores()>max_score?e.getScores():max_score;
			min_score = e.getScores()<min_score?e.getScores():min_score;
			sum+= e.getScores();
			if(e.getScores()>studentExamnation.getScores()){
				index++;
			}
		}
		average_score = DoubleTool.divide(sum, all_student.size(), 2);
		studentExamnation.setMax_score(max_score);
		studentExamnation.setMin_score(min_score);
		studentExamnation.setAverage_score(average_score);
		studentExamnation.setIndex(index);
		studentExamnation.setSize(all_student.size());
		return studentExamnation;
	}
	
	public List<StudentExamnation> search_student_all(String student_id){
		temp6 = recordDao.search_student_all(StudentExamnation.class.getName(), student_id);
		for(StudentExamnation e : temp6){
			e = this.deal_data(e);
		}
		return temp6;
	}
	
	public StudentExamnation search_examnation(String examnation_id,String student_id){
		map = new HashMap<String, String>();
		map.put("student_id", student_id);
		map.put("examnation_id", examnation_id);
		return recordDao.search_examnation(StudentExamnation.class.getName(), map);
	}
	
	public List<StudentAnswer> search_student_answers(String examnation_id,String student_id){
		map = new HashMap<>();
		map.put("examnation_id", examnation_id);
		map.put("student_id", student_id);
		return recordDao.search_student(StudentAnswer.class.getName(), map);
	}
	
	public StudentAnswer search_choice(String student_id,String examnation_id,String question_id,String choice_id){
		map = new HashMap<String, String>();
		map.put("student_id", student_id);
		map.put("examnation_id", examnation_id);
		map.put("question_id", question_id);
		if(choice_id!=null){
			map.put("choice_id", choice_id);
			return recordDao.search_multiple_choice(StudentAnswer.class.getName(), map);
		}else{
			return recordDao.search_single_choice(StudentAnswer.class.getName(), map);
		}
	}
	
	public void record_single_choice(String student_id,String examnation_id,String question_id,String choice_id){
		temp1 = this.search_choice(student_id, examnation_id, question_id,null);
		if(temp1==null){
			temp1 = new StudentAnswer();
			temp1.setId(UUID.randomUUID().toString());
			temp1.setExamnation_id(examnation_id);
			temp1.setQuestion_id(question_id);
			temp1.setExamnation_id(examnation_id);
			temp1.setStudent_id(student_id);
			temp1.setSingle_choice_id(choice_id);
			recordDao.add(temp1, StudentAnswer.class.getName());
		}else if(temp1.getSingle_choice_id().equals(choice_id)){
		}else{
			temp1.setSingle_choice_id(choice_id);
			recordDao.update(StudentAnswer.class.getName(), temp1);
		}
	}
	
	public void record_multiple_choice(String student_id,String examnation_id,String question_id,String choice_id){
		temp1 = this.search_choice(student_id, examnation_id, question_id,choice_id);
		if(temp1==null){
			temp1 = new StudentAnswer();
			temp1.setId(UUID.randomUUID().toString());
			temp1.setExamnation_id(examnation_id);
			temp1.setQuestion_id(question_id);
			temp1.setExamnation_id(examnation_id);
			temp1.setStudent_id(student_id);
			temp1.setMultiple_choice_id(choice_id);
			recordDao.add(temp1, StudentAnswer.class.getName());
		}else{
			recordDao.delete(StudentAnswer.class.getName(), temp1.getId());
		}
	}
	
	public void record_judge(String student_id,String examnation_id,String question_id,String judgement){
		temp1 = this.search_choice(student_id, examnation_id, question_id,null);
		if(temp1==null){
			temp1 = new StudentAnswer();
			temp1.setId(UUID.randomUUID().toString());
			temp1.setExamnation_id(examnation_id);
			temp1.setQuestion_id(question_id);
			temp1.setExamnation_id(examnation_id);
			temp1.setStudent_id(student_id);
			temp1.setAnswer(judgement);
			recordDao.add(temp1, StudentAnswer.class.getName());
		}else{
			temp1.setAnswer(judgement);
			recordDao.update(StudentAnswer.class.getName(), temp1);
		}
	}
	
	public void record_filling(String student_id,String examnation_id,String question_id,String[] blanks){
		if(blanks.length>0){
			String answer_id = UUID.randomUUID().toString();
			temp1 = new StudentAnswer();
			temp1.setId(answer_id);
			temp1.setQuestion_id(question_id);
			temp1.setExamnation_id(examnation_id);
			temp1.setStudent_id(student_id);
			recordDao.add(temp1, StudentAnswer.class.getName());
			for(int i = 0 ; i < blanks.length; i++){
				String uuid = UUID.randomUUID().toString();
				temp2 = new StudentFilling();
				temp2.setId(uuid);
				temp2.setLocation(i);
				temp2.setFilling(blanks[i]);
				temp2.setAnswer_id(answer_id);
				recordDao.add(temp2, StudentFilling.class.getName());
			}
		}
	}
	
	public void record_answer(String student_id,String examnation_id,String question_id,String answer){
		String uuid = UUID.randomUUID().toString();
		System.out.println("答"+uuid);
		temp1 = new StudentAnswer();
		temp1.setId(uuid);
		temp1.setExamnation_id(examnation_id);
		temp1.setQuestion_id(question_id);
		temp1.setExamnation_id(examnation_id);
		temp1.setStudent_id(student_id);
		temp1.setAnswer(answer);
		recordDao.add(temp1, StudentAnswer.class.getName());
	}
	
	@SuppressWarnings("unchecked")
	public void calculate(StudentExamnation studentExamnation){
		int sum = 0;
		temp3 = examnationService.one(studentExamnation.getExamnation_id());
		temp4 = examnationService.search_questions(studentExamnation.getExamnation_id());
		for(Question e : temp4){
			//单选题
			if(e.getTYPE().equals("1")){
				questionService.use_up(e.getId());
				map = new HashMap<>();
				map.put("question_id", e.getId());
				map.put("student_id", studentExamnation.getStudent_id());
				map.put("examnation_id", studentExamnation.getExamnation_id());
				StudentAnswer student_single_choice = recordDao.search_single_choice(StudentAnswer.class.getName(), map);
				QuestionChoice right_choice = (QuestionChoice)questionService.right_choice(e.getId()).get(0);
				if(student_single_choice!=null&&right_choice.getId().equals(student_single_choice.getSingle_choice_id())){
					sum+= temp3.getSingle_choice_score();
					questionService.right_up(e.getId());
				}
			}
			//多选题
			if(e.getTYPE().equals("2")){
				questionService.use_up(e.getId());
				map = new HashMap<>();
				map.put("question_id", e.getId());
				map.put("student_id", studentExamnation.getStudent_id());
				map.put("examnation_id", studentExamnation.getExamnation_id());
				List<StudentAnswer> student_multiple_choices = recordDao.search_multiple_choices(StudentAnswer.class.getName(), map);
				List<QuestionChoice> right_choices = (List<QuestionChoice>)questionService.right_choice(e.getId());
				boolean not_incloud = true;
				if(!student_multiple_choices.isEmpty()){
					for(StudentAnswer f : student_multiple_choices){
						not_incloud = true;
						for(QuestionChoice g : right_choices){
							if(f.getMultiple_choice_id().equals(g.getId())){
								not_incloud = false;
								break;
							}
						}
						if(not_incloud){
							break;
						}
					}
					if(!not_incloud){
						if(student_multiple_choices.size()!=right_choices.size()){
							sum+= temp3.getMultiple_choice_score()/2;
						}else{
							sum+= temp3.getMultiple_choice_score();
							questionService.right_up(e.getId());
						}
					}
				}
			}
			//判断题
			if(e.getTYPE().equals("3")){
				questionService.use_up(e.getId());
				map = new HashMap<>();
				map.put("question_id", e.getId());
				map.put("student_id", studentExamnation.getStudent_id());
				map.put("examnation_id", studentExamnation.getExamnation_id());
				StudentAnswer student_judgement = recordDao.search_single_choice(StudentAnswer.class.getName(), map);
				if(student_judgement!=null&&e.getAnswer().equals(student_judgement.getAnswer())){
					sum+= temp3.getJudge_score();
					questionService.right_up(e.getId());
				}
			}
			//填空题
			if(e.getTYPE().equals("4")){
				questionService.use_up(e.getId());
				map = new HashMap<>();
				map.put("question_id", e.getId());
				map.put("student_id", studentExamnation.getStudent_id());
				map.put("examnation_id", studentExamnation.getExamnation_id());
				StudentAnswer student_filling = recordDao.search_single_choice(StudentAnswer.class.getName(), map);
				List<FillingBlank> right_filling = e.getFilling_blank();
				temp5 = new ArrayList<>();
				if(student_filling!=null){
					for(StudentFilling f : (List<StudentFilling>)recordDao.list_role(StudentFilling.class.getName(), student_filling.getId())){
						temp5.add(f);
					}
					boolean has_right = false;
					boolean all_right = true;
					for(StudentFilling f : temp5){
						for(FillingBlank g : right_filling){
							if(f.getLocation()==g.getLocation()){
								if(f.getFilling().equals(g.getContent())){
									has_right = true;
								}else{
									all_right = false;
								}
							}
						}
					}
					if(all_right){
						sum+= temp3.getFilling_blank_score();
						questionService.right_up(e.getId());
					}else if(has_right){
						sum+= temp3.getFilling_blank_score()/2;
					}
				}
			}
		}
		studentExamnation.setId(UUID.randomUUID().toString());
		studentExamnation.setScores(sum);
		studentExamnation.setTime(studentExamnation.getTime());
		recordDao.add(studentExamnation, StudentExamnation.class.getName());
	}
}
