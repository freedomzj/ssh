<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>群享培训-业务能人-详情</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="resource/css/index2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>   
<script type="text/javascript">
ratingClick=function(businessId){
	var rating=$("#rating").val();
	var ratingDes=$("#ratingDes").val();
	if(rating==null||rating==""){
		alert("好评度不能为空");
	}
	else if(isNaN(rating)){
		alert("请填写一个1~10的整数");
	}
	else if(rating<1||rating>10){
		alert("请填写一个1~10的整数");
	}
	else if(ratingDes.length<10||ratingDes.length>300){
		alert("提交内容请控制在10~300个字符之间");
	}else{
		
		$.post("business_ajaxBusinessComment.action",{businessId:businessId,ratingDes:ratingDes,rating:rating},function(data){
			alert("点评成功");
			$("#LoginBox").css("display","none");
			$("#mask").css("display","none")
			//清空对话框
			$("#rating").val("");
			$("#ratingDes").val("");
		});
	}
}

<%--加载回复框--%>
clickReply=function(commentId,index){
	$("#reply").css("display","block");
	$("#commentId").val(commentId);
	$("#replyContent").val("回复"+index+"楼:");
	 scroll(0,document.body.scrollHeight);
}

<%--提交回复--%>
submitReply=function(){
	var commentId=$("#commentId").val();
	var replyContent=$("#replyContent").val();
	replyContent = replyContent.replace(/script|type|text|javascript|alert/g, "");
	if(replyContent.length<300&&replyContent.length>10){
		$.post("business_ajaxTrainReply.action",{commentId:commentId,content:replyContent},function(data){
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

$(function(){
	
	var industryId=$("#businessIndustry").text();
	//通过部门id查找部门
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
</script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="base/top.jsp" ></jsp:include>        
		<div class="content">
	<jsp:include page="base/leftmore.jsp" ></jsp:include>
        <div class="cont_right">
        <div class="quick"><a href="index_indexUI.action"><img src="resource/images/home.png" />首页</a> > <a href="#">
         <s:if test="business.businessType==1">
         	 业务能人
         </s:if>
         <s:else>
         	企业需求
         </s:else>
        </a> > <span></span></div>
        	<div class="in_tentA">
            <div class="in_tentAleft left"><img src="${business.businessImg2}" width="260" height="205"/></div>
            <div class="in_tentAright right">
           <img src="${business.businessImg1}" class="desiger" />
            <h2>主题</h2>
            <script type="text/javascript">
			$(function () {
				$('.pic2').each(function () {
					var distance = 10;
					var time = 250;
					var hideDelay = 500;
			
					var hideDelayTimer = null;
			
					var beingShown = false;
					var shown = false;
					var trigger = $('.trigger', this);
					var info = $('.popup', this).css('opacity', 0);
			
			
					$([trigger.get(0), info.get(0)]).mouseover(function () {
						if (hideDelayTimer) clearTimeout(hideDelayTimer);
						if (beingShown || shown) {
							// don't trigger the animation again
							return;
						} else {
							// reset position of info box
							beingShown = true;
			
							info.css({
								top: 35,
								left: 80,
								display: 'block'
							}).animate({
								top: '-=' + distance + 'px',
								opacity: 1
							}, time, 'swing', function() {
								beingShown = false;
								shown = true;
							});
						}
			
						return false;
					}).mouseout(function () {
						if (hideDelayTimer) clearTimeout(hideDelayTimer);
						hideDelayTimer = setTimeout(function () {
							hideDelayTimer = null;
							info.animate({
								top: '-=' + distance + 'px',
								opacity: 0
							}, time, 'swing', function () {
								shown = false;
								info.css('display', 'none');
							});
			
						}, hideDelay);
			
						return false;
					});
				});
			});
			joinStore=function(){
				if($.browser.msie) {
					window.external.AddFavorite(document.location.href,document.title);
					} else{
						alert("你的浏览器非ie内核请使用ctrl+d收藏");
					}
			}
				
</script>
            <div class="ggdes">
            <p>联系人：${business.businessConnecter }</p>
            <p>电话: ${business.businessMobile}</p>
            <p><span>邮箱：<b>${business.businessEmail} </b></span></p>
           </div>
            <div class="dpin">
               <s:if test="business.businessType==1">
                  <a id="example" class="dpbt left">我要点评</a>
               </s:if>
            <a href="javascript:void(0)" onclick="joinStore()" class="setadd">加入收藏</a>
            <a href="mailto:${business.businessEmail}" class="dshare"><img src="resource/images/share.png" />点击邮件联系</a> 
            <a href="http://wpa.qq.com/msgrd?v=3&uin=${business.businessQq}&site=qq&menu=yes" class="dshare"><img src="resource/images/qq.png" />点击QQ联系</a></div>
            </div>
            <div class="clear"></div> 
             <div class="m_line"></div>
<%--             <a href="##" class="look_more">查看更多内容</a>--%>
             </div>
           <div id="LoginBox">
					<div class="row1">
						<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
							id="closeBtn">×</a>
					</div>
					<div class="row">
						<p align="center" > 点评栏</p>
						<table>
							<tbody>
								<tr>
									<td width="23%" align="right"><span>*</span>好评度</td>
									<td><input type="text" class="row_bt2" id="rating" />&nbsp;<span style="color: #F60;">1 - 10</span> 分</td>
<%--									--%>
								</tr>
								<tr>
									<td align="right"><span>*</span>点评文字描述</td>
									<td>	
					          		  <textarea name="content" style="color: #666;" cols="40" rows="5" id="ratingDes"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center"><strong style="font-size: 12;color:#666 ">(请根据业务能人在服务过程中的服务水平打分)</strong></td>
								</tr>
								<tr>
									<td align="center"  colspan="2"><input type="button" class="s_in03" value="确认并提交"   onclick="ratingClick(<s:property value="business.businessId"/>)"/>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				
				</div>
            <div class="clear"></div>
            <div class="intent2">
             <script src="resource/js/jquery.tabsn.js"></script>
			<script src="resource/js/jquery.lazyload.js"></script>
            <script type="text/javascript">
                        $(function(){
                            $("img[original]").lazyload({ placeholder:"resource/images/color3.gif" });
                            $('.demo1').Tabs();
                            $('.demo2').Tabs({
                                event:'click'
                            });
                            $('.demo3').Tabs({
                                timeout:300
                            });
                            $('.demo4').Tabs({
                                auto:3000
                            });
                            $('.demo5').Tabs({
                                event:'click',
                                callback:lazyloadForPart
                            });
                            //部分区域图片延迟加载
                            function lazyloadForPart(container) {
                                container.find('img').each(function () {
                                    var original = $(this).attr("original");
                                    if (original) {
                                        $(this).attr('src', original).removeAttr('original');
                                    }
                                });
                            }
                        });	
                        </script> 
                        <div class="clear"></div>
                      <div class="" style="height:15px;"></div>
             <div class="p_box demo5">
             <!--<ul class="p_tab_menu" id="p_tab_menu">-->
			<ul class="p_tab_menu" id="p_tab_menu">
				<li class="current"><a href="javascript:void(0)">详情介绍</a></li>
				<s:if test="business.businessType==1">
				<li><a href="javascript:void(0)">查看点评</a></li>
				</s:if>
				<s:if test="business.businessType==1">
				<li><a href="javascript:void(0)">业务能人介绍</a></li> 
				</s:if>
				<s:else>
				<li><a href="javascript:void(0)">企业介绍</a></li> 
				</s:else>
				
			</ul>
			<div class="p_tab_box">
				<div>
                <div class="cpdex">
               <h2>工作中的挑战，成功经验共享</h2>
                 <p>${business.businessChallengeExperience}</p>
                 <s:if test="business.businessType==1">
                 <h2>业务专长</h2>
                 <p>${business.businessHobby}</p>
                 </s:if>
                 <s:else>
                   <h2>企业要求</h2>
                   <p>${business.businessRequire}</p>
                 </s:else>
                <h2>熟悉的产品和市场</h2>
                <p>${business.businessProductMarket}</p>
<%--                  <p><span>99 </span>元</p>	--%>
                  <h2>合作方式 </h2>
                  <p>线上</p>	
                  <h2>行业</h2>
                  <p id="businessIndustry">${business.businessIndustryId}</p>	
                   <h2>工作部门</h2>
                  <p>${business.businessDepartmentId}</p>
                  <h2>其他 </h2>
                  <p>${business.businessOther}</p>
                </div>
                <div class="" style="height:30px;"></div>
                </div>
                <div class="hide">
                <div class="cpdp">
                  <s:if test="business.businessType==1">
                <ul>
               	 <s:if test="businessRatingList.size()>0">
	                <s:iterator value="businessRatingList" var="commentTrain"   status="count">
	                 <li class="user_dp">
	                <a class="user_pic" href="javascript:void(0)"><img src="${commentTrain.userImg}" /></a>
	                <p class="user-info"><a class="user_n" href="javascript:void(0)"><s:property  value="#count.index+1"/>楼:${commentTrain.userName}</a></p>
	                 <div class="udescrible">
	                 <p class="chxin">好评度：<span>${commentTrain.rating }</span> 分</p>
	                 <p class="dpdes">${commentTrain.content}</p>
	                 <span class="dpdate">发表于:<s:date name="#commentTrain.time" format="yyyy-MM-dd HH:mm"/></span><a class="dpresp" href="javascript:void()" onclick="clickReply(<s:property value="#commentTrain.commentId"/>,<s:property  value="#count.index+1"/>)">回应</a>
	                </div>
	                <input type="hidden" class="commentHidden" value="${commentTrain.commentId}"/>
	                </li>
	                </s:iterator>
	                
                </s:if>
                <s:else>
                	<p align="center">没有沙发赶紧去抢吧！</p>
                </s:else>
                 <%--	 回复框--%>
		                  <div class="comment" id="reply" style="display:none;">
			             <input type="hidden" id="commentId"  value="${comment.commentId}"/>
				             <div class="l_t"><img src="resource/images/l_t.jpg" /></div>
				             <div class="l_my"><textarea name="content" id="replyContent"></textarea></div>
				             <div class="l_b"><img src="resource/images/l_b.jpg" /></div>
				             <div class="right"><input type="button" onclick="submitReply()" class="com_tj"  value="提交回复" /></div>
	           			  </div>
               </ul>
               </s:if>
                </div>
                </div>
                <div class="hide">${business.businessDescription}</div>
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
    </div>

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
		//文本框不允许为空---按钮触发
		$("#loginbtn").on('click', function () {
			var txtName = $("#txtName").val();
			var txtPwd = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$(".warning").css({ display: 'block' });
				}
				else {
					$("#warn").css({ display: 'block' });
					$("#warn2").css({ display: 'none' });
				}
			}
			else {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$("#warn").css({ display: 'none' });
					$(".warn2").css({ display: 'block' });
				}
				else {
					$(".warning").css({ display: 'none' });
				}
			}
		});
		//文本框不允许为空---单个文本触发
		$("#txtName").on('blur', function () {
			var txtName = $("#txtName").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn").css({ display: 'block' });
			}
			else {
				$("#warn").css({ display: 'none' });
			}
		});
		$("#txtName").on('focus', function () {
			$("#warn").css({ display: 'none' });
		});
		//
		$("#txtPwd").on('blur', function () {
			var txtName = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn2").css({ display: 'block' });
			}
			else {
				$("#warn2").css({ display: 'none' });
			}
		});
		$("#txtPwd").on('focus', function () {
			$("#warn2").css({ display: 'none' });
		});
		//关闭
		$(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
			$("#LoginBox").fadeOut("fast");
			$("#mask").css({ display: 'none' });
		});
	});
	</script>
</body>
</html>
