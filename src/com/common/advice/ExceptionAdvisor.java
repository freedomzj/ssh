package com.common.advice;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.dao.DataAccessException;

import com.common.exception.BusinessException;

/**
 * ��Spring AOP���� ����쳣��Ϣ���ѳ����쳣����ҵ���쳣 
 * @author Administrator
 *
 */
public class ExceptionAdvisor implements ThrowsAdvice {
	public void afterThrowing(Method method, Object[] args, Object target,
			Exception ex) throws Throwable {
		// �ں�̨����������쳣�쳣��Ϣ��ͨ��log4j�����
		Logger log = Logger.getLogger(target.getClass());
		log.info("**************************************************************");
		log.info("Error happened in class: " + target.getClass().getName());
		log.info("Error happened in method: " + method.getName());
		for (int i = 0; i < args.length; i++) {
			log.info("arg[" + i + "]: " + args[i]);
		}
		log.info("Exception class: " + ex.getClass().getName());
		log.info("ex.getMessage():" + ex.getMessage());
		ex.printStackTrace();
		log.info("**************************************************************");

		// �������ж��쳣�����ݲ�ͬ���쳣���ش���
		if(ex.getClass().equals(BusinessException.class)){
			throw ex;
		}else if (ex.getClass().equals(DataAccessException.class)) {
			ex.printStackTrace();
			throw new BusinessException("���ݿ����ʧ�ܣ�");
		} else if (ex.getClass().toString()
				.equals(NullPointerException.class.toString())) {
			ex.printStackTrace();
			throw new BusinessException("������δ����ʼ���Ķ�������ǲ����ڵĶ���");
		} else if (ex.getClass().equals(IOException.class)) {
			ex.printStackTrace();
			throw new BusinessException("IO�쳣��");
		} else if (ex.getClass().equals(ClassNotFoundException.class)) {
			ex.printStackTrace();
			throw new BusinessException("ָ�����಻���ڣ�");
		} else if (ex.getClass().equals(ArithmeticException.class)) {
			ex.printStackTrace();
			throw new BusinessException("��ѧ�����쳣��");
		} else if (ex.getClass().equals(ArrayIndexOutOfBoundsException.class)) {
			ex.printStackTrace();
			throw new BusinessException("�����±�Խ��!");
		} else if (ex.getClass().equals(IllegalArgumentException.class)) {
			ex.printStackTrace();
			throw new BusinessException("�����Ĳ�������");
		} else if (ex.getClass().equals(ClassCastException.class)) {
			ex.printStackTrace();
			throw new BusinessException("����ǿ��ת������");
		} else if (ex.getClass().equals(SecurityException.class)) {
			ex.printStackTrace();
			throw new BusinessException("Υ����ȫԭ���쳣��");
		} else if (ex.getClass().equals(SQLException.class)) {
			ex.printStackTrace();
			throw new BusinessException("�������ݿ��쳣��");
		} else if (ex.getClass().equals(NoSuchMethodError.class)) {
			ex.printStackTrace();
			throw new BusinessException("����ĩ�ҵ��쳣��");
		} else if (ex.getClass().equals(InternalError.class)) {
			ex.printStackTrace();
			throw new BusinessException("Java������������ڲ�����");
		} else {
			ex.printStackTrace();
			throw new BusinessException("���˵�С��������");
		}
	}

}
