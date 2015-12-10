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
<link rel="stylesheet" href="resource/css/animate.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/jPages.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jPages.min.js"></script>
<script type="text/javascript">
	$(function(){
	    $("div.holder").jPages({  
		  containerID : "itemContainer",  
		  previous : "上一页",  
		  next : "下一页",  
		  perPage : 5 
		});
	});

	function deleteComment(id){
		if(confirm("确定要删除该条评论吗？")){
			$.post("admin_deleteComment.action",{commonId:id},function(){
				location.reload();
			});
		}
	}
</script>
</head>
  
  <body>
	<div align="center"  >
      <h1 style="color:red;font-size:30px;margin-top: 50px;">评论列表&nbsp;&nbsp;&nbsp;&nbsp;
      </h1>
      <div class="result-wrap" id="businessDiv" style="width:100%;">
					      <table id="dg" class="table table-bordered table-hover definewidth m10" >
					         <tr>
					         	<th>编号</th>
					         	<th>内容</th>
					         	<th>时间</th>
					         	<th>好评度</th>
					         	<th>操作</th>
					         </tr>
					         <tbody id="itemContainer">
					         	<s:iterator value="commentList" status="sta">
					         		<tr>
					         			<td><s:property value="#sta.index+1" /></td>
					         			<td><s:property value="commentContent" /></td>
					         			<td><s:date name="commentTime" format="yyyy-MM-dd hh:mm" /></td>
					         			<td><s:property value="commentRating" /></td>
					         			<td>
					         				<a href="javascript:void(0)" onclick="deleteComment(<s:property value='commentId' />)" class="btn btn-primary">删除</a>
					         			</td>
					         		</tr>
					         	</s:iterator>
					         </tbody>
					      </table>
				         <div class="holder" style="float:right;font-size:20px;margin-right: 100px"></div>
				      </div>
  </body>
</html>
