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
<title>注册</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="resource/css/index2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" >
	function checkForm(){
		//每次提交事件触发时，清空所有的错误信息
		$(".error").each(function(){
			$(this).html("");
		});

		var username = $("[name=username]").val();
		var newPassword = $("[name=newPassword]").val();
		var surePassword = $("[name=surePassword]").val();
		if(username == ""){
			$("[name=username]").next("span").html("请输入用户名！");
			return false;
		}
		if(newPassword == ""){
			$("[name=newPassword]").next("span").html("请输入密码！");
			return false;
		}
		if(surePassword == ""){
			$("[name=surePassword]").next("span").html("请输入确认密码！");
			return false;
		}
		if(newPassword != surePassword){
			$("[name=surePassword]").next("span").html("两次输入的密码不一致！");
			return false;
		}
		if($("#username").val() == "没有该用户请确认！"){
			$("[name=username]").next("span").html($("#username").val());
			return false;
		}
		return true;
	}

	$(function(){
		$("[name=username]").blur(function(){
			var username = $("[name=username]").val();
			if(username == ""){
				return;
			}

			$.post("user_isExist.action",{username:username},function(status){
				if(status == "false"){
					$("#username").val("没有该用户请确认！");
				}else{
					$("#username").val("用户确认成功！");
				}
				$("[name=username]").next("span").html($("#username").val());
			});
		});
	});
</script>
<style type="text/css">
	.error{
		font-size: 12px;
		color:red;
	}
</style>
</head>
<body>
	<div class="wrap">
		<!-- 头部 -->
		<jsp:include page="base/top.jsp"></jsp:include>

		<div class="content">
			<div class="quick">
				<a href="index_indexUI.action"><img src="resource/images/home.png" />首页</a> > <span>找回密码</span>
			</div>
			<div class="intent2">
				<div class="denlu" >
					<h3>
						<span>找回密码</span>
					</h3>
					<div class="u_writer">
						<dl>
							<dt>
								<form action="user_findPwd.action" method="post" onsubmit="return checkForm();">
									<p>用&nbsp;户&nbsp;名</p>
									<input type="text" class="u_w1" name="username"/>&nbsp;&nbsp;<span class="error"></span>
									<input type="hidden" value="没有该用户请确认！" id="username" />
									<p>新&nbsp;密&nbsp;码</p>
									<input type="password" class="u_w2" name="newPassword"/>&nbsp;&nbsp;<span class="error"></span>
									<p>确认密码</p>
									<input type="password" class="u_w2" name="surePassword"/>&nbsp;&nbsp;<span class="error"></span>
									<input type="submit" value="提交" class="u_wrsub" />
								</form>
							</dt>
						</dl>
					</div>
				</div>
			</div>

		</div>
		<jsp:include page="base/footer.jsp"></jsp:include>
	</div>
</body>
</html>
