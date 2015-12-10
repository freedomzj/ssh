package com.ssh.test;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qunxiang.bean.Comment;
import com.qunxiang.dao.CommentDao;
import com.qunxiang.service.CommentService;

public class TraTest {

	
	public static void main(String[] args) {
		ApplicationContext context= new ClassPathXmlApplicationContext("applicationContext.xml");
		Comment comment=new Comment();
		comment.setCommentVoteId(1);
		Date date = new Date();
		Timestamp nousedate = new Timestamp(date.getTime());
		comment.setCommentTime(nousedate);
		comment.setCommentContent("≤‚ ‘");
		CommentDao commentDao=(CommentDao)context.getBean("commentDaoImpl");
		commentDao.save(comment);
//		CommentService commentService=(CommentService) context.getBean("commentServiceImpl");
//		commentService.saveComment(comment);
	}
}
