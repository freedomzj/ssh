<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>点评</title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<link href="css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="css/index2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body>
	<div class="wrap">
        <div class="top_wrap">
        	<div class="top1">
              <div class="dz01 right"><a href="denlu.html">请登录</a><a href="zhuche.html">请注册</a></div></div>
        	   <div class="top2">
            	<div class="logo left"><a href="index.html"><img src="images/logo.jpg" width="217" height="134"/></a></div>
                <div class="top2_zhong left">
                  <!--搜索开始--> 
                  <script type="text/javascript">
					$(function(){ 
					
							$("#searchSelectedB").click(function(){ 
							$("#searchTabB").show();
							$(this).addClass("searchOpenB");
						}); 
					
						$("#searchTabB li").hover(function(){
							$(this).addClass("selectedB");
						},function(){
							$(this).removeClass("selectedB");
						});
						 
						$("#searchTabB li").click(function(){
							$("#searchSelectedB").html($(this).html());
							$("#searchTabB").hide();
							$("#searchSelectedB").removeClass("searchOpenB");
						});
						
					});
					</script>
                  <!--搜索结束-->
                  <div class="sou left">
                    <div id="searchTxtB" class="searchTxtB" onMouseOver="this.className='searchTxtB searchTxtHoverB';" onMouseOut="this.className='searchTxtB';">
                     <div class="searchMenuB">
              <div class="searchSelectedB" id="searchSelectedB">全部</div>
              <div style="display:none;" class="searchTabB" id="searchTabB">
                <ul>
                  <li>业务能人</li>
                  <li>培训选择</li>
                  <li>培训投票</li>
                </ul>
              </div>
            </div>
            </div>
             <input type="text" class="names" value="" onfocus="this.value=''" onblur="if(!value){value=defaultValue;}"/>
             <input type="submit" class="nbt" value="搜 索" />
                  </div>
                    <div class="clear"></div>
                    
                </div>
                <div class="top_fabu right"><a class="fabu" href="class_first.html">免费发布信息</a></div>
                <div class="clear"></div>
        	</div>
            <div class="top3">
            	<div class="top3_left left">
                    <div class='allsort'>
                        <div class='mt'><strong><a href="index.html">业 务 门 类</a></strong></div>
                  </div><!--allsort end-->
                </div>
                <div class="top3_zhong left">
                 <div class="top3_nav">
                    <ul>
                        <li><a href="sjshi_zong.html">业务能人</a></li>
                    <li><a href="sjxuanzhe_zong.html">培训选择</a></li>
                    <li><a href="toupiao_zong.html">培训投票</a></li>
                    <li><a href="ywcontact.html">业务联系</a></li>
                    </ul>
					<div class="clear"></div>
                    </div> 
                </div>
        	</div>
        </div>
        <div class="content">
        <div class="quick"><a href="index.html"><img src="images/home.png" />首页</a> > <span>设计选择供应点评</span></div>
            <div class="intent2">
               <div class="" style="height:15px;"></div>       
             <div class="p_box">
			<div class="p_tab_box">
				<div>
                <div class="sale">
                <div class="dpsale">
                <h1>请点评：</h1>
                <table>
                <tbody>
                <tr>
                  <td align="right">好评度：</td><td><input type="text" class="s_in01" /><span> 1 - 10 </span>分<br/><strong>(请根据供应者网上产品描述和实际使用的一致性，请根据供应商在交易过程中的服务水平。)</strong></td></td></tr>
                <tr><td align="right">点评文字描述：</td><td><textarea class="s_in02"></textarea></td></td></tr>
                <tr><td align="right"></td><td></td></td></tr>
                <tr><td align="right"></td><td><input type="checkbox"  /> 
                匿名点评</td></td></tr>
                <tr><td align="right"></td><td><input type="submit" class="s_in03" value="确认并提交" /></td></tr>
                
                </tbody>
                </table>
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
		<div class="foot1_wrap">        
            <div class="foot1">
            	<div class="foot1_nav">
                <dl class="fn01">
                <img src="images/wx.jpg" />
                </dl>
                <dl class="fn02">
                <dt>培训选择</dt>
                <dd><a href="#">电缆组件</a></dd>
                <dd><a href="#">工业线束</a></dd>
                <dd><a href="#">特种电缆</a></dd>
                </dl>
                <dl class="fn03">
                <dt>培训投票</dt>
                <dd><a href="#">可再生能源</a></dd>
                <dd><a href="#">机械设备</a></dd>
                <dd><a href="#">物料搬运</a></dd>
                <dd><a href="#">运输系统</a></dd>
                </dl>
                <dl class="fn04">
                <dt>设计师</dt>
                <dd><a href="#">设计总监</a></dd>
                <dd><a href="#">设计经理</a></dd>
                </dl>
                <dl class="fn05">
                <dt>业务联系</dt>
                <dd><a href="#">留言中心</a></dd>
                <dd><a href="#">代理销售</a></dd>
                </dl>
                </div>
            </div>            
        </div>
        <div class="foot2_wrap">        
        <div class="foot1">
        <p>联系电话：400-021-6639     Email: gongyewang@163.com     地址：上海市闸北区共和新路汶水路12号</p>
        <p>COPYRIGHT © 2012-2014 WANGFUJING.COM ALL RIGHTS RESERVED</p>
        </div>
      </div>
    </div>
</body>
</html>
