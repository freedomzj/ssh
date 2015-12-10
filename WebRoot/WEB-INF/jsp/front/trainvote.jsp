<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="mytags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投票-总</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="resource/css/index2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
focusCount=function(id){
	$.post("trainVote_ajaxUpdateFocusCount.action?voteId="+id,function(data){
		if(data != "fail"){
			alert("点赞成功");
			$("#"+id).html("("+data+")");
		}else{
			alert("您已点赞！");
		}
	});
	
}
</script>
</head>
<body>
<div class="wrap">
	<jsp:include page="base/top.jsp" ></jsp:include>
  <div class="content">
   	<jsp:include page="base/leftmore.jsp" ></jsp:include>
    <div class="cont_right">
      <div class="quick"><a href="index.html"><img src="resource/images/home.png" />首页</a> > <span>培训投票</span></div>
      <div class="padd_backg bd1">
        <div class="pad1">
          <h2 class="guli">
            <dl>
              <dt>这里的课程你喜欢吗？喜欢就赞一个吧！</dt>
              <dd></dd>
            </dl>
          </h2>
          <div class="zixun">
            <div class="xuanzhuan">
              <ul>
              <s:iterator value="voteList" var="vote">
                 <li><div class="xzname left"><a href="trainVote_trainVoteIn.action?voteId=${vote.voteId}">${vote.voteTitle}</a><p>点赞数: <span>${vote.voteFocusCount}</span> 个  </p></div></li>
              </s:iterator>
              </ul>
            </div>
          </div>
          <p:page url="trainVote_trainVote.action" params="" />
         <div class="clear"></div>
          <p>大家好，欢迎刊登企业广告，产品推荐，产品信息置顶等，欢迎您对网站建设提出宝贵建议，请中航元屿海位于惠州市惠东县巽寮镇粘坑中段，地处巽寮国家AAAA级风景区核心区域，是同时拥有临海、亲湖、环山、观岛四大特色的高端滨海度假区。</p>
        </div>
   
        <div class="" style="height:20px; "></div>
              <script language="javascript" type="text/javascript" src="js/bankclass.js"></script>
              <div class="c1">
                  <dl class="tbox notlight left">
                   <dd class="notlight">
                   <div class="stepselect mt1">
                     <div class="stepselects stepselects_none" id="organizerclass" style="display:block;overflow:hidden;height:110px;" oldheight="110"><span class="itemname" style="height:40px;line-height:40px;  padding:30px 0px; "><strong>行业</strong></span>
                     <span class="egroup">
                     <ul class="cp_list">
                       <s:if test="voteTradeId==-1 ||voteTradeId==null">
                        	<li><a href="trainVote_trainVote.action?voteTradeId=-1" style="color: red;">全部</a></li>
                       </s:if>
                       <s:else>
                       	<li><a href="trainVote_trainVote.action?voteTradeId=-1">全部</a></li>
                       </s:else>
                       <s:iterator value="industryList" var="industry">
                       	<s:if test="#industry.industryId==voteTradeId">
                       		 <li><a href="trainVote_trainVote.action?voteTradeId=${industry.industryId}" style="color: red;">${industry.industryName}</a></li>
                       	</s:if>
                     <s:else>
                     	 <li><a href="trainVote_trainVote.action?voteTradeId=${industry.industryId}">${industry.industryName}</a></li>
                     </s:else>
                     </s:iterator>
                     </ul> 
                    <span><button onclick="Scroll(&#39;organizerclass&#39;, 160, 2.0)" class="btn-9"></button></span>
                    </span></div>
                     </div>
                   </dd>
                 </dl>
      </div>
             <div class="clear"></div>
        <div class="tab pdides01">
          <ul class="menu">
            <!--<div class="line"></div>-->
            <li class="active">培训需求投票</li>
            <li>培训供应投票</li>
            <div class="an_tj"><a href="trainVote_trainVote.action?type=focus">按点赞</a></div>
          </ul>
          <div class="con1">
            <div class="cpdp">
              <ul>
              <s:iterator value="trainSupply" var="supply">
              	<li class="tou_piao">
                  <div class="tou_n"><a class="coms" href="trainVote_trainVoteIn.action?voteId=${supply.voteId}">${supply.voteTitle}</a>
                  	<div class="top_date"><b><s:date name="#supply.publishTime" format="yyyy-MM-dd"/></b> | <a class="good"  id="${supply.voteId}" href="javascript:void(0)" onclick="focusCount(<s:property value="#supply.voteId" />)">${supply.voteFocusCount}</a></div>
                  </div>
                  <div class="tp_jj">
                    <p><strong>用户遇到的问题和挑战：</strong> ${supply.voteQuestionChallenge}</p>
                      <p><strong>对培训的要求：</strong>${supply.voteContentOutline}</p>
                  </div>
                </li>
              </s:iterator>
              </ul>
            </div>
          </div>
          <div class="con2">
            <div class="cpdp">
              <ul>
              <s:iterator value="trainDemand" var="demand">
                <li class="tou_piao">
                  <div class="tou_n"><a class="coms" href="trainVote_trainVoteIn.action?voteId=${demand.voteId}">${demand.voteTitle}</a>
                  	<div class="top_date"><b><s:date name="#demand.publishTime"  format="yyyy-MM-dd"/></b> | <a class="good" id="${demand.voteId}"  href="javascript:void(0)" onclick="focusCount(<s:property value="#demand.voteId" />)">${demand.voteFocusCount}</a></div>
                  </div>
                  <div class="tp_jj">
                      <p><strong>用户遇到的问题和挑战：</strong> ${demand.voteQuestionChallenge}</p>
                      <p><strong>培训内容介绍和大纲：</strong>${demand.voteContentOutline}</p>
                  </div>
                </li>
                 </s:iterator>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="intent2"> 
        <div class="clear"></div>
        <div class="clear"></div>
      </div>
    </div>
  </div>
  <div class="clear"></div>
  <div class="" style="height:45px;"></div>
	<jsp:include page="base/footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
$(function () {
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
});

</script>
</body>
</html>


