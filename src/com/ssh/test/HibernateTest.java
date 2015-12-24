package com.ssh.test;

import java.io.File;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qunxiang.bean.Order;
import com.qunxiang.bean.Pic;
import com.qunxiang.bean.User;


public class HibernateTest {
	
	private static ApplicationContext context=null;
	private static Session session;
	
	
   /* private static Configuration configuration = null;
     private static SessionFactory sessionFactory = null;
     private static ServiceRegistry serviceRegistry = null;
     public static void main(String[] args) {
         try {
            configuration = new Configuration().configure();
            serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            Session session=sessionFactory.openSession();
          User user= (User) session.load(User.class, 1000003);
       } catch (HibernateException e) {
             e.printStackTrace();
         }
    }*/
	@BeforeClass
	public static void beforeClass(){
		 context=new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	
	@AfterClass
	public static void afterClass(){
		session.flush();
		session.close();
	}
	@Test
	public  void testSaveOrUpdate() {
		SessionFactory factory=(SessionFactory) context.getBean("sessionFactory");
		 session=factory.openSession();
		User user= (User) session.get(User.class, 999999);
		Set<Pic> pic= user.getPicList();
		int temp=6;
		for (Pic pic2 : pic) {
			System.out.println(pic2.getPath());
			pic2.setPath("zengjie"+temp);
			session.update(pic2);
			temp++;
		}
//		System.out.println(user.getOrderLIst().size());
		System.out.println("级联查询------------------");
//		for (Order order : user.getOrderLIst()) {
//			System.out.println(order.getGoodsSet().size());
//		}
//		System.out.println("执行完修改操作"+temp);
//		session.delete(user);
//		System.out.println("删除user");
		
	}
	
	@Test
	public void testFile(){
		try{
			System.out.println(1/0);
		}catch(ArithmeticException a){
			System.err.println("除数为zero"+a);
		}
		
		
	}

}
