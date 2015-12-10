<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>

<link href="resource/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="resource/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="resource/css/common.css" rel="stylesheet" type="text/css" />
<link href="resource/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="resource/css/animate.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/jPages.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jPages.min.js"></script>
<script type="text/javascript" src="resource/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" >
	$(function () {
		//检查密码是否正确
		   $("#currentPassword").blur(function(){
			   var currentPassword = $("[name=currentPassword]").val();
				if(currentPassword == ""){
					return;
				}

				$.post("user_isRight.action",{password:currentPassword},function(status){
					if(status == "false"){
						$("#hidCurrentPassword").val("原密码输入有误！");
					}else{
						$("#hidCurrentPassword").val("原密码输入正确！");
					}
					$("[name=currentPassword]").next().html($("#hidCurrentPassword").val());
				});
			});

			//提交表单
			$("#submitForm").click(function(){
				if($("[name=file]").val() == ""){
					$("[name=file]").next().html("请选择图片！");
					return;
				}
				$("#imageForm").submit();
			});
		
		$('.tab ul.menu li').click(function(){
		//获得当前被点击的元素索引值
		 var Index = $(this).index();
		 var line=120*Index-120; 
		//给菜单添加选择样式
		$(this).addClass('active').siblings().removeClass('active');
		/*.line*/ $("").stop(true,true).animate({left:line},200);
		
		//显示对应的div
		$('.tab').children('div').eq(Index).show().siblings('div').hide();
	   });

		$("#form0").Validform({
			tiptype:function(msg,o,cssctl){
			    o.obj.next().text(msg);
			},
			beforeSubmit:function(curform){
				//在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话表单将不会提交;	
				alert("修改成功！");
			},
			showAllError:false,
			tipSweep:false//表单提交时才会触发验证，失去焦点不会触发验证
		});
	});

	function checkForm(){
		//每次提交事件触发时，清空所有的错误信息
		$(".msg").each(function(){
			$(this).html("");
		});

		var currentPassword = $("[name=currentPassword]").val();
		var newPassword = $("[name=newPassword]").val();
		var surePassword = $("[name=surePassword]").val();
		if(currentPassword == ""){
			$("[name=currentPassword]").next().html("请输入旧密码！");
			return false;
		}
		if(newPassword == ""){
			$("[name=newPassword]").next().html("请输入新密码！");
			return false;
		}
		if(surePassword == ""){
			$("[name=surePassword]").next().html("请输入确认新密码！");
			return false;
		}
		if(currentPassword == newPassword){
			$("[name=newPassword]").next().html("新密码不能和原密码一致！");
			return false;
		}
		if($("#hidCurrentPassword").val() == "原密码输入有误！"){
			$("[name=currentPassword]").next().html("原密码输入有误！");
			return false;
		}
		alert("原密码修改成功！");
		return true;
	}
</script>
<script type="text/javascript">
	$(function(){
		 $(function(){
            $("div.holder1").jPages({  
				  containerID : "itemContainer1",  
				  previous : "上一页",  
				  next : "下一页",  
				  perPage : 2 
			});
            $("div.holder2").jPages({  
				  containerID : "itemContainer2",  
				  previous : "上一页",  
				  next : "下一页",  
				  perPage : 2 
			});
            $("div.holder3").jPages({  
				  containerID : "itemContainer3",  
				  previous : "上一页",  
				  next : "下一页",  
				  perPage : 2 
			});
		});
	});


	$(function(){
		$("[name=files]").change(function(){
	          //file表单选择了文件
	          if($(this).val() != ""){
				 $(this).next().after("<input type='hidden' name='flags' value="+$(this).attr('id')+" />");
		      }
	     });
	});

	function findEntityByIdAndType(id,type){
		$.getJSON("user_findEntityByIdAndType.action",{commonId:id,commonType:type},function(result){
// 			alert(result);
			if(type == "business"){
				$("#updateBusiness").show();
				$("#updateBusiness").replaceAll($("#businessDiv"));

				//赋值操作
				$("#businessId").val(result.businessId);
				$("#businessStatus").val(result.businessStatus);
				$("#businessType").val(result.businessType);
				$("#businessFocusCount").val(result.businessFocusCount);
				$("#businessName").val(result.businessName);
				$("#businessConnecter").val(result.businessConnecter);
				$("#businessMobile").val(result.businessMobile);
				$("#businessQq").val(result.businessQq);
				$("#businessEmail").val(result.businessEmail);
				$("#businessRequire").val(result.businessRequire);
				$("#businessChallengeExperience").val(result.businessChallengeExperience);
				$("#businessHobby").val(result.businessHobby);
				$("#businessProductMarket").val(result.businessProductMarket);
				$("#businessCooperation").val(result.businessCooperation);
				$("#businessDescription").val(result.businessDescription);
				$("#businessHidImg1").val(result.businessImg1);
				$("#businessHidImg2").val(result.businessImg2);

				if(result.businessType == 1){
					//供应
					$("#businessRequireTR").hide();
					$("#businessXuQiuImg").hide();
				}else{
					//需求
					$("#businessHobbyTR").hide();
					$(".businessGongYingImg").hide();
				}

				$("#businessIndustryId").children("option").each(function(){
					if($(this).val() == result.businessIndustryId){
						$(this).attr("selected","selected");
					}
				});
				$("#businessDepartmentId").children("option").each(function(){
					if($(this).val() == result.businessDepartmentId){
						$(this).attr("selected","selected");
					}
				});

				$("#businessShowImg1").attr("src",result.businessImg1);
				$("#businessShowImg2").attr("src",result.businessImg2);
			}else if(type == "train"){
				$("#updateTrain").show();
				$("#updateTrain").replaceAll($("#trainDiv"));

			     $("#trainId").val(result.trainId);
			     $("#trainName").val(result.trainName);
			     $("#trainPrice").val(result.trainPrice);
			     $("#trainConnecter").val(result.trainConnecter);
			     $("#trainPhone").val(result.trainPhone);
			     $("#trainMobile").val(result.trainMobile);
			     $("#trainEmail").val(result.trainEmail);
			     $("#trainQq").val(result.trainQq);
			     $("#trainFocusCount").val(result.trainFocusCount);
			     $("#trainStatus").val(result.trainStatus);
			     $("#trainType").val(result.trainType);
			     $("#trainTeacher").val(result.trainTeacher);
			     $("#trainCompanyName").val(result.trainCompanyName);
			     $("#trainCompanyEmail").val(result.trainCompanyEmail);
			     $("#trainRequire").val(result.trainRequire);
			     $("#trainQuestionChallenge").val(result.trainQuestionChallenge);
			     $("#trainContentOutline").val(result.trainContentOutline);
			     $("#trainCompanyDes").val(result.trainCompanyDes);
			     $("#trainOther").val(result.trainOther);
			     $("#trainHidImg1").val(result.trainImg1);
			     $("#trainHidImg2").val(result.trainImg2);

			     if(result.trainType == 1){
					//供应
			    	 $("#trainXuQiuImg").hide();
			    	 $("#trainPoqieduTR").hide();
			    	 $("#trainRequireTR").hide();	
				 }else{
					//需求
					  $(".trainGongYingImg").hide();
					  $("#trainPriceTR").hide();
					  $("#trainTeacherTR").hide();
					  $("#trainContentOutlineTR").hide();
				 }

				$("#trainIndustryId").children("option").each(function(){
					if($(this).val() == result.trainIndustryId){
						$(this).attr("selected","selected");
					}
				});
				$("#trainDepartmentId").children("option").each(function(){
					if($(this).val() == result.trainDepartmentId){
						$(this).attr("selected","selected");
					}
				});
				$("#trainPoqiedu").children("option").each(function(){
					if($(this).val() == result.trainPoqiedu){
						$(this).attr("selected","selected");
					}
				});
				
				$("#trainShowImg1").attr("src",result.trainImg1);
				$("#trainShowImg2").attr("src",result.trainImg2);
			}else if(type == "vote"){
				$("#updateVote").show();
				$("#updateVote").replaceAll($("#voteDiv"));

			     $("#voteId").val(result.voteId);
			     $("#voteTitle").val(result.voteTitle);
			     $("#voteRequire").val(result.voteRequire);
			     $("#voteQuestionChallenge").val(result.voteQuestionChallenge);
			     $("#voteContentOutline").val(result.voteContentOutline);
			     $("#voteReuqire").val(result.voteReuqire);
			     $("#voteCompanyName").val(result.voteCompanyName);
			     $("#voteConnecter").val(result.voteConnecter);
			     $("#voteMobile").val(result.voteMobile);
			     $("#votePhone").val(result.votePhone);
			     $("#voteQq").val(result.voteQq);
			     $("#voteOther").val(result.voteOther);
			     $("#publishTime").val(result.publishTime);
			     $("#auther").val(result.auther);
			     $("#voteCommentCount").val(result.voteCommentCount);
			     $("#voteFocusCount").val(result.voteFocusCount);
			     $("#voteViewCount").val(result.voteViewCount);
			     $("#voteType").val(result.voteType);
			     $("#voteStatus").val(result.voteStatus);
			     $("#voteEmail").val(result.voteEmail);

			     if(result.voteType == 1){
				     //供应
					 $("#voteRequireTR").hide();
				 }else{
					 //需求
					 $("#voteContentOutlineTR").hide();
				 }

			     $("#voteIndustryId").children("option").each(function(){
						if($(this).val() == result.voteIndustryId){
							$(this).attr("selected","selected");
						}
				});
			}
		});
	}
</script>
<style type="text/css">
	.error,.msg{
		font-size: 12px;
		color:red;
	}
</style>
</head>
<body>
	<div class="wrap">
		<!-- 头部 -->
		<jsp:include page="base/top.jsp"></jsp:include>
		
		<div class="content" style="width:100%">
		    <!-- 左边 -->
			<div class="door_class left" style="height:400px;margin-left:50px">
				<h2>用户中心</h2>
				<ul>
		            <li><a href="user_userUI.action?manageType=updateInfo">相关资料</a></li>
		            <li><a href="user_toUpdatePwd.action?manageType=updatePwd">修改密码</a></li>
		            <li><a href="user_toUpdateImage.action?manageType=updateImg">图片修改</a></li>
	            </ul>
	            <h2>信息发布</h2>
				<ul>
		            <li><a href="user_toBusinessUI.action?manageType=business">业务能人</a></li>
		            <li><a href="user_toTrainUI.action?manageType=train">培训选择</a></li>
		            <li><a href="user_toVoteUI.action?manageType=vote">培训投票</a></li>
	            </ul>
			</div>
		
		<div class="cont_right" style="width:80%;margin-right:100px;">
	        <!-- 信息发布 -->
	        <s:if test="manageType=='business' || manageType=='train' || manageType=='vote'">
	        	<div class="tab pdides01" style="width:100%">
		          <ul class="menu">
		            <li <s:if test="manageType=='business'">class="active"</s:if> onclick="javascript:location.href='user_toBusinessUI.action?manageType=business'">能人列表</li>
		            <li <s:if test="manageType=='train'">class="active"</s:if> onclick="javascript:location.href='user_toTrainUI.action?manageType=train'">培训列表</li>
		            <li <s:if test="manageType=='vote'">class="active"</s:if> onclick="javascript:location.href='user_toVoteUI.action?manageType=vote'">投票列表</li>
		          </ul>
		          <div class="con1" <s:if test="manageType!='business'">style="display:none;"</s:if> >
		              <!-- 业务能人模块 -->
		          	  <div class="result-wrap" id="businessDiv" style="width:100%;">
		          	     <s:if test="businessList.size()==0">
		          	     	<h3>你还没有发布过业务能人，赶快去<span><a href="index_userUploadUI.action"  style="font-size:30px;">发布</a></span>吧！</h3>
		          	     </s:if>
		          	     <s:else>
					      <table id="dg" class="table table-bordered table-hover definewidth m10" >
					         <tr>
					         	<th>编号</th>
					         	<th>主题</th>
					         	<th>类别</th>
					         	<th>审核状态</th>
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
					         <tbody id="itemContainer1">
					         	<s:iterator value="businessList" status="sta">
					         		<tr>
					         			<td><s:property value="#sta.index+1" /></td>
					         			<td><s:property value="businessName" /></td>
					         			<td>
											<s:if test="businessType==1">供应</s:if>
											<s:else>需求</s:else>
										</td>
					         			<td>
					         					<s:if test="businessStatus==0">未审核</s:if>
					         					<s:elseif test="businessStatus==1">审核通过</s:elseif>
												<s:else>审核未通过</s:else>
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
					         				<a href="javascript:void(0)" onclick="findEntityByIdAndType(<s:property value='businessId' />,'business')" class="btn btn-primary">修改</a>
					         			</td>
					         		</tr>
					         	</s:iterator>
					         </tbody>
					      </table>
				         <div class="holder holder1" style="float:right;font-size:20px;margin-right: 100px"></div>
				         </s:else>
				      </div>
		          </div>
		          <div class="con1" <s:if test="manageType!='train'">style="display:none;"</s:if> >
		              <!-- 培训机构模块 -->
		          	  <div class="result-wrap" id="trainDiv">
		          	 	 <s:if test="trainList.size()==0">
		          	     	<h3>你还没有发布过培训机构，赶快去<span><a href="index_trainUploadUI.action"  style="font-size:30px;">发布</a></span>吧！</h3>
		          	     </s:if>
		          	     <s:else>
					      <table id="dg" class="table table-bordered table-hover definewidth m10">
					         <tr>
					         	<th>编号</th>
					         	<th>课程主题</th>
					         	<th>类别</th>
					         	<th>审核状态</th>
					         	<th>问题和挑战</th>
					         	<th>内容介绍和大纲</th>
					         	<th>推荐老师</th>
					         	<th>参考报价</th>
					         	<th>迫切度</th>
					         	<th>公司名称</th>
					         	<th>联系人</th>
					         	<th>电话</th>
					         	<th>QQ</th>
					         	<th>企业邮箱</th>
					         	<th>企业介绍</th>
					         	<th>操作</th>
					         </tr>
					         <tbody id="itemContainer2">
					         		<s:iterator value="trainList" status="sta">
					         			<tr>
					         				<td><s:property value="#sta.index+1" /></td>
					         				<td><s:property value="trainName" /></td>
					         				<td>
												<s:if test="trainType==1">供应</s:if>
												<s:else>需求</s:else>
											</td>
					         				<td>
					         					<s:if test="trainStatus==0">未审核</s:if>
					         					<s:elseif test="trainStatus==1">审核通过</s:elseif>
												<s:else>审核未通过</s:else>
					         				</td>
					         				<td><s:property value="trainQuestionChallenge" /></td>
					         				<td><s:property value="trainContentOutline" /></td>
					         				<td><s:property value="trainTeacher" /></td>
					         				<td><s:property value="trainPrice" /></td>
					         				<td><s:property value="trainPoqiedu" /></td>
					         				<td><s:property value="trainCompanyName" /></td>
					         				<td><s:property value="trainConnecter" /></td>
					         				<td><s:property value="trainMobile" /></td>
					         				<td><s:property value="trainQq" /></td>
					         				<td><s:property value="trainCompanyEmail" /></td>
					         				<td><s:property value="trainCompanyDes" /></td>
					         				<td>
					         					<a href="javascript:void(0)" onclick="findEntityByIdAndType(<s:property value='trainId' />,'train')" class="btn btn-primary">修改</a>
					         				</td>
					         			</tr>
					         		</s:iterator>
					         </tbody>
					      </table>
				         <div class="holder holder2" style="float:right;font-size:20px;margin-right: 100px"></div>
				         </s:else>
				      </div>
		          </div>
		          <div class="con1" <s:if test="manageType!='vote'">style="display:none;"</s:if> >
		             <!-- 投票模块 -->
		          	 <div class="result-wrap" id="voteDiv">
		          	 	<s:if test="voteList.size()==0">
		          	     	<h3>你还没有发布过培训投票，赶快去<span><a href="index_voteUploadUI.action"  style="font-size:30px;">发布</a></span>吧！</h3>
		          	     </s:if>
		          	     <s:else>
					      <table id="dg" class="table table-bordered table-hover definewidth m10">
					         <tr>
					         	<th>编号</th>
					         	<th>主题</th>
					         	<th>类别</th>
					         	<th>审核状态</th>
					         	<th>问题和挑战</th>
					         	<th>要求</th>
					         	<th>公司名称</th>
					         	<th>联系人</th>
					         	<th>电话</th>
					         	<th>QQ</th>
					         	<th>邮箱</th>
					         	<th>操作</th>
					         </tr>
					         <tbody id="itemContainer3">
					         	<s:iterator value="voteList" status="sta">
					         		<tr>
					         			<td><s:property value="#sta.index+1" /></td>
					         			<td><s:property value="voteTitle" /></td>
					         			<td>
											<s:if test="voteType==1">供应</s:if>
											<s:else>需求</s:else>
										</td>
				         				<td>
				         					<s:if test="voteStatus==0">未审核</s:if>
				         					<s:elseif test="voteStatus==1">审核通过</s:elseif>
											<s:else>审核未通过</s:else>
				         				</td>
				         				<td><s:property value="voteQuestionChallenge" /></td>
					         			<td><s:property value="voteRequire" /></td>
					         			<td><s:property value="voteCompanyName" /></td>
					         			<td><s:property value="voteConnecter" /></td>
					         			<td><s:property value="voteMobile" /></td>
					         			<td><s:property value="voteQq" /></td>
					         			<td><s:property value="voteEmail" /></td>
				         				<td>
				         					<a href="javascript:void(0)" onclick="findEntityByIdAndType(<s:property value='voteId' />,'vote')" class="btn btn-primary">修改</a>
				         				</td>
					         		</tr>
					         	</s:iterator>
					         </tbody>
					      </table>
				         <div class="holder holder3" style="float:right;font-size:20px;margin-right: 100px"></div>
				         </s:else>
				      </div>
		          </div>
		        </div>
	        </s:if>
	        
	        <s:else>
	        <!-- 用户中心 -->
			<div class="tab pdides01">
	          <ul class="menu">
	            <li <s:if test="manageType=='updateInfo'">class="active"</s:if> onclick="javascript:location.href='user_userUI.action?manageType=updateInfo'">相关资料</li>
	            <li <s:if test="manageType=='updatePwd'">class="active"</s:if> onclick="javascript:location.href='user_toUpdatePwd.action?manageType=updatePwd'">修改密码</li>
	            <li <s:if test="manageType=='updateImg'">class="active"</s:if> onclick="javascript:location.href='user_toUpdateImage.action?manageType=updateImg'">图片修改</li>
	          </ul>
	          <div class="con1" <s:if test="manageType!='updateInfo'">style="display:none;"</s:if> >
	            <form name="form0" method="post" action="user_updateInfo.action" id="form0">
				<ul class="ulInfo">
				<li>● 请完善以下资料！</li>
				</ul>
				<div class="dataView member denlu">
	     			<input type="hidden" name="user.userId" value="<s:property value='user.userId' />"/>
	     			<input type="hidden" name="user.password" value="<s:property value='user.password' />"/>
	     			<input type="hidden" name="user.userStatus" value="<s:property value='user.userStatus' />"/>
	     			<input type="hidden" name="user.userFocusCount" value="<s:property value='user.userFocusCount' />"/>
	     			<input type="hidden" name="user.userTypeId" value="<s:property value='user.userTypeId' />"/>
	     			<input type="hidden" name="user.userDetailDes" value="<s:property value='user.userDetailDes' />"/>
	     			<input type="hidden" name="user.userSelfDes" value="<s:property value='user.userSelfDes' />"/>
	     			<input type="hidden" name="user.userImg1" value="<s:property value='user.userImg1' />"/>
	     			<input type="hidden" name="user.userImg2" value="<s:property value='user.userImg2' />"/>
					<dl><dt>用户名：</dt><dd><input class="inputB" type="text" name="user.username" value="<s:property value='user.username' />" size="20" maxlength="50" readonly="true" /><font color="#FF0000" class="msg"></font></dd></dl>
					<dl><dt>企业名称：</dt><dd><input class="inputC" type="text" name="user.userCompanyName" value="<s:property value='user.userCompanyName' />" datatype="*" nullmsg="请输入企业名称" sucmsg=" " size="30" maxlength="50" /><font color="#FF0000" class="msg"></font></dd></dl>
					<dl><dt>联系人：</dt><dd><input class="inputC" type="text" name="user.userConecter" value="<s:property value='user.userConecter' />" datatype="*" nullmsg="请输入联系人名称" sucmsg=" " size="50" maxlength="50" require="false" msg="联系人不正确" /><font color="#FF0000" class="msg"></dd></font></dl>
					<dl><dt>电　话：</dt><dd><input class="inputC" type="text" name="user.userPhone" value="<s:property value='user.userPhone' />" datatype="m" nullmsg="请输入座机号码" sucmsg=" " errormsg="请输入正确的座机号码" size="20" maxlength="30" require="false" dataType="Phone" msg="固定电话不正确" /><font color="#FF0000" class="msg"></font></dd></dl>
					<dl><dt>手　机：</dt><dd><input class="inputC" type="text" name="user.userMobile" value="<s:property value='user.userMobile' />" datatype="m" nullmsg="请输入手机号码" sucmsg=" " errormsg="请输入正确的手机号码" size="20" maxlength="50" /><font color="#FF0000" class="msg"></font></dd></dl>
					<dl><dt>地　址：</dt><dd><input class="inputC" type="text" name="user.userAddress" value="<s:property value='user.userAddress' />" datatype="*" nullmsg="请输入地址" sucmsg=" " size="30" maxlength="50" /><font color="#FF0000" class="msg"></font></dd></dl>
					<dl><dt>邮　箱：</dt><dd><input class="inputC" type="text" name="user.userEmail" value="<s:property value='user.userEmail' />" datatype="e" nullmsg="请输入邮箱" sucmsg=" " errormsg="请输入正确的邮箱" size="50" maxlength="50" /><font color="#FF0000" class="msg"></font></dd></dl>
					<dl><dt>ＱＱ：</dt><dd><input class="inputC" type="text" name="user.userQq" value="<s:property value='user.userQq' />" datatype="*" nullmsg="请输入qq" sucmsg=" " errormsg="请输入正确的qq" size="20" maxlength="50" /></dd></dl>
					<dl><dt>企业介绍：</dt><dd><textarea class="inputC" id="content" name="user.userCompanyDes" style="width:1000px;height:200px"><s:property value='user.userCompanyDes' /></textarea> 
					<br />（请提供企业营业执照等图片，加强可信度。）</dd></dl>
					<dl><dt>&nbsp;</dt><dd><input class="u_wrzhu" type="submit" id="fDo" name="fDo" value="提交" /></dd><div class="CB"></div></dl>
				</div>
				</form>
	          </div>
	          
	          <div class="con1" <s:if test="manageType!='updatePwd'">style="display:none;"</s:if> >
	          	<form id="Login" name="Login" method="post" action="user_updatePwd.action" onsubmit="return checkForm();">
					<ul class="ulInfo">
					<li>● 定期更换密码可以让您的账户更加安全。</li>
					</ul>
					<div class="dataView member denlu">
					<input type="hidden" value="原密码输入有误！" id="hidCurrentPassword"/>
					<dl><dt>当前密码：</dt><dd><input class="inputC" type="password" name="currentPassword" id="currentPassword" value="" size="30" maxlength="50" /> <font class="msg"></font></dd></dl>
					<dl><dt>新密码：</dt><dd><input class="inputC" type="password" name="newPassword" value="" size="30" maxlength="50" /> <font class="msg"></font></dd></dl>
					<dl><dt>确认新密码：</dt><dd><input class="inputC" type="password" name="surePassword" value="" size="30" maxlength="50" /> <font class="msg"></font></dd></dl>
					<dl><dt>&nbsp;</dt><dd><input class="u_wrzhu" id="fDo" name="fDo" type="submit" value="提 交" /></dd></dl>
					<div class="clear"></div>
					</div>
				</form>
	          </div>
	          
	          <div class="con1  denlu" <s:if test="manageType!='updateImg'">style="display:none;"</s:if> >
	          	<form method="post" action="user_updateImage.action" id="imageForm"  enctype="multipart/form-data" >
	          		<strong style="font-size:20px;" >当前图片:</strong><br/><br/>
	          		<input type="hidden" value="${session.user.userImg1}" name="userImg" />
	          		<s:if test="">
	          			<img src="${session.user.userImg1}" alt="个人图片" error="this.src='upload/404.jpg'" width="150px" height="150px" />
	          		</s:if>
	          		<s:else>
	          			<img src="upload/people.jpg" alt="个人图片" error="this.src='upload/404.jpg'" width="150px" height="150px" />
	          		</s:else>
	          		<br/><br/>
	          		<input type="file" name="file" style="width:150px" />&nbsp;&nbsp;<font class="msg"></font><br/><br/>
	          		<input class="u_wrzhu" id="submitForm" name="fDo" type="button" value="提 交" />
	          	</form>
	          </div>
	        </div>
	        </s:else>
        </div>
        
       </div>
       
       
       <div id="updateBusiness" style="display:none;">
       		<form action="user_updateEntityByType.action" method="post" id="form1" enctype="multipart/form-data">
                	<input type="hidden" name="commonType" value="business" />
                	<input type="hidden" name="business.businessId" value="" id="businessId"/>
                	<input type="hidden" name="business.businessUserId" value="${session.user.userId}"/>
                	<input type="hidden" name="business.businessStatus" value="" id="businessStatus" />
                	<input type="hidden" name="business.businessType" value="" id="businessType" />
                	<input type="hidden" name="business.businessFocusCount" value="" id="businessFocusCount" />
                	<input type="hidden" name="business.businessImg1" value="" id="businessHidImg1" />
                	<input type="hidden" name="business.businessImg2" value="" id="businessHidImg2" />
                		<table width="100%">
		                <tbody>
		                <tr><td align="right"><span>*</span>主题：</td><td><input type="text" class="s_in01" name="business.businessName" id="businessName" datatype="*" nullmsg="请输入主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                  <tr>
		                  <td align="right"><span>*</span> 熟悉的产品和市场：</td><td><input type="text" class="s_in02" name="business.businessProductMarket" id="businessProductMarket" datatype="*" nullmsg="请输入产品和市场" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 合作方式：</td><td><input type="text" class="s_in02" name="business.businessCooperation" id="businessCooperation" datatype="*" nullmsg="请输入合作方式" sucmsg=" "/><font color="#FF0000" class="msg"></font><br/></td></tr>
		                <tr><td align="right"><span>*</span> 行业：</td><td>
		                    <select class="s_in05" name="business.businessIndustryId" id="businessIndustryId">
		                    <option value="" selected="selected">请选择行业</option>
		                    	<s:iterator value="industryList" >
		                    		<option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
		                    	</s:iterator>
		                    </select><font color="#FF0000" class="msg"></font><br/>
		                </td></tr>
		                
		                <tr>
		                  <td align="right"><span>*</span> 工作部门：</td><td>
		                    <select class="s_in05" name="business.businessDepartmentId" id="businessDepartmentId">
		                    <option value="" selected="selected">请选择部门</option>
		                    	<s:iterator value="departmentList" >
		                    		<option value="<s:property value='departmentId' />"><s:property value='departmentName' /></option>
		                    	</s:iterator>
		                    </select><font color="#FF0000" class="msg"></font>
		                    <br/>
		                </td></tr>
		                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="business.businessConnecter" id="businessConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 电话和手机：</td><td><input type="text" class="s_in02" name="business.businessMobile" id="businessMobile" datatype="m" nullmsg="请输入联系方式" errormsg="请输入正确的联系方式" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="business.businessQq" id="businessQq" datatype="*" nullmsg="请输入qq号码" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 邮箱：</td><td><input type="text" class="s_in01" name="business.businessEmail" id="businessEmail"  datatype="e" nullmsg="请输入邮箱" errormsg="请输入正确的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr>
		                  <td align="right"><span>*</span> 工作中的挑战，成功经验共享：</td><td><textarea class="s_in03" style="width:1000px;height:200px" name="business.businessChallengeExperience" id="businessChallengeExperience" datatype="*" nullmsg="请输入挑战和经验" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font><br/><strong>( 请详细介绍 )</strong></td></tr>
		                  <tr id="businessHobbyTR"><td  align="right"><span>*</span> 业务专长：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="business.businessHobby" id="businessHobby" datatype="*" nullmsg="请输入业务专长" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                  <tr id="businessRequireTR"><td  align="right"><span>*</span> 企业要求：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="business.businessRequire" id="businessRequire" datatype="*" nullmsg="请输入企业要求" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"><span>*</span> 业务能人介绍：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="business.businessDescription" id="businessDescription" datatype="*" nullmsg="请输入业务能人介绍" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="business.businessOther" id="businessOther"></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr class="businessGongYingImg"><td align="right"><span>*</span> 宣传图片上传：</td>
		                	<td>
		                		<input type="file" name="files" id="businessImg1"><font color="#FF0000" class="msg"></font>
		                		<img src="" width="100px" height="100px" id="businessShowImg1"/>
		                	</td>
		                </tr>
		                <tr class="businessGongYingImg"><td align="right"><span>*</span>业务能人图片上传：</td>
		                	<td>
		                		<input type="file" name="files" id="businessImg2" ><font color="#FF0000" class="msg"></font>
		                		<img src="" width="100px" height="100px" id="businessShowImg2"/>
		                	</td>
		                </tr>
		                <tr id="businessXuQiuImg">
		                	<td align="right"><span>*</span> 宣传图片上传：</td>
		                	<td>
		                		<input type="file" name="file" id="businessImg1"><font color="#FF0000" class="msg"></font>
		                		<img src="" width="100px" height="100px" id="businessShowImg1"/>
		                	</td>
		                </tr>
		                <tr><td align="right"></td><td></td></tr>
		                <tr><td align="right"></td><td><input type="submit" class="btn btn-primary" value="确认并提交" /></td></tr>
		                </tbody>
		                </table>
                	</form>
       </div>
       
       <div id="updateTrain" style="display:none;">
       		<form action="user_updateEntityByType.action" method="post" id="form2"  enctype="multipart/form-data">
       				<input type="hidden" name="commonType" value="train" />
                	<input type="hidden" name="train.trainUserId" value="${session.user.userId }" />
                	<input type="hidden" name="train.trainId" id="trainId" />
                	<input type="hidden" name="train.trainStatus" id="trainStatus" />
                	<input type="hidden" name="train.trainType" id="trainType" />
                	<input type="hidden" name="train.trainFocusCount" id="trainFocusCount" />
                	<input type="hidden" name="train.trainFocusCount" id="trainFocusCount" />
                	<input type="hidden" name="train.trainImg1" id="trainHidImg1" />
                	<input type="hidden" name="train.trainImg2" id="trainHidImg2" />
	                <table width="100%">
	                <tbody>
	                <tr><td align="right"><span>*</span> 培训课程主题：</td><td><input type="text" class="s_in01" name="train.trainName" id="trainName" datatype="*" nullmsg="请输入培训课程主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr id="trainPoqieduTR"><td align="right"><span>*</span> 迫切度：</td><td>
								<select name="train.trainPoqiedu" id="trainPoqiedu" >
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
		             <span> 1 - 10 </span>分</td></tr>
	                <tr><td align="right"><span>*</span> 适用的行业：</td><td>
	                <select class="s_in05" name="train.trainIndustryId"  id="trainIndustryId">
	                <option value="0" selected="selected">请选择行业</option>
	                	   <s:iterator value="industryList" >
			                    <option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
			               </s:iterator>
	                </select><font color="#FF0000" class="msg"></font></td></tr>
	                <tr id="trainTeacherTR"><td align="right"><span>*</span>  培训老师推荐：</td><td><input type="text" class="s_in01" name="train.trainTeacher" id="trainTeacher" datatype="*" nullmsg="请输入培训老师名称" sucmsg=" " /><font color="#FF0000" class="msg"></font></td></tr>
	                <tr id="trainPriceTR"><td align="right"><span>*</span> 参考报价：</td><td><input type="text" class="s_in02" name="train.trainPrice" id="trainPrice" datatype="n" nullmsg="请输入参考报价" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 公司名称：</td><td><input type="text" class="s_in01" name="train.trainCompanyName" id="trainCompanyName" datatype="*" nullmsg="请输入公司名称" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="train.trainConnecter" id="trainConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 固定电话：</td><td><input type="text" class="s_in02" name="train.trainPhone" id="trainPhone" datatype="m" nullmsg="请输入固定电话" errormsg="请输入有效的电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 手机：</td><td><input type="text" class="s_in02" name="train.trainMobile" id="trainMobile" datatype="m" nullmsg="请输入固定电话" errormsg="请输入有效的电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="train.trainQq" id="trainQq" datatype="*" nullmsg="请输入qq号码" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 企业邮箱：</td><td><input type="text" class="s_in01" name="train.trainCompanyEmail" id="trainCompanyEmail" datatype="e" nullmsg="请输入企业邮箱" errormsg="请输入有效的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td  align="right"><span>*</span> 用户遇到的问题和挑战：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="train.trainQuestionChallenge" id="trainQuestionChallenge" datatype="*" nullmsg="请输入问题和挑战" sucmsg=" " ></textarea><font color="#FF0000" class="msg"></font></td></tr>
	                <tr id="trainRequireTR"><td align="right"><span>*</span>  对培训的要求：</td><td><textarea class="s_in03" style="width:1000px;height:200px" name="train.trainRequire" id="trainRequire" datatype="s" nullmsg="请输入内容介绍和大纲" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font><br/><strong>（ 把精彩的内容展现一些，引起用户兴趣 ）</strong></td></tr>
	                <tr id="trainContentOutlineTR"><td align="right"><span>*</span>  精彩内容介绍和培训大纲：</td><td><textarea class="s_in03" style="width:1000px;height:200px" name="train.trainContentOutline" id="trainContentOutline" datatype="s" nullmsg="请输入内容介绍和大纲" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font><br/><strong>（ 把精彩的内容展现一些，引起用户兴趣 ）</strong></td></tr>
	                <tr><td  align="right"><span>*</span> 企业介绍：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="train.trainCompnayDes" id="trainCompnayDes" datatype="s" nullmsg="请输入企业介绍" sucmsg=" "></textarea><font color="#FF0000" class="msg"></td></tr>
	                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="train.trainOther" id="trainOther" ></textarea><br/><strong>（ 请说明开课日程，开课城市等情况 ）</strong></td></tr>
	                <tr class="trainGongYingImg"><td align="right"> 宣传图片上传：</td>
	                	<td>
	                		<input type="file" name="files" datatyep="*" nullmsg="请选择宣传图片" sucmsg=" " id="trainImg1"/><font color="#FF0000" class="msg"></font>
	                		<img src="" width="100px" height="100px" id="trainShowImg1"/>
	                	</td>
	                </tr>
	                <tr class="trainGongYingImg"><td align="right"> 培训老师图片上传：</td>
	                	<td>
	                		<input type="file" name="files" datatyep="*" nullmsg="请选择老师图片" sucmsg=" " id="trainImg2"/><font color="#FF0000" class="msg"></font>
	                		<img src="" width="100px" height="100px" id="trainShowImg2"/>
	                	</td>
	                </tr>
	                <tr id="trainXuQiuImg"><td align="right"> 宣传图片上传：</td>
	                	<td>
	                		<input type="file" name="file" datatyep="*" nullmsg="请选择宣传图片" sucmsg=" " id="trainImg1"/><font color="#FF0000" class="msg">123</font>
	                		<img src="" width="100px" height="100px" id="trainShowImg1" />
	                	</td>
	                </tr>
	                <tr><td align="right"></td><td></td></tr>
	                <tr><td align="right"></td><td><input type="submit" class="btn btn-primary" value="确认并提交" /></td></tr>
	                </tbody>
	                </table>
	               </form>
       </div>
       
       <div id="updateVote" style="display:none;">
       		<form action="user_updateEntityByType.action" method="post" id="form3">
                	<input type="hidden" name="commonType" value="vote" />
                	<input type="hidden" name="vote.voteId" id="voteId" />
                	<input type="hidden" name="vote.voteType" id="voteType" />
                	<input type="hidden" name="vote.voteStatus" id="voteStatus" />
                	<input type="hidden" name="vote.voteFocusCount" id="voteFocusCount" />
              		<input type="hidden" name="vote.voteUserId" value=${session.user.userId } />
              		<input type="hidden" name="vote.publishTime" id="publishTime" />
              		<input type="hidden" name="vote.auther" id="auther" />
              		<input type="hidden" name="vote.voteCommentCount" id="voteCommentCount" />
              		<input type="hidden" name="vote.voteViewCount" id="voteViewCount" />
              <table width="100%">
                <tbody>
                <tr><td align="right"><span>*</span> 培训主题：</td><td><input type="text" class="s_in01" name="vote.voteTitle" id="voteTitle" datatype="*" nullmsg="请输入培训主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
                <tr><td align="right"><span>*</span> 行业：</td><td>
                <select class="s_in05" name="vote.voteIndustryId" id="voteIndustryId">
                <option value="0" selected="selected">请选择行业</option>
                	   <s:iterator value="industryList" >
		                    <option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
		               </s:iterator>
                </select><font color="#FF0000" class="msg"></font></td></tr>
                <tr><td align="right"><span>*</span> 公司名称：</td><td><input type="text" class="s_in01" name="vote.voteCompanyName" id="voteCompanyName" datatype="*" nullmsg="请输入公司名称" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="vote.voteConnecter" id="voteConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
                <tr><td align="right"><span>*</span> 电话：</td><td><input type="text" class="s_in02" name="vote.votePhone" id="votePhone" datatype="m" nullmsg="请输入电话" errormsg="请输入有效的电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="vote.voteQq" id="voteQq" datatype="*" nullmsg="请输入qq" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
                <tr><td align="right"><span>*</span> 邮箱：</td><td><input type="text" class="s_in01" name="vote.voteEmail" id="voteEmail" datatype="e" nullmsg="请输入邮箱" errormsg="请输入有效的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
                <tr><td  align="right"><span>*</span> 用户遇到的问题和挑战：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="vote.voteQuestionChallenge" id="voteQuestionChallenge" datatype="*" nullmsg="请输入问题和挑战" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
                <tr id="voteRequireTR"><td align="right"><span>*</span> 对培训的要求：</td><td><textarea class="s_in03" style="width:1000px;height:200px" name="vote.voteRequire" id="voteRequire" datatype="*" nullmsg="请输入要求" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
                <tr id="voteContentOutlineTR"><td align="right"><span>*</span> 培训内容介绍和大纲：</td><td><textarea class="s_in03" style="width:1000px;height:200px" name="vote.voteRequire" id="voteRequire" datatype="*" nullmsg="请输入要求" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" style="width:1000px;height:200px" name="vote.voteOther" id="voteOther"></textarea></td></tr>
                <tr><td align="right"></td><td></td></tr>
                <tr><td align="right"></td><td><input type="submit" class="btn btn-primary" value="确认并提交" /></td></tr>
                </tbody>
                </table>
              </form>
       </div>

		<jsp:include page="base/footer.jsp"></jsp:include>
	</div>
</body>
</html>
