<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="群享培训,keyword2,keyword3">
<meta http-equiv="description" content="群享培训">
<title>群享培训</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="resource/js/focus.js"></script>        
<!--导航steven@erduodidi.com-->
</head>
<body>
	<div class="wrap">
	<jsp:include page="base/top.jsp" ></jsp:include>
        <div class="content">
        	<div class="tent1">
           	 <jsp:include page="base/left.jsp" ></jsp:include>
            <script src="resource/js/jquery.tabs.js"></script>
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
              <div class="in2_tent1_zhong right">
              <div id="slide-box right">
			<!--<b class="corner"></b>-->
				<div id="focus">
				<script type="text/javascript">
					// <![CDATA[
					function bookmark(){
						var title=document.title;
						var url=document.location.href;
						window.external.AddFavorite(url, title);
						if (window.sidebar) {
							window.sidebar.addPanel(title, url,"");
						}else if( window.opera && window.print ){
							var mbm = document.createElement('a');
							mbm.setAttribute('rel','sidebar');
							mbm.setAttribute('href',url);
							mbm.setAttribute('title',title);
							mbm.click();
						}
						else if(document.all){ 
							window.external.AddFavorite( url, title);
						}
					}
					// ]]>
				</script> 
<!-- 				<a href="javascript:bookmark()" _fcksavedurl="javascript:bookmark()">加入收藏夹</a> -->
<!-- 				<a href="javascript:void(0);" onclick="window.external.AddFavorite(document.location.href,document.title);">加入收藏夹</a> -->
                <ul>
                <s:iterator value="logoList" var="logo">
                	  <li><div><a href="#"><img src="${logo.dataContent}" onerror="this.src='resource/images/b1.jpg'" width="775" height="465" /></a></div></li>
                </s:iterator>
              
                </ul>
                </div>
		    <!--<b class="corner"></b>-->
            <div><a href="#"><img src="resource/images/adv.jpg" class="left" /></a><a href="#"><img src="resource/images/adv.jpg" class="right" /></a></div>
		         </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
            <div class="intent2">
             <div class="box demo1">
			<ul class="tab_menu">
				<li class="current"><a href="#">业务能人</a></li>
				<li><a href="#">培训选择</a></li>
				<li><a href="#">培训投票</a></li>
			</ul>
			<div class="tab_box">
				<div>
					<s:iterator value="businessList" var="business">
						 <div class="showbox">
	               			 <a href="business_businessIn.action?businessId=${business.businessId}"><img  src="${business.businessImg1}" width="185px" height="145px"/></a>
	                		<div class="subtitle">
	                			<a href="business_businessIn.action?businessId=${business.businessId}">${business.businessName}</a>
	                		</div>
                		</div>
					</s:iterator>
                </div>
				<div class="hide">
					<s:iterator value="trainList" var="train">
		                <div class="showbox">
			                <a href="trainChoose_trainChooseIn.action?trainId=${train.trainId}"><img  src="${train.trainImg1}" width="185px" height="145px" onerror="this.src='resource/images/inc1.jpg'"/></a>
			                <div class="subtitle">
			                	<a href="trainChoose_trainChooseIn.action?trainId=${train.trainId}">${train.trainName}</a>
			                </div>
		                </div>
	                </s:iterator>
				</div>
                <div class="hide">
                	<s:iterator value="voteList" var="vote">
		                <div class="showbox">
			                <a href="trainVote_trainVoteIn.action?voteId=${voteId}"><img  src="resource/images/inc3.jpg" width="185px" height="145px"/></a>
			                <div class="subtitle">
			                	<a href="trainVote_trainVoteIn.action?voteId=${voteId}">${vote.voteTitle}</a>
			                </div>
		                </div>
	                </s:iterator>
				</div>
			</div>
          <div class="clear"></div>
            </div>
        </div>
        <div class="" style="height:45px;"></div>
		<jsp:include page="base/footer.jsp" ></jsp:include>
      </div>
    </div>
<script type="text/javascript">
$(".showbox").each(function(){
var self = $(this), delay;
self.mouseover(function(){
	delay = setTimeout(function(){ delay = null; self.find(".subtitle").stop().animate({"bottom":0}, 300);},300);
}).mouseout(function(){
	if(delay){
		clearTimeout(delay);
	}else{
		setTimeout(function(){self.find(".subtitle").stop().animate({"bottom":-150}, 300);},300);
	}
});
});
</script>
</body>
</html>
