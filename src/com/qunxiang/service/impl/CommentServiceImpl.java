package com.qunxiang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qunxiang.bean.Comment;
import com.qunxiang.dao.CommentDao;
import com.qunxiang.service.CommentService;

@Transactional
@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public void saveComment(Comment comment) {
		// TODO Auto-generated method stub
		commentDao.save(comment);	
	}

}
