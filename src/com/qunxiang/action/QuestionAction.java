package com.qunxiang.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qunxiang.bean.Question;
import com.qunxiang.dao.QuestionDao;

@Controller
public class QuestionAction {
	
	@Autowired
	private QuestionDao questionDao;
	private List<Question> questionList;
	public List<Question> getQuestionList() {
		return questionList;
	}


	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}


	public String questionUI(){
		questionList = questionDao.findAll();
		return "questionUI";
	}
}
