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
<title>设计师-列表总</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="resource/css/index2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="wrap">
 <jsp:include page="base/top.jsp" ></jsp:include>
  <div class="content">
  	<jsp:include page="base/leftmore.jsp"></jsp:include>
    <div class="cont_right">
      <div class="quick"><a href="index_indexUI.action"><img src="resource/images/home.png" />首页</a> > <span>业务能人</span></div>
      <div class="padd_backg bd1">
        <div class="pad1">
          <h2 class="guli">
            <dl>
              <dt>业务能人推荐</dt>
              <dd></dd>
            </dl>
          </h2>
          <div class="zixun">
            <div class="xuanzhuan">
              <ul>
              <s:if test="person.size()>0">
              <s:iterator value="person" var="persons">
              	 <li>
              	 <div class="xzlog left">
              		 <a href="business_businessIn.action?businessId=${persons.businessId}"><img src="${persons.businessImg1}" /></a>
              	</div>
              <div class="xzname left">
              	 <a href="business_businessIn.action?businessId=${persons.businessId}">${persons.businessName}</a><p>好评度:<span>${persons.businessFocusCount}</span></p>
              	 </div></li>
              </s:iterator>
              </s:if>
              <s:else>
              	<li style="color: red; text-align: center;">没有相关行业的数据请添加或者重新选择行业!</li>
              </s:else>
              </ul>
            </div>
          </div>
           <s:if test="person.size()>0">
             <p:page url="business_businessList.action" params="" />
           </s:if>
        
            <div class="clear"></div>
          <p>大家好，欢迎刊登企业广告，产品推荐，产品信息置顶等，欢迎您对网站建设提出宝贵建议，请中航元屿海位于惠州市惠东县巽寮镇粘坑中段，地处巽寮国家AAAA级风景区核心区域，是同时拥有临海、亲湖、环山、观岛四大特色的高端滨海度假区。</p>
        </div>
        <div class="" style="height:20px; "></div>
      <script language="javascript" type="text/javascript" src="resource/js/bankclass.js"></script>
              <div class="c1">
                  <dl class="tbox notlight left">
                   <dd class="notlight">
                   <div class="stepselect mt1">
                     <div class="stepselects stepselects_none" id="organizerclass" style="display:block;overflow:hidden;height:110px;" oldheight="110">
                     <span class="itemname" style="height:40px;line-height:40px;  padding:30px 0px; "><strong>行业</strong></span>
                     <span class="egroup">
                     <ul class="cp_list">
                     <s:if test="tradeId==-1 ||tradeId==null">
                     <li><a href="business_businessList.action?tradeId=-1" style="color: red;">全部</a></li>
                     </s:if>
                     <s:else>
                        <li><a href="business_businessList.action?tradeId=-1">全部</a></li>
                     </s:else>
                     <s:iterator value="industryList" var="industry">
                     	<s:if test="#industry.industryId==tradeId">
                     	 <li><a href="business_businessList.action?tradeId=${industry.industryId}" style="color: red;">${industry.industryName}</a></li>
                     	</s:if>
                     	<s:else>
                  			 <li><a href="business_businessList.action?tradeId=${industry.industryId}">${industry.industryName}</a></li>
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
            <li class="active">业务能人</li>
            <li>企业需求</li>
            <div class="an_tj"><a href="business_businessList.action">自动排序</a><a href="business_businessList.action?type=rating">按好评度</a></div>
          </ul>
          <div class="con1">
         <s:iterator value="personSupply" var="supply">
            <dl>
            <dt style="float:left;width:75%;"><a href="business_businessIn.action?businessId=${supply.businessId}">${supply.businessName}</a><p><strong>工作中的挑战，成功经验共享</strong><br />
              ${supply.businessChallengeExperience }</p>
               <p><strong>好评度： </strong><em>${supply.businessFocusCount}</em></p>
            </dt>
            <dd style="float:right"><a href="business_businessIn.action?businessId=${supply.businessId}"><img src=" ${supply.businessImg1}" /></a></dd>
            </dl>
            </s:iterator>
          </div>
          <div class="con1" style="display: none;">
           <s:iterator value="personDemand" var="demand">
            <dl>
            <dt  style="float:left;width:75%;"><a href="business_businessIn.action?businessId=${demand.businessId}">${demand.businessName}</a><p><strong>企业要求</strong><br />
          ${demand.businessName }</p>
            </dt>
            <dd style="float:right"><a href="business_businessIn.action?businessId=${demand.businessId}"><img src="images/g1.jpg" /></a></dd>
            </dl>
            </s:iterator>
          </div>
        </div>
      </div>
        <div class="" style="height:30px;"></div>      
        
    </div>
  </div>
  <div class="clear"></div>
  <div class="" style="height:45px;"></div>
  <jsp:include page="base/footer.jsp" ></jsp:include>
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
