package com.qunxiang.dao;

import java.util.List;

import com.qunxiang.bean.Comment;

public interface CommentDao extends BaseDao<Comment> {

	
	public List<Comment> findBusinessComment(Integer businessId);
	public List<Comment> findCommentByVoteId(Integer voteId);
	
}
