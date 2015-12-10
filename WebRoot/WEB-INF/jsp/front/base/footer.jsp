<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<!--    		<div class="foot1_wrap"></div> -->
        <div class="foot2_wrap" style="height:200px;">        
	        <div class="foot1" align="center">
		        <img src="resource/images/wx.jpg" />
		        <div >
		        	<p>联系电话：400-021-6639     Email: gongyewang@163.com     地址：上海市闸北区共和新路汶水路12号</p>
		        	<p>COPYRIGHT © 2012-2014 WANGFUJING.COM ALL RIGHTS RESERVED</p>
		        </div>
	        </div>
        </div>
  </body>
</html>
