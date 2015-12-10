package com.qunxiang.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import org.apache.struts2.ServletActionContext;

import com.mysql.jdbc.Field;

/**
 * properties文件工具类
 *
 */
public class PropertiesUtil {
	//配置文件名
	private String properiesName = "";

	public PropertiesUtil() {

	}
	public PropertiesUtil(String fileName) {
		this.properiesName = fileName;
	}
	
	/**
	 * 获取一条指定的配置信息
	 * @param key
	 * @return
	 */
	public String getProperty(String key) {
		String value = "";
		InputStream is = null;
		try {
			is = PropertiesUtil.class.getClassLoader().getResourceAsStream(
					properiesName);
			Properties p = new Properties();
			p.load(is);
			value = p.getProperty(key);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return value;
	}

	/**
	 * 获取所有的配置信息
	 * @return
	 */
	public Properties getProperties() {
		Properties p = new Properties();
		InputStream is = null;
		try {
			is = PropertiesUtil.class.getClassLoader().getResourceAsStream(properiesName);
			p.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return p;
	}

	/**
	 * 向配置文件中写一条配置信息
	 * @param key
	 * @param value
	 */
	public void writeProperty(String key, String value) {
		InputStream is = null;
		OutputStream os = null;
		Properties p = new Properties();
		try {
//			is = new FileInputStream(properiesName);
			is = PropertiesUtil.class.getClassLoader().getResourceAsStream(
					properiesName);
			p.load(is);
			String path = PropertiesUtil.class.getClassLoader().getResource(properiesName).getFile();
			path = path.replaceAll("%20", " ");
			os = new FileOutputStream(path);

			p.setProperty(key, value);
			p.store(os, key);
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != is)
					is.close();
				if (null != os)
					os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	public static void main(String[] args) throws Exception{
		//properties 读取文件
		/*Properties properties = new Properties();
		InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties");
		properties.load(is);
		System.out.println(properties.getProperty("key"));
		is.close();*/
		
		//Properties  写入文件
		Properties properties = new Properties();
		properties.setProperty("key111111", "value111111");
//		路径：D:/workspace/fengpai/WebRoot/WEB-INF/classes/config.properties
//		String path = PropertiesUtil.class.getClassLoader().getResource("config.properties").getFile();
		OutputStream os = new FileOutputStream(new File("config.properties"));
		properties.store(os, "key111111");
		os.close();
		System.out.println("完成...");
		
		File file = new File("config.properties");
		System.out.println("filePath:"+file.getAbsolutePath());
		try {
			BufferedReader reader = new BufferedReader(new FileReader(file));
			String line = reader.readLine();
			while(line !=null){
				System.out.println(line);
				line = reader.readLine();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		
//		String webPath = ServletActionContext.getServletContext().getRealPath("");
//		System.out.println("webPath:"+webPath);
	}

}
