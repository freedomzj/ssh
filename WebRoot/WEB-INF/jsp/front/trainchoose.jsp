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
<title>培训选择-列表总</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="resource/css/index2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.4.2.min.js"></script>
</head>
<body>
<div class="wrap">
        <jsp:include page="base/top.jsp" ></jsp:include>
        <div class="content">
     	<jsp:include page="base/leftmore.jsp" ></jsp:include>
        <div class="cont_right">
        <div class="quick"><a href="index.html"><img src="resource/images/home.png" />首页</a> >  <span>培训选择</span></div>
        <div class="padd_backg bd1">
        <div class="pad1">
         <h2 class="guli"><dl><dt>培训课程推荐</dt><dd></dd></dl></h2>
        <div class="zixun">
          <div class="xuanzhuan">
             <ul>
             <s:iterator value="trainList" var="train">
              <li><div class="xzlog left"><a href="trainChoose_trainChooseIn.action?trainId=${train.trainId}"><img src="${train.trainImg1}" onerror="this.src('resource/images/dj1.jpg')" width="140px" height="110px" /></a></div><div class="xzname left"><a href="trainChoose_trainChooseIn.action?trainId=${train.trainId}">${train.trainCompanyName}</a><p>好评: <span>${train.trainFocusCount }</span>  个  </p></div></li>
             </s:iterator>
            </ul>
            </div>
             </div>
             <p:page url="trainChoose_trainChoose.action" params="" />
         	<div class="clear"></div>
<%--             <p>大家好，欢迎刊登企业广告，产品推荐，产品信息置顶等，欢迎您对网站建设提出宝贵建议，请中航元屿海位于惠州市惠东县巽寮镇粘坑中段，地处巽寮国家AAAA级风景区核心区域，是同时拥有临海、亲湖、环山、观岛四大特色的高端滨海度假区。</p>--%>
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
                       <s:if test="trainTradeId==-1 ||trainTradeId==null">
                        	<li><a href="trainChoose_trainChoose.action?trainTradeId=-1" style="color: red;">全部</a></li>
                       </s:if>
                       <s:else>
                       	<li><a href="trainChoose_trainChoose.action?trainTradeId=-1">全部</a></li>
                       </s:else>
                     <s:iterator value="industryList" var="industry">
                     <s:if test="trainTradeId==#industry.industryId">
                        	<li><a href="trainChoose_trainChoose.action?trainTradeId=${industry.industryId}" style="color: red;">${industry.industryName}</a></li>
                       </s:if>
                       <s:else>
                         <li><a href="trainChoose_trainChoose.action?trainTradeId=${industry.industryId}">${industry.industryName}</a></li>
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
                <li class="active">供应</li>
                <li>需求</li>
                <div class="an_tj">
                <a href="trainChoose_trainChoose.action">自动排序</a>
                </div>
            </ul>
                <div class="con1">
                <div class="cpdp">
                  <ul>
                  	<s:iterator value="trainSupply" var="supply">
                    <li class="canp_list">
                    <a class="u_pic" href="trainChoose_trainChooseIn.action?trainId=${supply.trainId}"><img src="${supply.trainImg1}" /></a>
                    <p class="user-info"><a class="u_n" href="trainChoose_trainChooseIn.action?trainId=${supply.trainId}">${supply.trainCompanyName }</a></p>
                     <div class="cpcrible">
                     <div class="cpl"><p><strong>培训课程主题: </strong>${supply.trainName }</p> <p><strong>用户遇到的问题和挑战: </strong>${supply.trainContentOutline }</p>
                                    <p style="height:50px;overflow: hidden;">${supply.trainCompanyDes }</p><a href="trainChoose_trainChooseIn.action?trainId=${supply.trainId}">详情>></a>
                                    <p><strong>好评度： </strong><em>${supply.trainPoqiedu}</em></p></div>
                     <div class="cpr">
                     <p>参考价格: <br/><span>${supply.trainPrice }</span>  元  </p>
                     </div>
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
                    <li class="canp_list">
                    <a class="u_pic" href="trainChoose_trainChooseIn.action?trainId=${demand.trainId}"><img src="images/dj2.jpg" /></a>
                    <p class="user-info"><a class="u_n" href="trainChoose_trainChooseIn.action?trainId=${demand.trainId}">${demand.trainCompanyName }</a></p>
                     <div class="cpcrible">
                     <div class="cpl"><p><strong>培训主题: </strong>>${demand.trainName }</p> <p><strong>用户遇到的问题和挑战: </strong>${demand.trainContentOutline}</p>
                                    <p  style="height: 40px;overflow: hidden;">${demand.trainCompanyDes }<a href="trainChoose_trainChooseIn.action?trainId=${demand.trainId}">详情>></a></p></div>
                     <div class="cpr">
                     <p>参考价格: <br/><span>${demand.trainPrice }</span>  元  </p>
                     </div>
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
        
		<jsp:include page="base/footer.jsp" ></jsp:include>
      </div>
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

