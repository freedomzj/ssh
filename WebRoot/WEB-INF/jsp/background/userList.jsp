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

	function deleteUser(id){
		if(confirm("确定要删除该用户吗？(警告：如果删除该用户那么该用户所发布的一切信息都将会被删除！)")){
			$.post("admin_deleteUser.action",{commonId:id},function(){
				location.reload();
			});
		}
	}
</script>
</head>
  
  <body>
	<div align="center"  >
      <h1 style="color:red;font-size:30px;margin-top: 50px;">会员列表&nbsp;&nbsp;&nbsp;&nbsp;
      </h1>
      <div class="result-wrap" id="userDiv">
					      <table id="dg" class="table table-bordered table-hover definewidth m10" >
					         <tr>
					         	<th>编号</th>
					         	<th>用户名称</th>
					         	<th>手机号码</th>
					         	<th>邮箱</th>
					         	<th>QQ</th>
					         	<th>地址</th>
					         	<th>所在公司</th>
					         	<th>公司简述</th>
					         	<th>人物图片</th>
					         	<th>操作</th>
					         </tr>
					         <tbody id="itemContainer">
					         	<s:iterator value="userList" status="sta">
					         		<tr>
					         			<td><s:property value="#sta.index+1" /></td>
					         			<td><s:property value="username" /></td>
					         			<td><s:property value="userPhone" /></td>
					         			<td><s:property value="userEmail" /></td>
					         			<td><s:property value="userQq" /></td>
					         			<td><s:property value="userAddress" /></td>
					         			<td><s:property value="userCompanyName" /></td>
					         			<td><s:property value="userCompanyDes" /></td>
					         			<td><img src="<s:property value="userImg1" />" width="100px" height="100px" /></td>
					         			<td>
					         				<a href="javascript:void(0)" onclick="deleteUser(<s:property value='userId' />)" class="btn btn-primary">删除</a>
					         			</td>
					         		</tr>
					         	</s:iterator>
					         </tbody>
					      </table>
				         <div class="holder" style="float:right;font-size:20px;margin-right: 100px"></div>
				      </div>
  </body>
</html>
