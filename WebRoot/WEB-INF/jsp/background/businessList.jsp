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

	function verifyEntityByTypeAndStatus(id,type,status){
		location.href = "admin_verifyEntityByTypeAndStatus.action?commonId="+id+"&commonType="+type+"&commonStatus="+status;
	}
</script>
</head>
  
  <body>
	<div align="center"  >
      <h1 style="color:red;font-size:30px;margin-top: 50px;">业务能人列表&nbsp;&nbsp;&nbsp;&nbsp;
      </h1>
      <div class="result-wrap" id="businessDiv" >
					      <table id="dg" class="table table-bordered table-hover definewidth m10" >
					         <tr>
					         	<th>编号</th>
					         	<th>主题</th>
					         	<th>类别</th>
					         	<th>挑战和经验</th>
					         	<th>业务特长</th>
					         	<th>熟悉的产品和市场</th>
					         	<th>合作方式</th>
					         	<th>联系人</th>
					         	<th>电话</th>
					         	<th>QQ</th>
					         	<th>邮箱</th>
					         	<th>操作</th>
					         </tr>
					         <tbody id="itemContainer">
					         	<s:iterator value="businessList" status="sta">
					         		<tr>
					         			<td><s:property value="#sta.index+1" /></td>
					         			<td><s:property value="businessName" /></td>
					         			<td>
											<s:if test="businessType==1">供应</s:if>
											<s:else>需求</s:else>
										</td>
					         			<td><s:property value="businessChallengeExperience" /></td>
					         			<td><s:property value="businessHobby" /></td>
					         			<td><s:property value="businessProductMarket" /></td>
					         			<td><s:property value="businessCooperation" /></td>
					         			<td><s:property value="businessConnecter" /></td>
					         			<td><s:property value="businessMobile" /></td>
					         			<td><s:property value="businessQq" /></td>
					         			<td><s:property value="businessEmail" /></td>
					         			<td>
												<s:if test="businessStatus==0">
													<a href="javascript:void(0)" onclick="verifyEntityByTypeAndStatus(<s:property value='businessId' />,'business',1)" class="btn btn-primary">通过</a><br/><br/>
													<a href="javascript:void(0)" onclick="verifyEntityByTypeAndStatus(<s:property value='businessId' />,'business',2)" class="btn btn-primary">不通过</a>
												</s:if>
												<s:else>
													<s:if test="businessStatus==1">
														<button disabled="disabled" class="btn btn-primary">审核通过</button>
													</s:if>
													<s:else>
														<button disabled="disabled" class="btn btn-primary">审核不通过</button>
													</s:else>
												</s:else>
					         			</td>
					         		</tr>
					         	</s:iterator>
					         </tbody>
					      </table>
				         <div class="holder" style="float:right;font-size:20px;margin-right: 100px"></div>
				      </div>
  </body>
</html>
