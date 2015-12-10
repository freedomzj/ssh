package com.qunxiang.daoImpl;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import com.qunxiang.bean.Data;
import com.qunxiang.dao.BusinessDao;
import com.qunxiang.dao.DataDao;
@Repository
public class DataDaoImpl extends BaseDaoImpl<Data> implements DataDao{

	@Override
	public List<Data> findByValue(String value) {
		String hql = "from Data d where d.dataDescription like '%"+value+"%'";
		return find(hql, null);
	}
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		DataDao businessDao =(DataDao) context.getBean("dataDaoImpl");
		System.out.println(businessDao.findByValue("Ê×Ò³¹ö¶¯Í¼"));
	}
}
