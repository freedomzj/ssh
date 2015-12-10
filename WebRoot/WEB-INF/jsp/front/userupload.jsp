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
<title>业务能人信息上传</title>
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
				if($("#select2").val() == 0){
					$("#select2").next().html("请选择部门");
					return false;
				}
				if($("#one").val() == ""){
					$("#one").next().html("请选择宣传图片");
					return false;
				}
				if($("#two").val() == ""){
					$("#two").next().html("请选择能人图片");
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
				if($("#select3").val() == 0){
					$("#select3").next().html("请选择行业");
					return false;
				}
				if($("#select4").val() == 0){
					$("#select4").next().html("请选择部门");
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
        <jsp:include page="base/top.jsp"></jsp:include>
        <div class="content">
        <div class="quick"><a href="index.html"><img src="resource/images/home.png" />首页</a> > <span>业务能人信息上传</span></div>
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
				<li class="current"><a href="javascript:void(0);">业务能人信息上传 </a></li>
                <li><a href="javascript:void(0);">企业需求 </a></li>
			</ul>
			<div class="p_tab_box">
				<div>
                <div class="sale">
                <div class="left_tab left">
                	<form action="business_doUserUpload.action" method="post" id="form1" enctype="multipart/form-data">
                	<input type="hidden" name="businessType" value="gongying" />
                	<input type="hidden" name="business.businessUserId" value=${session.user.userId } />
                		<table width="100%">
		                <tbody>
		                <tr><td align="right"><span>*</span>主题：</td><td><input type="text" class="s_in01" name="business.businessName" datatype="*" nullmsg="请输入主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                  <tr>
		                  <td align="right"><span>*</span> 熟悉的产品和市场：</td><td><input type="text" class="s_in02" name="business.businessProductMarket" datatype="*" nullmsg="请输入产品和市场" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 合作方式：</td><td><input type="text" class="s_in02" name="business.businessCooperation" datatype="*" nullmsg="请输入合作方式" sucmsg=" "/><font color="#FF0000" class="msg"></font><br/><strong>( 请详细介绍 )</strong></td></tr>
		                <tr><td align="right"><span>*</span> 行业：</td><td>
		                    <select class="s_in05" name="business.businessIndustryId" id="select1">
		                    <option value="" selected="selected">请选择行业</option>
		                    	<s:iterator value="industryList" >
		                    		<option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
		                    	</s:iterator>
		                    </select><font color="#FF0000" class="msg"></font><br/><strong>( 内容描述 )</strong>
		                </td></tr>
		                
		                <tr>
		                  <td align="right"><span>*</span> 工作部门：</td><td>
		                    <select class="s_in05" name="business.businessDepartmentId" id="selected2">
		                    <option value="" selected="selected">请选择部门</option>
		                    	<s:iterator value="departmentList" >
		                    		<option value="<s:property value='departmentId' />"><s:property value='departmentName' /></option>
		                    	</s:iterator>
		                    </select><font color="#FF0000" class="msg"></font>
		                    <br/><strong>( 请详细介绍 )</strong>
		                </td></tr>
		                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="business.businessConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 电话和手机：</td><td><input type="text" class="s_in02" name="business.businessMobile" datatype="m" nullmsg="请输入联系方式" errormsg="请输入正确的联系方式" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="business.businessQq" datatype="*" nullmsg="请输入qq号码" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 邮箱：</td><td><input type="text" class="s_in01" name="business.businessEmail"  datatype="e" nullmsg="请输入邮箱" errormsg="请输入正确的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 工作中的挑战，成功经验共享：</td><td><textarea class="s_in03" name="business.businessChallengeExperience" style="width:500px;height:200px" datatype="*" nullmsg="请输入挑战和经验" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font><br/><strong>( 请详细介绍 )</strong></td></tr>
		                  <tr><td  align="right"><span>*</span> 业务专长：</td><td ><textarea class="s_in03" name="business.businessHobby" datatype="*" style="width:500px;height:200px" nullmsg="请输入挑战和经验" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"><span>*</span> 业务能人介绍：</td><td ><textarea class="s_in03" name="business.businessDescription" style="width:500px;height:200px" datatype="*" nullmsg="请输入业务能人介绍" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" name="business.businessOther" style="width:500px;height:200px"></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 宣传图片上传：</td><td><input type="file" name="files" id="one"><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 业务能人图片上传：</td><td><input type="file" name="files" id="two"><font color="#FF0000" class="msg"></font></td></tr>
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
                	<form action="business_doUserUpload.action" method="post" id="form2" enctype="multipart/form-data">
                	<input type="hidden" name="businessType" value="xuqiu" />
                	<input type="hidden" name="business.businessUserId" value=${session.user.userId } />
                		<table width="100%">
		                <tbody>
		                <tr><td align="right"><span>*</span>主题：</td><td><input type="text" class="s_in01" name="business.businessName" datatype="*" nullmsg="请输入主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                  <tr>
		                  <td align="right"><span>*</span> 熟悉的产品和市场：</td><td><input type="text" class="s_in02" name="business.businessProductMarket" datatype="*" nullmsg="请输入产品和市场" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 合作方式：</td><td><input type="text" class="s_in02" name="business.businessCooperation" datatype="*" nullmsg="请输入合作方式" sucmsg=" "/><font color="#FF0000" class="msg"></font><br/><strong>( 请详细介绍 )</strong></td></tr>
		                <tr><td align="right"><span>*</span> 行业：</td><td>
		                    <select class="s_in05" name="business.businessIndustryId" id="select3">
		                    <option value="" selected="selected">请选择行业</option>
		                    	<s:iterator value="industryList" >
		                    		<option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
		                    	</s:iterator>
		                    </select><font color="#FF0000" class="msg"></font><br/><strong>( 内容描述 )</strong>
		                </td></tr>
		                <tr>
		                  <td align="right"><span>*</span> 工作部门：</td><td>
		                    <select class="s_in05" name="business.businessDepartmentId" id="selected4">
		                    <option value="" selected="selected">请选择部门</option>
		                    	<s:iterator value="departmentList" >
		                    		<option value="<s:property value='departmentId' />"><s:property value='departmentName' /></option>
		                    	</s:iterator>
		                    </select><font color="#FF0000" class="msg"></font>
		                    <br/><strong>( 请详细介绍 )</strong>
		                </td></tr>
		                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="business.businessConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 电话和手机：</td><td><input type="text" class="s_in02" name="business.businessMobile" datatype="m" nullmsg="请输入联系方式" errormsg="请输入正确的联系方式" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="business.businessQq" datatype="*" nullmsg="请输入qq号码" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 邮箱：</td><td><input type="text" class="s_in01" name="business.businessEmail"  datatype="e" nullmsg="请输入邮箱" errormsg="请输入正确的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                  <tr><td align="right"><span>*</span> 企业遇到的挑战和机遇：</td><td><textarea class="s_in03" style="width:500px;height:200px" name="business.businessChallengeExperience" datatype="*" nullmsg="请输入挑战和经验" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font><br/><strong>( 请详细介绍 )</strong></td></tr>
		                  <tr><td  align="right"><span>*</span> 企业要求：</td><td ><textarea class="s_in03" style="width:500px;height:200px" name="business.businessRequire" datatype="*" nullmsg="请输入企业要求" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"><span>*</span> 企业介绍：</td><td ><textarea class="s_in03" style="width:500px;height:200px" name="business.businessDescription"  datatype="*" nullmsg="请输入业务能人介绍" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" name="business.businessOther" style="width:500px;height:200px"></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 宣传图片上传：</td><td><input type="file" name="file" id="three"><font color="#FF0000" class="msg"></font></td></tr>
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
		<jsp:include page="base/footer.jsp"></jsp:include>
    </div>
</body>
</html>

