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
<title>培训机构信息上传-需求/供应</title>
<link href="resource/css/basic.css" rel="stylesheet" type="text/css" />
<link href="resource/css/gongyong.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resource/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" >
	$(function(){
		$("#form1").Validform({
			tiptype:function(msg,o,cssctl){
			    o.obj.next().text(msg);
			},
			beforeSubmit:function(curform){
				//在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话表单将不会提交;	
				$(".msg").each(function(){
					$(this).html("");
				});
				if($("#select1").val() == 0){
					$("#select1").next().html("请选择行业");
					return false;
				}
				if($("#one").val() == ""){
					$("#one").next().html("请选择宣传图片");
					return false;
				}
				if($("#two").val() == ""){
					$("#two").next().html("请选择老师图片");
					return false;
				}
				alert("提交成功，请等待后台人员的审核！");
			},
			showAllError:false,
			tipSweep:false//表单提交时才会触发验证，失去焦点不会触发验证
		});

		$("#form2").Validform({
			tiptype:function(msg,o,cssctl){
			    o.obj.next().text(msg);
			},
			beforeSubmit:function(curform){
				//在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话表单将不会提交;	
				$(".msg").each(function(){
					$(this).html("");
				});
				if($("#select2").val() == 0){
					$("#select2").next().html("请选择行业");
					return false;
				}
				if($("#three").val() == ""){
					$("#three").next().html("请选择宣传图片");
					return false;
				}
				alert("提交成功，请等待后台人员的审核！");
			},
			showAllError:false,
			tipSweep:false//表单提交时才会触发验证，失去焦点不会触发验证
		});
	});
</script>
<style type="text/css">
	.error,.msg{
		font-size: 12px;
		color:red;
	}
</style>
</head>
<body>
	<div class="wrap">
        <jsp:include page="base/top.jsp" ></jsp:include>
        <div class="content">
        <div class="quick"><a href="index.html"><img src="resource/images/home.png" />首页</a> > <a href="#">培训选择</a> > <span>培训选择信息上传</span></div>
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
             <div class="p_box demo5">
			<ul class="p_tab_menu">
                <li class="current"><a href="javascript:void(0);">供应</a></li> 
				<li><a href="javascript:void(0);">需求</a></li>
			</ul>
			<div class="p_tab_box">
				<div>
                <div class="sale">
                <div class="left_tab left">
                <form action="trainChoose_doTrainUpload.action" method="post" id="form1">
                	<input type="hidden" name="trainType" value="gongying" />
                	<input type="hidden" name="train.trainUserId" value="${session.user.userId }" />
	                <table width="100%">
	                <tbody>
	                <tr><td align="right"><span>*</span> 培训课程主题：</td><td><input type="text" class="s_in01" name="train.trainName" datatype="*" nullmsg="请输入培训课程主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 适用的行业：</td><td>
	                <select class="s_in05" name="train.trainIndustryId"  id="select1">
	                <option value="0" selected="selected">请选择行业</option>
	                	   <s:iterator value="industryList" >
			                    <option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
			               </s:iterator>
	                </select><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span>  培训老师推荐：</td><td><input type="text" class="s_in01" name="train.trainTeacher" datatype="*" nullmsg="请输入培训老师名称" sucmsg=" " /><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 参考报价：</td><td><input type="text" class="s_in02" name="train.trainPrice"  datatype="n" nullmsg="请输入参考报价" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 公司名称：</td><td><input type="text" class="s_in01" name="train.trainCompanyName" datatype="*" nullmsg="请输入公司名称" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="train.trainConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 固定电话：</td><td><input type="text" class="s_in02" name="train.trainPhone" datatype="m" nullmsg="请输入固定电话" errormsg="请输入有效的电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 手机：</td><td><input type="text" class="s_in02" name="train.trainMobile" datatype="m" nullmsg="请输入固定电话" errormsg="请输入有效的电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="train.trainQq" datatype="*" nullmsg="请输入qq号码" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span> 企业邮箱：</td><td><input type="text" class="s_in01" name="train.trainCompanyEmail" datatype="e" nullmsg="请输入企业邮箱" errormsg="请输入有效的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td  align="right"><span>*</span> 用户遇到的问题和挑战：</td><td ><textarea class="s_in03" style="width:500px;height:200px" name="train.trainQuestionChallenge" datatype="*" nullmsg="请输入问题和挑战" sucmsg=" " ></textarea><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"><span>*</span>  精彩内容介绍和培训大纲：</td><td><textarea class="s_in03" style="width:500px;height:200px" name="train.trainContentOutline" datatype="s" nullmsg="请输入内容介绍和大纲" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font><br/><strong>（ 把精彩的内容展现一些，引起用户兴趣 ）</strong></td></tr>
	                <tr><td  align="right"><span>*</span> 企业介绍：</td><td ><textarea class="s_in03" style="width:500px;height:200px" name="train.trainCompnayDes" datatype="s" nullmsg="请输入企业介绍" sucmsg=" "></textarea><font color="#FF0000" class="msg"></td></tr>
	                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" name="train.trainOther" style="width:500px;height:200px"></textarea><br/><strong>（ 请说明开课日程，开课城市等情况 ）</strong></td></tr>
	                <tr><td align="right"> 宣传图片上传：</td><td><input type="file" name="files" datatyep="*" nullmsg="请选择宣传图片" sucmsg=" " id="one"/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"> 培训老师图片上传：</td><td><input type="file" name="files" datatyep="*" nullmsg="请选择老师图片" sucmsg=" " id="two"/><font color="#FF0000" class="msg"></font></td></tr>
	                <tr><td align="right"></td><td></td></tr>
	                <tr><td align="right"></td><td><input type="submit" class="s_in04" value="确认并提交" /></td></tr>
	                </tbody>
	                </table>
	               </form>
                </div>
                </div>
                </div>
                <div class="hide">
                <div class="sale">
                <div class="left_tab left">
                	<form action="trainChoose_doTrainUpload.action" method="post" id="form2">
                	<input type="hidden" name="trainType" value="xuqiu" />
                	<input type="hidden" name="train.trainUserId" value="${session.user.userId }" />
                		<table width="100%">
		                <tbody>
		                <tr><td align="right"><span>*</span> 培训主题：</td><td><input type="text" class="s_in01" name="train.trainName" datatype="*" nullmsg="请输入培训课程主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 迫切度：</td><td>
								<select name="train.trainPoqiedu">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
		                <span> 1 - 10 </span>分</td></tr>
		                <tr><td align="right"><span>*</span> 所处的行业：</td><td>
		                <select class="s_in05" name="train.trainIndustryId"  id="select2">
		                <option value="0" selected="selected" id="select1">请选择行业</option>
		                	   <s:iterator value="industryList" >
				                    <option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
				               </s:iterator>
		                </select><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 公司名称：</td><td><input type="text" class="s_in01" name="train.trainCompanyName" datatype="*" nullmsg="请输入公司名称" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="train.trainConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 固定电话：</td><td><input type="text" class="s_in02" name="train.trainPhone" datatype="m" nullmsg="请输入固定电话" errormsg="请输入有效的电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 手机：</td><td><input type="text" class="s_in02" name="train.trainMobile" datatype="m" nullmsg="请输入固定电话" errormsg="请输入有效的电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="train.trainQq" datatype="*" nullmsg="请输入qq号码" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 企业邮箱：</td><td><input type="text" class="s_in01" name="train.trainCompanyEmail" datatype="e" nullmsg="请输入企业邮箱" errormsg="请输入有效的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"><span>*</span> 用户遇到的问题和挑战：</td><td ><textarea class="s_in03" name="train.trainQuestionChallenge" style="width:500px;height:200px" datatype="*" nullmsg="请输入问题和挑战" sucmsg=" " ></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 对培训的要求：</td><td><textarea class="s_in03" name="train.trainRequire" style="width:500px;height:200px" datatype="s" nullmsg="请输入对培训的要求" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font><br/><strong>（ 把精彩的内容展现一些，引起用户兴趣 ）</strong></td></tr>
		                <tr><td  align="right"><span>*</span> 企业介绍：</td><td ><textarea class="s_in03" style="width:500px;height:200px" name="train.trainCompnayDes" datatype="s" nullmsg="请输入企业介绍" sucmsg=" "></textarea><font color="#FF0000" class="msg"></td></tr>
		                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" name="train.trainOther" style="width:500px;height:200px"></textarea><br/></td></tr>
		                <tr><td align="right"> 宣传图片上传：</td><td><input type="file" name="file" datatyep="*" nullmsg="请选择宣传图片" sucmsg=" " id="three"/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"></td><td></td></tr>
		                <tr><td align="right"></td><td><input type="submit" class="s_in04" value="确认并提交" /></td></tr>
		                </tbody>
		                </table>
                	</form>
                </div>
                </div>
                </div>
			</div>
		  </div>            
          <div class="clear"></div>
            </div>
           
        </div>
        <div class="clear"></div>
        <div class="" style="height:45px;"></div>
     	 <jsp:include page="base/footer.jsp" ></jsp:include>
    </div>
</body>
</html>
