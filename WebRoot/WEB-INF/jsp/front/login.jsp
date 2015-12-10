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
<title>登录</title>
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
		var password = $("[name=password]").val();
		if(username == ""){
			$("[name=username]").next("span").html("请输入用户名！");
			return false;
		}
		if(password == ""){
			$("[name=password]").next("span").html("请输入密码！");
			return false;
		}
		return true;
	}
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
				<a href="index_indexUI.action"><img
					src="resource/images/home.png" />首页</a> > <span>登录</span>
			</div>
			<div class="intent2">
				<div class="denlu">
					<h3>
						<span>立即登录</span>
					</h3>
					<div class="u_writer">
						<dl>
							<dt>
								<form action="user_checkLogin.action" method="post" onsubmit="return checkForm();" >
									<p>用户名</p>
									<input type="text" class="u_w1" name="username" />&nbsp;&nbsp;<span class="error"></span>
									<p>密码</p>
									<input type="password" class="u_w2" name="password" />&nbsp;&nbsp;<span class="error"></span>
									<p>
										<a href="user_toforgetPwdUI.action">忘记密码？</a>
									</p>
									<p class="error" align="center">
										<s:property value="info" />
									</p>
									<input type="submit" value="立即登录" class="u_wrsub" />
								</form>
							</dt>
							<dd>
								还没有注册，请 <input type="button" value="注册" class="u_wrzhu" onclick="javascript:location.href='user_registerUI.action'" />
							</dd>
						</dl>
						<div class="" style="height:30px;"></div>
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
