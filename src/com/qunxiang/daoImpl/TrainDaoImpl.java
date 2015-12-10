package com.qunxiang.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.hibernate.type.IntegerType;
import org.hibernate.type.StringType;
import org.hibernate.type.TimestampType;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.common.tag.PageDesc;
import com.qunxiang.action.VO.CommentVO;
import com.qunxiang.bean.Business;
import com.qunxiang.bean.Train;
import com.qunxiang.dao.TrainDao;
@Repository
public class TrainDaoImpl extends BaseDaoImpl<Train> implements TrainDao{

	@Override
	public void addTrain(Train train) {
		save(train);
	}

	@Override
	public void updateTrain(Train train) {
		update(train);
	}

	@Override
	public List<Train> findTrainByType(Integer type) {
		// TODO Auto-generated method stub
		List<String> propertyName=new ArrayList<String>();
		List<Object> value=new  ArrayList<Object>();
		propertyName.add("trainType");
		propertyName.add("trainStatus");
		value.add(type);
		value.add(1);
		return findByPropertyList(propertyName, value);
	}
	
	@SuppressWarnings("all")
	@Override
	public List<CommentVO> findCommentById(final Integer stateId) {
		return getHibernateTemplate().execute(new HibernateCallback() {
			public List<CommentVO> doInHibernate(Session session) throws HibernateException {
				Query query = session.createSQLQuery("select u.user_id as userId ,c.comment_id as commentId,c.comment_content as content,u.username as userName" +
						",u.user_img1 as userImg,c.comment_time as time from comment c INNER JOIN user u on u.user_id=c.comment_user_id " +
						"  where c.comment_train_id="+stateId+"")
						.addScalar("commentId",IntegerType.INSTANCE)
				.addScalar("userId", IntegerType.INSTANCE)
				.addScalar("userName", StringType.INSTANCE)
				.addScalar("userImg",  StringType.INSTANCE)
				.addScalar("content", StringType.INSTANCE)
				.addScalar("time", TimestampType.INSTANCE)
				
				.setResultTransformer(
						Transformers
								.aliasToBean(CommentVO.class));
				return query.list();
			}
		});
	}
	
	@Override
	public List<Train> findTrainByPageSize(Object vote_status,
			String orderProperty, Integer pageSize) {
		List<String> propertyName=new ArrayList<String>();
		propertyName.add("trainType");
		propertyName.add("trainStatus");//默认查找必须通过审核的信息
		List<Object> value=new ArrayList<Object>();
		value.add(vote_status);
		value.add(1);
		List<String> orderPropertyName =new ArrayList<String>();
		orderPropertyName.add(orderProperty);
		List<String> orderList=new ArrayList<String>();
		orderList.add("desc");
		return findByPropertyListAndOrder(propertyName, value, orderPropertyName, orderList,pageSize);
	}
	
	public Train findByKeyword(String keyword){
		String hql = "from Train t where t.trainName like '%"+keyword+"%'";
		List<Train> list = find(hql);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public List<Train> findTrainByPageDesc(Integer status,Integer industryId,PageDesc pageDesc) {
		List<String> propertyName=new ArrayList<String>();
		List<Object> value=new ArrayList<Object>();
		propertyName.add("trainType");
		value.add(status);
		if(industryId!=null&&industryId!=-1){
			propertyName.add("trainIndustryId");
			value.add(industryId);
		}
		List<String> orderPropertyName =new ArrayList<String>();
		orderPropertyName.add("trainFocusCount");
		List<String> orderList=new ArrayList<String>();
		orderList.add("desc");
		return findByPageDesc(propertyName, value, orderPropertyName, orderList, pageDesc);
	}
}
