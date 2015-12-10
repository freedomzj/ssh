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
		var password = $("[name=password]").val();
		var surepwd = $("[name=surepwd]").val();
		if(username == ""){
			$("[name=username]").next("span").html("请输入用户名！");
			return false;
		}
		if(password == ""){
			$("[name=password]").next("span").html("请输入密码！");
			return false;
		}
		if(surepwd == ""){
			$("[name=surepwd]").next("span").html("请输入确认密码！");
			return false;
		}
		if(username.length < 6){
			$("[name=username]").next("span").html("用户名长度不到6位");
			return false;
		}
		if(password != surepwd){
			$("[name=surepwd]").next("span").html("两次输入的密码不一致！");
			return false;
		}
		if($("[name=service]").attr("checked") != true){
			$("[name=service]").nextAll("span").html("请同意服务条款！");
			return false;
		}
		if($("#username").val() == "该用户已经被使用"){
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
					$("#username").val("该用户名可以使用");
				}else{
					$("#username").val("该用户已经被使用");
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
				<a href="index.html"><img src="resource/images/home.png" />首页</a> > <span>登录</span>
			</div>
			<div class="intent2">
				<div class="denlu">
					<h3>
						<span>立即注册</span>
					</h3>
					<div class="u_writer">
						<dl>
							<dt>
								<form action="user_addUser.action" method="post" onsubmit="return checkForm();">
									<p>用户名</p>
									<input type="text" class="u_w1" name="username"/>&nbsp;&nbsp;<span class="error"></span>
									<input type="hidden" value="该用户已经被使用" id="username" />
									<p>输入密码</p>
									<input type="password" class="u_w2" name="password"/>&nbsp;&nbsp;<span class="error"></span>
									<p>确认密码</p>
									<input type="password" class="u_w2" name="surepwd"/>&nbsp;&nbsp;<span class="error"></span>
									<p>
										<input type="checkbox" checked="checked" name="service" id="service"/> <label for="service">同意条款</label> &nbsp;&nbsp;&nbsp;&nbsp; 
										<a  href="user_serviceUI.action">群享培训服务条款</a>
										&nbsp;&nbsp;<span class="error"></span>
									</p>
									<p class="error">
										<s:property value="info" />
									</p>
									<input type="submit" value="请提交" class="u_wrsub" />
								</form>
							</dt>
							<dd>
								若已注册，请 <input type="button" value="登录" class="u_wrzhu"
									onclick="javascript:location.href='user_loginUI.action'" />
							</dd>
						</dl>
						<div class="" style="height:50px;"></div>


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
