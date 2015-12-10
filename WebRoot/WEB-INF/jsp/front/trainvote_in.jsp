<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>群享培训-投票-详情</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="resource/css/index2.css" rel="stylesheet" type="text/css" />
<!--<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>-->
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>   
 <script src="resource/js/jquery.tabsn.js"></script>
<script src="resource/js/jquery.lazyload.js"></script>
<script type="text/javascript">
	$(function ($) {
		//弹出登录
		$("#example").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '1'
			}, 1000);
		}).on('click', function () {
			$("body").append("<div id='mask'></div>");
			$("#mask").addClass("mask").fadeIn("slow");
			$("#LoginBox").fadeIn("slow");
		});
		//
		//按钮的透明度
		$("#loginbtn").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '1'
			}, 1000);
		});
		//关闭
		$(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
			$("#LoginBox").fadeOut("fast");
			$("#mask").css({ display: 'none' });
		});
	});
	</script>
	<script type="text/javascript">
	
	//通过部门id查找部门
	$(function(){
		var industryId=$("#businessIndustry").text();
		//按行业查找部门
		$.ajax({
			url:"business_ajaxindustyById.action",
			data:{industryId:industryId},
			dataType:"text",
			success:function(data){
				$("#businessIndustry").text(data);	
			}
		});
		//加载评论的回复
		$(".commentHidden").each(function(){
			var coomentClass=$(this);
			$.getJSON("trainVote_ajaxLodeRepy.action",{commentId:$(this).val()},function(replyList){
					for ( var count = 0; count < replyList.length; count++) {
						coomentClass.parent().append("<div>"+replyList[count].replyUserName+"&nbsp;&nbsp;"+replyList[count].replyContent+"<span style='float: right;'>"+replyList[count].replyTime+"</span></div><br/>")
							
					}
			});
		});
	});
	
	
	focusCount=function(id){
		$.ajax({
			url:"trainVote_ajaxUpdateFocusCount.action",
			data:{voteId:id},
			dataType:"text",
			success:function(data){
				if(data != "fail"){
					alert("点赞成功");
					$("#"+id).html("("+data+")");
				}else{
					alert("您已点赞！");
				}
			}
		});
		
	}
	submitComment=function(){
		var str=$("#commentContent").val();
		str = str.replace(/script|type|text|javascript|alert/g, "");
		var voteId=$("#commentVoteId").val();
		if(str.length<300&&str.length>10){
			$.post("trainVote_AjaxVoteComment.action",{voteId:voteId,content:str},function(data){
				alert("评论成功");
				location.reload(true);
			});
		}else{
			alert("内容请控制在10~300个字之间");
		}
	}
	clickReply=function(commentId,index){
		$("#reply").css("display","block");
		$("#commentId").val(commentId);
		$("#replyContent").val("回复"+index+"楼:");
		 scroll(0,document.body.scrollHeight);
	}
	
	submitReply=function(){
		var commentId=$("#commentId").val();
		var replyContent=$("#replyContent").val();
		replyContent = replyContent.replace(/script|type|text|javascript|alert/g, "");
		if(replyContent.length<300&&replyContent.length>10){
			$.post("trainVote_ajaxVoteReply.action",{commentId:commentId,content:replyContent},function(data){
				if(data){
					alert("回复成功");
					location.reload(true);
				}else{
					alert("回复失败");
				}
			});
		}else{
			alert("内容请控制在10~300给个字之间");
		}
		
	}
	
	
	joinStore=function(){
		if($.browser.msie) {
			window.external.AddFavorite(document.location.href,document.title);
			} else{
				alert("你的浏览器非ie内核请使用ctrl+d收藏");
			}
	}
</script>
</head>
<body>
	<div class="wrap">
  	<jsp:include page="base/top.jsp" ></jsp:include>
        <div class="content">
       	<jsp:include page="base/leftmore.jsp" ></jsp:include>
        <div class="cont_right">
        <div class="quick"><a href="index_indexUI.action"><img src="resource/images/home.png" />首页</a> > <span>培训投票--详情</span></div>
        	<div class="in_tentA">
             <div class="m_line">
              <h3>${vote.voteTitle}</h3>
              <a href="javascript:void(0)" onclick="joinStore()" class="setadd right">加入收藏</a>
              <s:if test="vote.voteType==2">
              	 <a id="example" class="Join" href="javascript:void(0)">欢迎报名参加培训</a>
              </s:if>
              <div id="LoginBox">
              <div class="row1"><a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a>
               </div>
              <div class="row">
              <table>
              <tbody>
              <tr><td width="23%" align="right"><span>*</span>企业名称：</td><td><input type="text" class="row_bt1" /></td></tr>
              <tr><td align="right"><span>*</span>联系人：</td><td><input type="text" class="row_bt2" /></td></tr>
              <tr><td align="right">部门：</td><td><input type="text" class="row_bt2" /></td></tr>
              <tr><td align="right"><span>*</span>固定电话：</td><td><input type="text" class="row_bt2" /></td></tr>
              <tr><td align="right"><span>*</span>手机：</td><td><input type="text" class="row_bt2" /></td></tr>
              <tr><td align="right"><span>*</span>邮箱：</td><td><input type="text" class="row_bt1" /></td></tr>
              <tr><td></td><td><input type="submit" class="s_in03" value="确认并提交" /><!--<a href="dianpin.html"></a>--></td></tr>
              </tbody>
              </table>
            </div>
            </div>
           
              <p class="come"><span> <s:date name="vote.publishTime" format="yyyy-MM-dd" /></span>    
              <span>作者:  <em>${vote.auther}</em></span>    
              <span>分类: <span id="businessIndustry">${vote.voteIndustryId}</span></span>
              <a href="javascript:void(0)" style="background: url(../images/icons_01.png) no-repeat 0px 2px;width:30px;height:30px;" onclick="focusCount(<s:property value="vote.voteId" />)" id="${vote.voteId}">(${vote.voteFocusCount})</a>请投票点赞
              </p>
              </div>
              <div class="us_questin">
               <h6>用户遇到的问题和挑战：</h6>
                 <p>${vote.voteQuestionChallenge}</p>
                  <s:if test="vote.voteType==2">
                 <h6>培训内容介绍和大纲:</h6>
                 </s:if>
                 <s:else>
                  <h6>对培训的要求：</h6>
                 </s:else>
               <p>${vote.voteContentOutline}</p>
<%--               <h6>行业：</h6>--%>
<%--               <p></p>--%>
               <h6>其他：</h6>
                <p>${vote.voteOther}</p>
                <div class="xx">
                   <s:if test="vote.voteType==2">
                   <p class="half"> <strong>公司名称：</strong>${vote.voteCompanyName}</p>
                    <p class="half"> <strong>手机：</strong>${vote.voteMobile}</p>
                     <p class="half"> <strong>邮箱：</strong>${vote.voteEmail}</p>
                 </s:if>
               <p class="half"> <strong>联系人：</strong>韩月</p>
               <p class="half"> <strong>联系电话：</strong>${vote.votePhone}</p>
              
               </div>
               <div class="bot_des"><a href="javascript:void(0)">阅读(${vote.voteViewCount})</a>
               <a href="javascript:void(0)">回复(${commentCount})</a> 
               <!-- JiaThis Button BEGIN -->
								<span style="float: right;">
									<div class="jiathis_style">
										<span class="jiathis_txt">分享到：</span>
										<a class="jiathis_button_qzone">QQ空间</a>
										<a class="jiathis_button_tqq">腾讯微博</a>
										<a class="jiathis_button_weixin">微信</a>
									</div>
									<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
									<!-- JiaThis Button END -->
<%--                <a href="javascript:void(0)">分享到：<img src="resource/images/share.jpg" /></a>--%>
                </div>
              </div>
              <div class="more_new">
              	<dl>
                	<dt>
                	
                	<s:if test="voteLast==null">
                			<a class="left" href="javascript:void(0)"><span>上一篇：</span>没有了！！！</a>
                	</s:if>
                	<s:else>
                		<a class="left" href="trainVote_trainVoteIn.action?voteId=${voteLast.voteId}"><span>上一篇：</span>${voteLast.voteTitle}</a>
                	</s:else>
                	
                	<s:if test="voteNext==null">
                		<a class="left" href="javascript:void(0)"><span>下一篇：</span>没有了！！！</a>
                	</s:if>
                	<s:else>
                		<a class="left" href="trainVote_trainVoteIn.action?voteId=${voteNext.voteId}"><span>下一篇：</span>${voteNext.voteTitle}</a>
                	</s:else>
                	</dt>
                    <dd>
                    	<a href="javascript:void(0)" class="good" onclick="focusCount(<s:property value="vote.voteId" />)" id="${vote.voteId}">(${vote.voteFocusCount})</a>请投票点赞
                    </dd>
                </dl>
              </div>
              <div class="clear"></div>
             <div class="comment">
	             <input type="hidden" id="commentVoteId"  value="${vote.voteId}"/>
		             <div class="l_t"><img src="resource/images/l_t.jpg" /></div>
		             <div class="l_my"><textarea name="content" id="commentContent"></textarea></div>
		             <div class="l_b"><img src="resource/images/l_b.jpg" /></div>
		             <div class="right"><input type="button" onclick="submitComment()" class="com_tj"  value="提交建议" /></div>
             </div>
             </div>
            <div class="clear"></div>
            <div class="intent2">
                        <div class="clear"></div>
                      <div class="" style="height:15px;"></div>
             <div class="p_box demo5">
             <!--<ul class="p_tab_menu" id="p_tab_menu">-->
			<ul class="p_tab_menu" id="p_tab_menu">
				<li class="current"><a href="javascript:void(0)">查看建议</a></li>
			</ul>
			<div class="p_tab_box">
                <div>
                <div class="cpdp">
                
                <ul>
                <s:if test="commentList.size()>0">
	                <s:iterator value="commentList" var="comment"   status="count">
	                 <li class="user_dp">
	                <a class="user_pic" href="javascript:void(0)"><img src="${comment.userImg}" /></a>
	                <p class="user-info"><a class="user_n" href="javascript:void(0)"><s:property  value="#count.index+1"/>楼:${comment.userName}</a></p>
	                 <div class="udescrible">
	<%--                 <p class="chxin">诚信度：<span>5</span> 分</p>--%>
	                 <p class="dpdes">${comment.content}</p>
	                 <span class="dpdate">发表于:<s:date name="#comment.time" format="yyyy-MM-dd HH:mm"/></span><a class="dpresp" href="javascript:void()" onclick="clickReply(<s:property value="#comment.commentId"/>,<s:property  value="#count.index+1"/>)">回应</a>
	                </div>
	                <input type="hidden" class="commentHidden" value="${comment.commentId}"/>
	                </li>
	                </s:iterator>
	                
                </s:if>
                <s:else>
                	<p align="center">没有沙发赶紧去抢吧！</p>
                </s:else>
                		<%-- 回复框--%>
		                  <div class="comment" id="reply" style="display:none;">
			             <input type="hidden" id="commentId"  value="${comment.commentId}"/>
				             <div class="l_t"><img src="resource/images/l_t.jpg" /></div>
				             <div class="l_my"><textarea name="content" id="replyContent"></textarea></div>
				             <div class="l_b"><img src="resource/images/l_b.jpg" /></div>
				             <div class="right"><input type="button" onclick="submitReply()" class="com_tj"  value="提交回复" /></div>
	           			  </div>
               </ul>
                </div>
                </div>
			</div>
		  </div>            
          <div class="clear"></div>
            </div>
           </div>
        </div>
        <div class="clear"></div>
        <div class="" style="height:45px;"></div>
		<jsp:include page="base/footer.jsp" ></jsp:include>
    </div>
</body>
</html>

