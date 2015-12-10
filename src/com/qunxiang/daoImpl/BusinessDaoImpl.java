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
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.common.tag.PageDesc;
import com.qunxiang.action.VO.CommentVO;
import com.qunxiang.bean.Business;
import com.qunxiang.bean.Comment;
import com.qunxiang.dao.BusinessDao;
import com.qunxiang.dao.QueryHelper;
@Repository
public class BusinessDaoImpl extends BaseDaoImpl<Business> implements BusinessDao {

	@Override
	public void addBusiness(Business business) {
		save(business);
	}

	@Override
	public void updateBusiness(Business business) {
		update(business);
	}
	@Override
	public List<Business> findBusinessByType(Integer typeId) {
		List<String> propertyName=new ArrayList<String>();
		propertyName.add("businessType");
		propertyName.add("businessStatus");
		List<Object> value=new ArrayList<Object>();
		value.add(typeId);
		value.add(1);
		return findByPropertyList(propertyName, value);
	}
	
	@Override
	public List<Business> findBusinessByTypeAndOrder(Integer id, String orders) {
		// TODO Auto-generated method stub
		List<String> propertyName=new ArrayList<String>();
		propertyName.add("businessType");
		propertyName.add("businessStatus");
		List<Object> value=new ArrayList<Object>();
		value.add(id);
		value.add(1);
		List<String> orderPropertyName =new ArrayList<String>();
		orderPropertyName.add("businessFocusCount");
		List<String> order=new ArrayList<String>();
		order.add(orders);
		return  findByPropertyListAndOrder(propertyName, value, orderPropertyName, order);
	}
	@SuppressWarnings("all")
	@Override
	public List<CommentVO> findCommentById(final Integer businessId) {
		return getHibernateTemplate().execute(new HibernateCallback() {
			public List<CommentVO> doInHibernate(Session session) throws HibernateException {
				Query query = session.createSQLQuery("select u.user_id as userId ,c.comment_rating as rating,c.comment_id as commentId,c.comment_content as content,u.username as userName" +
						",u.user_img1 as userImg,c.comment_time as time from comment c INNER JOIN user u on u.user_id=c.comment_user_id " +
						"  where c.comment_business_id="+businessId+"")
						.addScalar("commentId",IntegerType.INSTANCE)
				.addScalar("userId",IntegerType.INSTANCE)
				.addScalar("userName",StringType.INSTANCE)
				.addScalar("rating",StringType.INSTANCE)
				.addScalar("userImg",StringType.INSTANCE)
				.addScalar("content",StringType.INSTANCE)
				.addScalar("time",TimestampType.INSTANCE)
				.setResultTransformer(Transformers.aliasToBean(CommentVO.class));
				return query.list();
			}
		});
	}
	
	@Override
	public List<Business> findBusinessByPageSize(Object vote_status,
			String orderProperty, Integer pageSize) {
		List<String> propertyName=new ArrayList<String>();
		propertyName.add("businessType");
		propertyName.add("businessStatus");
		List<Object> value=new ArrayList<Object>();
		value.add(vote_status);
		value.add(1);
		List<String> orderPropertyName =new ArrayList<String>();
		orderPropertyName.add(orderProperty);
		List<String> orderList=new ArrayList<String>();
		orderList.add("desc");
		return findByPropertyListAndOrder(propertyName, value, orderPropertyName, orderList,pageSize);
	}
	
	//此处查询的结果如果有多条的话就返回第一个
	public Business findByKeyword(String keyword){
		String hql = "from Business b where b.businessName like '%"+keyword+"%'";
		List<Business> list = find(hql);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public List<Business> findBusinessByPageDesc(List<String> propertyName,List<Object> value, String orders,PageDesc pageDesc) {
		// TODO Auto-generated method stub
				List<String> orderPropertyName =new ArrayList<String>();
				orderPropertyName.add("businessFocusCount");
				List<String> order=new ArrayList<String>();
				order.add(orders);
		return findByPageDesc(propertyName, value, orderPropertyName, order, pageDesc);
	}
	
	
	
}
