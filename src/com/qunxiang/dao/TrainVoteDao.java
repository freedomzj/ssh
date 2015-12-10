package com.qunxiang.dao;

import java.util.List;

import com.common.tag.PageDesc;
import com.qunxiang.action.VO.CommentVO;
import com.qunxiang.bean.Vote;

public interface TrainVoteDao extends BaseDao<Vote> {
	
	public List<Vote> findVoteByState(Integer state);
	public List<Vote> findVoteByParam(Object obj ,String orderProperty);

	public void addVote(Vote vote);
	public void updateVote(Vote vote);
	public List<CommentVO> findCommentById(Integer state);
	
	//��ѯǰ10����¼
	public List<Vote>  findVoteByPageSize(Object vote_status,String orderProperty,Integer pageSize);
	public Vote findByKeyword(String keyword);
	
	/**
	 * 
	 * @param status ״̬ 0δ��� 1���ͨ����2���δͨ��
	 * @param industry ��ҵid
	 * @param orderName �����ֶ�
	 * @return 
	 */
	public List<Vote> findVoteByPageDesc(Integer status,Integer industryId,PageDesc pageDesc);
}
