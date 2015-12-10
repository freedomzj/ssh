<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'top.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
     <div class="top_wrap">
        	<div class="top1">
              <div class="dz01 right">
              		<s:if test="#session.user == null">
              			<a href="user_loginUI.action">请登录</a><a href="user_registerUI.action">请注册</a>
              		</s:if>
              		<s:else>
              			您好 <strong>${session.user.username }</strong>, 欢迎您回来！ <a href="user_userUI.action?manageType=updateInfo">用户中心</a> | <a href="user_toUpdatePwd.action?manageType=updatePwd">密码修改</a> | <a href="user_loginOut.action">退出</a>
              		</s:else>
              </div>
            </div>
        	   <div class="top2">
            	<div class="logo left"><a href="index_indexUI.action"><img src="resource/images/logo.jpg" width="217" height="134"/></a></div>
                <div class="top2_zhong left">
                  <!--搜索开始--> 
                  <script type="text/javascript">
					$(function(){ 
					
							$("#searchSelectedB").click(function(){ 
							$("#searchTabB").show();
							$(this).addClass("searchOpenB");
						}); 
					
						$("#searchTabB li").hover(function(){
							$(this).addClass("selectedB");
						},function(){
							$(this).removeClass("selectedB");
						});
						 
						$("#searchTabB li").click(function(){
							$("#searchType").val($(this).attr("id"));
							$("#searchSelectedB").html($(this).html());
							$("#searchTabB").hide();
							$("#searchSelectedB").removeClass("searchOpenB");
						});
						
					});

					function checkTopForm(){
						if($("#keyword").val() == ""){
							alert("请输入查询关键字！");
							return false;
						}
						return true;
					}
					</script>
                  <!--搜索结束-->
                  <div class="sou left">
                    <div id="searchTxtB" class="searchTxtB" onMouseOver="this.className='searchTxtB searchTxtHoverB';" onMouseOut="this.className='searchTxtB';">
                     <div class="searchMenuB">
			              <div class="searchSelectedB" id="searchSelectedB">全部</div>
			              <div style="display:none;" class="searchTabB" id="searchTabB">
			                <ul>
			                  <li id="business">业务能人</li>
			                  <li id="train">培训选择</li>
			                  <li id="vote">培训投票</li>
			                </ul>
			              </div>
            		</div>
            </div>
             <form action="index_searchUI.action" method="post" submit="return checkTopForm();" >
             	<input type="text" class="names" value="${keyword}" id="keyword" name="keyword"/>
             	<input type="hidden" value="" id="searchType" name="searchType" />
             	<input type="button" class="nbt" value="搜 索" onclick="checkTopForm();"/>
             </form>
                  </div>
                    <div class="clear"></div>
                    
                </div>
                <div class="top_fabu right"><a class="fabu" href="index_releaseUI.action">免费发布信息</a></div>
                <div class="clear"></div>
        	</div>
            <div class="top3">
            	<div class="top3_left left">
                    <div class='allsort'>
                       <div class='mt'><strong><a href="index_indexUI.action">业 务 门 类</a></strong></div>
                  </div><!--allsort end-->
                </div>
                <div class="top3_zhong left">
                 <div class="top3_nav">
                    <ul>
                    <li><a href="business_businessList.action">业务能人</a></li>
                    <li><a href="trainChoose_trainChoose.action">培训选择</a></li>
                    <li><a href="trainVote_trainVote.action">培训投票</a></li>
                    <li><a href="question_questionUI.action">业务联系</a></li>
                    </ul>
					<div class="clear"></div>
                    </div> 
                </div>
        	</div>
        </div>
  </body>
</html>
