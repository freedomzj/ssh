package com.qunxiang.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
/*
 * 注意：该类上传文件时，默认将文件保存在项目的根路径的upload文件夹之下
 */
public class UpLoadFile {
	 static String realPath = ServletActionContext.getServletContext().getRealPath("/");
	 static String savePath = "upload";
	//上传文件，获取新文件的路径值
	public static String upload(File file,String fileFileName) throws Exception{
		//构造需要上传的文件对象
		File newFile = new File(realPath+savePath, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + getRandom() + fileFileName.substring(fileFileName.lastIndexOf(".")));
		//执行上传操作
		FileUtils.copyFile(file,newFile);
		//清空文件
		file = null;
		fileFileName = null;
		
		return savePath+"/"+newFile.getName();
	}
	
	public static String upload(File file,String fileFileName,String temp) throws Exception{
		//构造需要上传的文件对象
		File newFile = new File(realPath+savePath, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + getRandom() + fileFileName.substring(fileFileName.lastIndexOf(".")));
		//执行上传操作
		FileUtils.copyFile(file,newFile);
		//清空文件
		file = null;
		fileFileName = null;
		return newFile.getName();
	}
	
	//删除旧文件
	public  static void delete(String fileFileName) throws Exception{
		File oldFile = new File(realPath+fileFileName);
		if(oldFile.exists()){
			FileUtils.forceDelete(oldFile);
		}
	}
	
	//获取随机数字
	public  static String getRandom(){
		return (new Random().nextFloat()+"").substring(2);
	}
}
