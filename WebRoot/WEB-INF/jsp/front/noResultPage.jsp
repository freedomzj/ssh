<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	
  </head>
  
  <body>
	<jsp:include page="base/top.jsp"></jsp:include>
		<br/><br/>
		<div align="center">
			<h2>暂无&nbsp;<strong style="font-size:25px;color:red;" >${keyword}</strong>&nbsp;相关的结果，请更换查询关键字！</h2>
		</div>
		<br/><br/>
	<jsp:include page="base/footer.jsp"></jsp:include>
  </body>
</html>
