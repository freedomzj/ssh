<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>业务联系</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="resource/css/animate.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/jPages.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jPages.min.js"></script>
<script type="text/javascript" >
$(function(){
	 $(function(){
       $("div.holder").jPages({  
			  containerID : "itemContainer",  
			  previous : "上一页",  
			  next : "下一页",  
			  perPage : 10 
		});
	});
});
</script>
</head>
<body>
	<div class="wrap">
        <jsp:include page="base/top.jsp" ></jsp:include>
        
        <div class="content">
        <div class="quick"><a href="index_indexUI.action"><img src="resource/images/home.png" />首页</a> > <span>业务联系</span></div>
            <div class="intent2">
               <div class="clear"></div> 
               <div><a href="hibernate_oneToOne.action" target="_blank">oneToOne</a></div>
             <div class="zixun2 zixun">
             <h3 class="mailc"><span class="left">大家好，欢迎刊登企业广告，产品推荐，产品信息置顶等，欢迎您对网站建设提出宝贵建议，请</span> <a href="mailto:customerservice@qunxiangcompany.com">点击邮箱联系</a></h3>
             <div id="companyInfo">
             	<h1>上海群享电子商务有限公司</h1>
				<br />
				开户银行：中国建设银行股份有限公司上海打浦路支行 <br />
				<br />
				银行账号：31001625777050007277 <br />
				<br />
				电话：13817177559 <br />
				<br />
				企业邮箱：customerservice@qunxiangcompany.com &nbsp;<br />
				<br />
				QQ：3229191623 <br />
				</div>
				<br /><br />
             </div>
             <h2 class="guli"><dl><dt>常见问题</dt><dd></dd></dl></h2>
             <div class="gltd" style="display: block;">
             
	        	<ul id="itemContainer">
				        <s:iterator value="questionList">
					          <li style="height:90px;">
					            <div class="gltd_l"><img src="resource/images/ask.jpg" /></div>
					            <div class="gltd_r">
					              <table width="750" border="0" cellspacing="0" cellpadding="0">
					                <tbody>
					                  <tr>
					                     <!-- 问题标题 -->
					                    <th colspan="2"><s:property value="questionName" /></th>
				                      </tr>
				                    </tbody>
				                  </table>
					              <dl>
					                <div style="line-height:30px;color:#666;">
					                    <!-- 问题答案 -->
					                	<p><s:property value="questionAnswer" /></p>
				                    </div>
				                  </dl>
				                </div>
					            <span class=""></span> 
					            </li>
				        </s:iterator>
	            </ul>
            
            <div class="holder holder3" style="float:right;font-size:20px;margin-right: 100px"></div>
          </div>
             </div>      
             <div class="" style="height:30px;"></div>      
             
          <div class="clear"></div>
            </div>
           
        </div>
        <div class="clear"></div>
        <div class="" style="height:45px;"></div>
		
		<jsp:include page="base/footer.jsp" ></jsp:include>
    </div>
<script type="text/javascript" src="/resource/js/tuan.js"></script>
</body>
</html>
