package com.qunxiang.util;

import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;
/**
 * Ô¶³ÌÍ¼Æ¬²Ù×÷Àà
 * @author user
 */
public class ImageUtil {
	
	static String realPath = ServletActionContext.getServletContext().getRealPath("/");
	static String savePath = "upload";
	
	public static void main(String[] args) {
		String urlpath = "http://qzapp.qlogo.cn/qzapp/101222140/0A28CEB18AC929659B89306315AB9174/30";
		try {
			new ImageUtil().saveImage(urlpath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static byte[] readStream(InputStream inStream) throws Exception {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = -1;
		while ((len = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, len);
		}
		outStream.close();
		inStream.close();
		return outStream.toByteArray();
	}
	
	public static String saveImage(String imagePath) throws Exception {
		URL url = new URL(imagePath);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setConnectTimeout(6 * 1000);
		if (conn.getResponseCode() == 200) {
			InputStream inStream = conn.getInputStream();
			byte[] data = readStream(inStream);
			File newFile = new File(realPath+savePath, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + UpLoadFile.getRandom() + ".jpg");
			FileOutputStream outStream = new FileOutputStream(newFile);
			outStream.write(data);
			outStream.close();
			return newFile.getName();
		}
		return null;
	}
}
