<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="resource/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="resource/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="resource/assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="header">

		<div class="dl-title">
			<!--<img src="/chinapost/Public/assets/img/top.png">-->
		</div>
		<!-- 管理员注册和登录 -->
		<!--     <div class="dl-log"> -->
		<!--     	欢迎您，<span class="dl-log-user">root</span> -->
		<!--     	<a href="/chinapost/index.php?m=Public&a=logout" title="退出系统" class="dl-log-quit">[退出]</a> -->
		<!--      </div> -->
	</div>
	<div class="content">
		<div class="dl-main-nav">
			<div class="dl-inform">
				<div class="dl-inform-title">
					<s class="dl-inform-icon dl-up"></s>
				</div>
			</div>
			<ul id="J_Nav" class="nav-list ks-clear">
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-home">快捷操作</div></li>
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-order">会员中心</div></li>
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-order">业务能人中心</div></li>
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-order">培训机构中心</div></li>
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-order">投票中心</div></li>
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-order">公司中心</div></li>
			</ul>
		</div>
		<ul id="J_NavContent" class="dl-tab-conten">

		</ul>
	</div>
	<script type="text/javascript" src="resource/assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="resource/assets/js/bui-min.js"></script>
	<script type="text/javascript" src="resource/assets/js/common/main-min.js"></script>
	<script type="text/javascript" src="resource/assets/js/config-min.js"></script>
	<script>
		BUI.use('common/main', function() {
			var config = [ {
				id : '1',
				homePage : '1',
				menu : [ {
					text : '会员中心',
					items : [ {
						id : '1',
						text : '会员列表',
						href : 'admin_userUI.action'
					} ]
				}, {
					text : '业务能人中心',
					items : [ {
						id : '2',
						text : '业务能人列表',
						href : 'admin_businessUI.action'
					} ]
				} , {
					text : '培训机构中心',
					items : [ {
						id : '3',
						text : '培训机构列表',
						href : 'admin_trainUI.action'
					} ]
				}, {
					text : '投票中心',
					items : [ {
						id : '4',
						text : '投票列表',
						href : 'admin_voteUI.action'
					} ]
				}, {
					text : '公司中心',
					items : [ {
						id : '5',
						text : '问答列表',
						href : 'admin_questionUI.action'
					},{
						id : '6',
						text : '评论列表',
						href : 'admin_commentUI.action'
					},{
						id : '7',
						text : '类别列表',
						href : 'admin_categoryUI.action'
					},{
						id : '8',
						text : '滚动图修改',
						href : 'admin_manageLogoUI.action'
					}]
				}]
			},
			{
				id : '2',
				homePage : '1',
				menu : [ {
					text : '会员中心',
					items : [ {
						id : '1',
						text : '会员列表',
						href : 'admin_userUI.action'
					} ]
			}]},
			{
				id : '3',
				homePage : '2',
				menu : [ {
					text : '业务能人中心',
					items : [ {
						id : '2',
						text : '业务能人列表',
						href : 'admin_businessUI.action'
					} ]
			}]},
			{
				id : '4',
				homePage : '3',
				menu : [ {
					text : '培训机构中心',
					items : [ {
						id : '3',
						text : '培训机构列表',
						href : 'admin_trainUI.action'
					} ]
			}]},
			{
				id : '5',
				homePage : '4',
				menu : [ {
					text : '投票中心',
					items : [ {
						id : '4',
						text : '投票列表',
						href : 'admin_voteUI.action'
					} ]
			}]},
			{
				id : '6',
				homePage : '5',
				menu : [ {
					text : '公司中心',
					items : [ {
						id : '5',
						text : '问答列表',
						href : 'admin_questionUI.action'
					},{
						id : '6',
						text : '评论列表',
						href : 'admin_commentUI.action'
					},{
						id : '7',
						text : '类别列表',
						href : 'admin_categoryUI.action'
					},{
						id : '8',
						text : '滚动图修改',
						href : 'admin_manageLogoUI.action'
					} ]
			}]}
			];
			
			new PageUtil.MainPage({
				modulesConfig : config
			});
		});
	</script>
</body>
</html>
