<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>业务能人列表</title>
<link href="resource/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="resource/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" >
	$(function(){
		$("[name=files]").change(function(){
	          //file表单选择了文件
	          if($(this).val() != ""){
				 $(this).after("<input type='hidden' name='flags' value="+$(this).attr('id')+" />");
		      }
	     });
	});
</script>
</head>
  
  <body>
	<div align="center">
		 <form action="admin_updateLogo.action" method="post" enctype="multipart/form-data" >
		 	<table class="table table-bordered table-hover definewidth m10" style="width:auto;">
		 		<s:iterator value="logoList"  status="sta" >
		 			<tr>
		 				<td><img src="<s:property value='dataContent' />" width="200px" height="200px"/></td>
		 				<td><input type="file" name="files" class="logo" id="logo<s:property value="#sta.index+1" />" /></td>
<!-- 		 				<input type="hidden" name="contents" value="<s:property value='dataContent' />" /> -->
<!-- 		 				<input type="hidden" name="ids" value="<s:property value='dataId' />" /> -->
<!-- 		 				<input type="hidden" name="descriptions" value="<s:property value='dataDescription' />" /> -->
		 			</tr>
		 		</s:iterator>
		 	</table>
		 	<input type="submit" class="btn btn-primary" value="提交" />
		 </form>
	</div>
  </body>
</html>
