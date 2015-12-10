package com.qunxiang.dao;

import java.util.List;

import com.common.tag.PageDesc;
import com.qunxiang.action.VO.CommentVO;
import com.qunxiang.bean.Train;

public interface TrainDao extends BaseDao<Train> {
	public void addTrain(Train train);
	public void updateTrain(Train train);
	public List<Train> findTrainByType(Integer type);
	public List<CommentVO> findCommentById(Integer state);
	public List<Train> findTrainByPageSize(Object vote_status,String orderProperty,Integer pageSize);
	public Train findByKeyword(String keyword);
	public List<Train> findTrainByPageDesc(Integer status,Integer industryId,PageDesc pageDesc);
	
}
