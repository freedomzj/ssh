package com.qunxiang.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
/*
 * ע�⣺�����ϴ��ļ�ʱ��Ĭ�Ͻ��ļ���������Ŀ�ĸ�·����upload�ļ���֮��
 */
public class UpLoadFile {
	 static String realPath = ServletActionContext.getServletContext().getRealPath("/");
	 static String savePath = "upload";
	//�ϴ��ļ�����ȡ���ļ���·��ֵ
	public static String upload(File file,String fileFileName) throws Exception{
		//������Ҫ�ϴ����ļ�����
		File newFile = new File(realPath+savePath, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + getRandom() + fileFileName.substring(fileFileName.lastIndexOf(".")));
		//ִ���ϴ�����
		FileUtils.copyFile(file,newFile);
		//����ļ�
		file = null;
		fileFileName = null;
		
		return savePath+"/"+newFile.getName();
	}
	
	public static String upload(File file,String fileFileName,String temp) throws Exception{
		//������Ҫ�ϴ����ļ�����
		File newFile = new File(realPath+savePath, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + getRandom() + fileFileName.substring(fileFileName.lastIndexOf(".")));
		//ִ���ϴ�����
		FileUtils.copyFile(file,newFile);
		//����ļ�
		file = null;
		fileFileName = null;
		return newFile.getName();
	}
	
	//ɾ�����ļ�
	public  static void delete(String fileFileName) throws Exception{
		File oldFile = new File(realPath+fileFileName);
		if(oldFile.exists()){
			FileUtils.forceDelete(oldFile);
		}
	}
	
	//��ȡ�������
	public  static String getRandom(){
		return (new Random().nextFloat()+"").substring(2);
	}
}
