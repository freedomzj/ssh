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
import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageDesc;
import com.qunxiang.action.VO.CommentVO;
import com.qunxiang.bean.Vote;
import com.qunxiang.dao.TrainVoteDao;

@Repository
@Transactional
public class TrainVoteDaoImpl extends BaseDaoImpl<Vote> implements TrainVoteDao {
	
	public List<Vote> findVoteByState(Integer state){
		List<String> property=new ArrayList<String>();
		property.add("voteType");
		property.add("voteStatus");
		List<Object> obj=new ArrayList<Object>();
		obj.add(state);
		obj.add(1);
		return  findByPropertyList(property,obj);
	}
	
	
	public List<Vote> findVoteByPageSize(Object vote_status,String orderProperty,Integer pageSize){
		List<String> propertyName=new ArrayList<String>();
		propertyName.add("voteType");
		propertyName.add("voteStatus");
		List<Object> value=new ArrayList<Object>();
		value.add(vote_status);
		value.add(1);
		List<String> orderPropertyName =new ArrayList<String>();
		orderPropertyName.add(orderProperty);
		List<String> orderList=new ArrayList<String>();
		orderList.add("desc");
		return findByPropertyListAndOrder(propertyName, value, orderPropertyName, orderList,pageSize);
	};
	
	
	public List<Vote> findVoteByParam(Object vote_status,String orderProperty) {
		// TODO Auto-generated method stub
		List<String> propertyName=new ArrayList<String>();
		propertyName.add("voteType");
		propertyName.add("voteStatus");
		List<Object> value=new ArrayList<Object>();
		value.add(vote_status);
		value.add(1);
		List<String> orderPropertyName =new ArrayList<String>();
		orderPropertyName.add(orderProperty);
		List<String> orderList=new ArrayList<String>();
		orderList.add("desc");
		return findByPropertyListAndOrder(propertyName, value, orderPropertyName, orderList);
	}
	@SuppressWarnings("all")
	@Override
	public List<CommentVO> findCommentById(final Integer stateId) {
		return getHibernateTemplate().execute(new HibernateCallback() {
			public List<CommentVO> doInHibernate(Session session) throws HibernateException {
				Query query = session.createSQLQuery("select u.user_id as userId ,c.comment_id as commentId,c.comment_content as content,u.username as userName" +
						",u.user_img1 as userImg,c.comment_time as time from comment c INNER JOIN user u on u.user_id=c.comment_user_id " +
						"  where c.comment_vote_id="+stateId+"")
						.addScalar("commentId",IntegerType.INSTANCE)
				.addScalar("userId", IntegerType.INSTANCE)
				.addScalar("userName", StringType.INSTANCE)
				.addScalar("userImg", StringType.INSTANCE)
				.addScalar("content",StringType.INSTANCE)
				.addScalar("time",TimestampType.INSTANCE)
				.setResultTransformer(
						Transformers
								.aliasToBean(CommentVO.class));
				return query.list();
			}
		});
	}
	
	public Vote findByKeyword(String keyword){
		String hql = "from Vote v where v.voteTitle like '%"+keyword+"%'";
		List<Vote> list = find(hql);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Vote> findVoteByPageDesc(Integer status, Integer industryId,PageDesc pageDesc) {
		List<String> propertyName=new ArrayList<String>();
		List<Object> value=new ArrayList<Object>();
		propertyName.add("voteStatus");
		value.add(status);
		if(industryId!=null&&industryId!=-1){
			propertyName.add("voteIndustryId");
			value.add(industryId);
		}
		List<String> orderPropertyName =new ArrayList<String>();
		orderPropertyName.add("voteFocusCount");
		List<String> order=new ArrayList<String>();
		order.add("desc");
		return findByPageDesc(propertyName, value, orderPropertyName, order, pageDesc);
	}

	@Override
	public void addVote(Vote vote) {
		save(vote);
	}


	@Override
	public void updateVote(Vote vote) {
		update(vote);
	}

}
