package com.common.advice;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;


@Component("BeanDefineConfigue") 
public class BeanDefineConfigue  implements ApplicationListener<ContextRefreshedEvent> {

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		ApplicationContext context= event.getApplicationContext();
		System.out.println(context+"spring������ʼ�����================================================"); 
		// TODO Auto-generated method stub
		
	}

}
