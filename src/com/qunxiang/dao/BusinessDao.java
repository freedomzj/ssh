package com.qunxiang.dao;

import java.util.List;

import com.common.tag.PageDesc;
import com.qunxiang.action.VO.CommentVO;
import com.qunxiang.bean.Business;

public interface BusinessDao extends BaseDao<Business>{
	public void addBusiness(Business business);
	public void updateBusiness(Business business);
	public  List<Business> findBusinessByTypeAndOrder(Integer typeId,String order);
	public List<Business> findBusinessByType(Integer typeId);
	public List<CommentVO> findCommentById(Integer businessId);
	
	public List<Business> findBusinessByPageSize(Object vote_status,String orderProperty,Integer pageSize);
	
	public Business findByKeyword(String keyword);
	public List<Business> findBusinessByPageDesc(List<String> propertyName,List<Object> value,String orders,PageDesc pageDesc);
}
