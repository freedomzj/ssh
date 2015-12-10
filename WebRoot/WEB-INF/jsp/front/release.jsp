<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>免费发布信息选类-第一步</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="resource/css/index2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.4.2.min.js"></script>
</head>
<body>
	<div class="wrap">
     	<jsp:include page="base/top.jsp"></jsp:include>
        <div class="content">
        <div class="quick"><a href="index_indexUI.action"><img src="resource/images/home.png" />首页</a> > <span>免费发布信息</span></div>
            <div class="intent2">
             <div class="denlu">
             <div class="cirle">
             <a class="c3" href="index_userUploadUI.action">业务能人</a>
             <a class="c11" href="index_trainUploadUI.action">培训选择</a>
             <a class="c2" href="index_voteUploadUI.action">培训投票</a> 
             </div>
             </div>      
             <div class="" style="height:30px;"></div>      
            <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="" style="height:45px;"></div>
	<jsp:include page="base/footer.jsp"></jsp:include>    
</div>
</body>
</html>

