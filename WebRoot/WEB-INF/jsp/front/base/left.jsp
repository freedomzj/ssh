<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<script type="text/javascript">
		$(function(){
			$.getJSON("index_ajaxLoadIndustry.action",function(data){
				for(var a=0;a<data.length;a++){
					$("#industry_ul").append("<li><a href=''>"+data[a].industryName+"</a></li>");
				}
				<%--				data[int].industyId--%>
			});
		});
	</script>
  </head>
  
  <body>
     <div class="door_class left">
            <ul id="industry_ul">
            </ul>
      </div>
  </body>
</html>
