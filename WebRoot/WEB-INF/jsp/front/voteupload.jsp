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
<title>投票信息上传-需求/供应</title>
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
        <div class="quick"><a href="index.html"><img src="resource/images/home.png" />首页</a> > <a href="#">培训投票</a> > <span>培训投票信息上传</span></div>
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
				<li class="current"><a href="javascript:void(0);">需求</a></li>
				<li><a href="javascript:void(0);">供应</a></li> 
			</ul>
			<div class="p_tab_box">
				<div>
                <div class="sale">
                <div class="left_tab left">
                	<form action="trainVote_doVoteUpload.action" method="post" id="form1">
                	    <input type="hidden" name="voteType" value="xuqiu" />
                		<input type="hidden" name="vote.voteUserId" value=${session.user.userId } />
                		<table width="100%">
		                <tbody>
		                <tr><td align="right"><span>*</span> 培训主题：</td><td><input type="text" class="s_in01" name="vote.voteTitle" datatype="*" nullmsg="请输入培训主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 行业：</td><td>
		                <select class="s_in05" name="vote.voteIndustryId" id="select1">
		                <option value="0" selected="selected">请选择行业</option>
		                	   <s:iterator value="industryList" >
				                    <option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
				               </s:iterator>
		                </select><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 公司名称：</td><td><input type="text" class="s_in01" name="vote.voteCompanyName" datatype="*" nullmsg="请输入公司名称" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="vote.voteConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 电话：</td><td><input type="text" class="s_in02" name="vote.votePhone" datatype="m" nullmsg="请输入电话" errormsg="请输入有效的电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="vote.voteQq" datatype="*" nullmsg="请输入qq" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 邮箱：</td><td><input type="text" class="s_in01" name="vote.voteEmail" datatype="e" nullmsg="请输入邮箱" errormsg="请输入有效的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"><span>*</span> 用户遇到的问题和挑战：</td><td ><textarea class="s_in03" style="width:500px;height:200px" name="vote.voteQuestionChallenge" datatype="*" nullmsg="请输入问题和挑战" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td align="right"><span>*</span> 对培训的要求：</td><td><textarea class="s_in03" style="width:500px;height:200px" name="vote.voteRequire" datatype="*" nullmsg="请输入要求" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
		                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" style="width:500px;height:200px" name="vote.voteOther"></textarea></td></tr>
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
	                <form action="trainVote_doVoteUpload.action" method="post" id="form2">
	                	    <input type="hidden" name="voteType" value="gongying" />
	                		<input type="hidden" name="vote.voteUserId" value=${session.user.userId } />
	                		<table width="100%">
				                <tbody>
				                <tr><td align="right"><span>*</span> 培训主题：</td><td><input type="text" class="s_in01" name="vote.voteTitle" datatype="*" nullmsg="请输入培训主题" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td align="right"><span>*</span> 行业：</td><td>
				                <select class="s_in05" name="vote.voteIndustryId" id="select2">
				                <option value="0" selected="selected">请选择行业</option>
				                	   <s:iterator value="industryList" >
						                    <option value="<s:property value='industryId' />"><s:property value='industryName' /></option>
						               </s:iterator>
				                </select></td></tr>
				                <tr><td align="right"><span>*</span> 公司名称：</td><td><input type="text" class="s_in01" name="vote.voteCompanyName" datatype="*" nullmsg="请输入公司名称" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td align="right"><span>*</span> 联系人：</td><td><input type="text" class="s_in02" name="vote.voteConnecter" datatype="*" nullmsg="请输入联系人" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td align="right"><span>*</span> 电话：</td><td><input type="text" class="s_in02" name="vote.votePhone" datatype="m" errormsg="请输入有效的电话号码" nullmsg="请输入电话" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td align="right"><span>*</span> 手机：</td><td><input type="text" class="s_in02" name="vote.voteMobile" datatype="m" errormsg="请输入有效的电话号码" nullmsg="请输入手机" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td align="right"> QQ:</td><td><input type="text" class="s_in02" name="vote.voteQq" datatype="*" nullmsg="请输入qq" sucmsg=" " /><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td align="right"><span>*</span> 邮箱：</td><td><input type="text" class="s_in01" name="vote.voteEmail" datatype="e" nullmsg="请输入邮箱" error="请输入正确的邮箱" sucmsg=" "/><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td  align="right"><span>*</span> 用户遇到的问题和挑战：</td><td ><textarea class="s_in03" style="width:500px;height:200px" name="vote.voteQuestionChallenge" datatype="*" nullmsg="请输入问题和挑战" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td align="right"><span>*</span> 培训内容介绍和大纲：</td><td><textarea class="s_in03" style="width:500px;height:200px" name="vote.voteContentOutline" datatype="*" nullmsg="请输入内容和大纲" sucmsg=" "></textarea><font color="#FF0000" class="msg"></font><br/><strong>把精彩的内容展现一些，引起用户兴趣</strong><font color="#FF0000" class="msg"></font></td></tr>
				                <tr><td  align="right"> 其他：</td><td ><textarea class="s_in03" name="vote.voteOther" style="width:500px;height:200px"></textarea></td></tr>
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
