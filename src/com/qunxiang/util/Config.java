package com.qunxiang.util;

import java.util.Properties;



public class Config {
	private static PropertiesUtil pu;
	public static Properties configuration;
	static{
		pu = new PropertiesUtil("config.properties");
		configuration = pu.getProperties();
	}
}
