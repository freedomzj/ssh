<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript">
		$(function(){
			$.getJSON("index_ajaxLoadIndustry.action",function(data){
				for(var a=0;a<data.length;a++){
					$("#industry_ul").append("<li><a href=''>"+data[a].industryName+"</a></li>");
				}
			});
			$.getJSON("index_ajaxLoadBusiness.action",function(data){
				for(var a=0;a<data.length;a++){
					var desc = data[a].businessDescription.replace(/<[^>]+>/g,"");//去掉所有的html标记
					var domStr = "<li class='tjcp'>"
				        +"<a class='tjpic' href='business_businessIn.action?businessId="+data[a].businessId+"'><img src="+data[a].businessImg1+" /></a>"
				        +"<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='business_businessIn.action?businessId="+data[a].businessId+"'>"+data[a].businessName+"</a></p>"
				        +"<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>"+desc+"</strong></p>"
				        +"</li>";
					$("#businessBefore").after(domStr);
				}
			});
		});
	</script>
  </head>
    <body>
  	<div class="left_bar left">
        <div class="door_class left">
            <ul id="industry_ul">
            </ul>
            </div>
         <div class="caigou_right left">
        <div class="hot_tj">
        <img src="resource/images/ht1.jpg" />
        </div>
        
        
        <div class="" style="height:10px;"></div>
        <div class="hot_tj">
        <h2 class="tjtitle"><dl><dt>相关设计师</dt>
          <dd></dd></dl></h2>
          
        <div class="" style="height:5px;" id="businessBefore"></div>
        <!-- 存放业务能人 -->
        </li>
        </div>
        </div>
        </div>
  </body>
</html>
