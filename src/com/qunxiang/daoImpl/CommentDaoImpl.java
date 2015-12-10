package com.qunxiang.daoImpl;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qunxiang.bean.Comment;
import com.qunxiang.dao.CommentDao;

@Service
@Transactional
public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao {

	@Override
	public List<Comment> findBusinessComment(Integer businessId) {
		// TODO Auto-generated method stub
		return findByProperty("commentBusinessId", businessId);
	}

	@Override
	public List<Comment> findCommentByVoteId(Integer voteId) {
		// TODO Auto-generated method stub
		return findByProperty("commentVoteId", voteId);
	}
	
}
