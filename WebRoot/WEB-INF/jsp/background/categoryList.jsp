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
<link rel="stylesheet" href="resource/css/common.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jPages.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("div.holder1").jPages({  
			  containerID : "itemContainer1",  
			  previous : "上一页",  
			  next : "下一页",  
			  perPage : 5 
		});
      $("div.holder2").jPages({  
			  containerID : "itemContainer2",  
			  previous : "上一页",  
			  next : "下一页",  
			  perPage : 5 
		});

      $("#dialog_close").click(function(){
      	$("#addInfoType").hide();
      });
      $("#closeForm").click(function(){
      	$("#addInfoType").hide();
      });

      $("#submitForm").click(function(){
			if($("#typeName").val() == ""){
				alert("请输入类别");
				return ;
			}

			var flag = $("#dialog_tt_span").html();
			var params = null;
			var url = "";
			if(flag == "添加行业类别"){
				params = {commonType:"industry",commonName:$("#typeName").val()};
				url = "admin_commonAddType.action";
			}else if(flag == "添加部门类别"){
				params = {commonType:"department",commonName:$("#typeName").val()};
				url = "admin_commonAddType.action";
			}else if(flag == "修改行业类别"){
				params = {commonType:"industry",commonName:$("#typeName").val(),commonId:$("#typeId").val()};	
				url = "admin_commonUpdateType.action";
			}else if(flag == "修改部门类别"){
				params = {commonType:"department",commonName:$("#typeName").val(),commonId:$("#typeId").val()};	
				url = "admin_commonUpdateType.action";
			}
			$.post(url,params,function(){
				location.reload();
			});
      });
	});

	function deleteType(id,type){
		if(confirm("确定要删除该类别吗？")){
			$.post("admin_commonDeleteType.action",{commonId:id,commonType:type},function(){
				location.reload();
			});
		}
	}

	function addType(type){
		$("#typeId").val("");
		$("#typeName").val("");
		
		$("#addInfoType").show();
		if(type == "industry"){
			$("#dialog_tt_span").html("添加行业类别");
		}else{
			$("#dialog_tt_span").html("添加部门类别");
		}
	}

	function updateType(id,type,typeName){
		$("#addInfoType").show();
		if(type == "industry"){
			$("#dialog_tt_span").html("修改行业类别");
		}else{
			$("#dialog_tt_span").html("修改部门类别");
		}
		$("#typeId").val(id);
		$("#typeName").val(typeName);
	}
</script>
</head>
  
  <body>
	<div align="center"  >
	      <div class="result-wrap" style="width:600px;float:left;margin-left:50px;">
      		  <h1 style="color:red;font-size:30px;" align="center" >行业类别列表&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:addType('industry')" class="btn btn-primary">添加</a></h1>
		      <table id="dg" class="table table-bordered table-hover definewidth m10" >
		         <tr>
		         	<th>编号</th>
		         	<th>行业类别标题</th>
		         	<th>操作</th>
		         </tr>
		         <tbody id="itemContainer1">
		         	<s:iterator value="industryList"  status="sta">
			         <tr>
			         	<td>
							<s:property value="#sta.index+1" />
			         	</td>
			         	<td><s:property value="industryName" /></td>
			         	<td>
			         		<a href="javascript:void(0)" onclick="deleteType(<s:property value='industryId' />,'industry')" class="btn btn-primary">删除</a>
			         		<a href="javascript:void(0)" onclick="updateType(<s:property value='industryId' />,'industry','<s:property value="industryName" />')" class="btn btn-primary">修改</a>
			         	</td>
			         </tr>
		         </s:iterator>
		         </tbody>
		      </table>
	         <div class="holder1 holder" style="float:right;font-size:20px;margin-right: 100px"></div>
	      </div>
	      
	      <div class="result-wrap" style="width:600px;float:left;margin-left:100px;">
      		  <h1 style="color:red;font-size:30px;" align="center">部门类别列表&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:addType('department')" class="btn btn-primary">添加</a></h1>
		      <table id="dg" class="table table-bordered table-hover definewidth m10" >
		         <tr>
		         	<th>编号</th>
		         	<th>部门类别标题</th>
		         	<th>操作</th>
		         </tr>
		         <tbody id="itemContainer2">
		         	<s:iterator value="departmentList" status="sta">
			         <tr>
			         	<td> <s:property value="#sta.index+1" /></td>
			         	<td><s:property value="departmentName" /></td>
			         	<td>
			         		<a href="javascript:void(0)" onclick="deleteType(<s:property value='departmentId' />,'department')" class="btn btn-primary">删除</a>
			         		<a href="javascript:void(0)" onclick="updateType(<s:property value='departmentId' />,'department','<s:property value="departmentName" />')" class="btn btn-primary">修改</a>
			         	</td>
			         </tr>
		         </s:iterator>
		         </tbody>
		      </table>
	         <div class="holder2 holder" style="float:right;font-size:20px;margin-right: 100px"></div>
	      </div>
	      
		</div>
		
		<!-- 通用dialog弹窗 -->
     <div id="addInfoType" class="dialog" style="width:400px;">
		<div class="dialog_tt" style="width:400px;">
			<span id="dialog_tt_span"></span>
			<a href="javascript:void(0)" class="dialog_close" id="dialog_close">X</a>
		</div>
		<div class="dialog_ctn" style="width:400px;">
	       <!-- 类别id -->
		   	  <table align="center">
			      <tr>
			        <td>类别名称：</td>
			        <td>
			        	<input type="text" name="name" value="" id="typeName"/>
			        	<input type="hidden" value="" id="typeId"/>
					</td>
			      </tr>
			      <tr>
			        <td colsapn="2">
						<input type="button" value="提交" class="btn btn-success" id="submitForm"/>
						<input type="button" value="取消" class="btn btn-success" id="closeForm"/>
			        </td>
			      </tr>
		  	 </table>
		</div>
	</div>
  </body>
</html>
