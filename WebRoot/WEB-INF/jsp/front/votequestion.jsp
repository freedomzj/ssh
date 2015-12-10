<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投票-内页-供应</title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<link href="css/gongyong.css" rel="stylesheet" type="text/css" />
<link href="css/index2.css" rel="stylesheet" type="text/css" />
<!--<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>-->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>      
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
        <div class="left_bar left">
        <div class="door_class left">
            <ul>
            <li><a href="toupiao_zong.html">业务门类1</a></li>
            <li><a href="toupiao_zong.html">业务门类2</a></li>
            <li><a href="toupiao_zong.html">业务门类3</a></li>
            <li><a href="toupiao_zong.html">业务门类4</a></li>
            <li><a href="toupiao_zong.html">业务门类5</a></li>
            <li><a href="toupiao_zong.html">业务门类6</a></li>
            <li><a href="toupiao_zong.html">业务门类7</a></li>
            <li><a href="toupiao_zong.html">业务门类8</a></li>
            <li><a href="toupiao_zong.html">业务门类9</a></li>
            <li><a href="toupiao_zong.html">业务门类10</a></li>
            <li><a href="toupiao_zong.html">业务门类11</a></li>
            <li><a href="toupiao_zong.html">业务门类12</a></li>
            <li><a href="toupiao_zong.html">业务门类13</a></li>
            <li><a href="toupiao_zong.html">业务门类14</a></li>
            <li><a href="toupiao_zong.html">业务门类15</a></li>
            <li><a href="toupiao_zong.html">业务门类16</a></li>
            <li><a href="toupiao_zong.html">业务门类17</a></li>
            </ul>
            </div>
         <div class="caigou_right left">
        <div class="hot_tj">
        <img src="images/ht1.jpg" />
        </div>
        <div class="" style="height:10px;"></div>
        <div class="hot_tj">
        <h2 class="tjtitle"><dl><dt>相关设计师</dt>
          <dd></dd></dl></h2>
        <div class="" style="height:5px;"></div>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
         <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
         <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
         <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
         <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        <li class="nopic">
        <p><a href="#">有钱任性，2014年上海最烧钱……</a></p>
        <p>12547人浏览</p>
        </li>
        </div>
        </div>
        </div>
        <div class="cont_right">
        <div class="quick"><a href="index.html"><img src="images/home.png" />首页</a> > <span>业务能人</span></div>
        	<div class="in_tentA">
            <a href="##" class="setadd right">加入收藏</a>
            <a id="example" class="Join" href="#">欢迎报名参加培训</a>
            <div id="LoginBox">
              <div class="row1"><a href="#" title="关闭窗口" class="close_btn" id="closeBtn">×</a>
               </div>
              <div class="row">
              <table>
              <tbody>
              <tr><td width="23%" align="right"><span>*</span>企业名称：</td><td><input type="text" class="row_bt1" /></td></tr>
              <tr><td align="right"><span>*</span>联系人：</td><td><input type="text" class="row_bt2" /></td></tr>
              <tr><td align="right">部门：</td><td><input type="text" class="row_bt2" /></td></tr>
              <tr><td align="right"><span>*</span>固定电话：</td><td><input type="text" class="row_bt2" /></td></tr>
              <tr><td align="right"><span>*</span>手机：</td><td><input type="text" class="row_bt2" /></td></tr>
              <tr><td align="right"><span>*</span>邮箱：</td><td><input type="text" class="row_bt1" /></td></tr>
              <tr><td></td><td><input type="submit" class="s_in03" value="确认并提交" /><!--<a href="dianpin.html"></a>--></td></tr>
              </tbody>
              </table>
            </div>
            </div>
             <div class="m_line">
              <h3>成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛</h3>
              <p class="come"><span>2014-12-22 15:52</span>    <span>作者:  <em>川川joy</em></span>    <span>分类: <em>行业一投票</em></span></p>
              </div>
              <div class="us_questin">
               <h6>用户遇到的问题和挑战：</h6>
                 <p>今年9月由重庆市城乡建设委员会、重庆市江北区人民政府、共青团重庆市委员会、中共重庆市江北区委员会、重庆市勘察设计协会等单位联合猪八戒网，悬赏41万元征集江北嘴某一高楼的裙楼的建筑方案设计。</p>
               <p>此次大赛邀请了人民日报、中国青年报等国家级新闻媒体，重庆日报、重庆电视台等市级新闻媒体，腾讯·大渝网、华龙网、搜房网等综合网络媒体作为大赛媒体支持单位。</p>
               <p>本次大赛项目选址为重庆市江北嘴CBD核心的A13地块，用地净面积29126平方米。该地块属于重庆华城富丽地产公司，定位为重庆国际金融中心IFC，涵盖办公、酒店、商业、公寓、会所等；其中的“世界花”主塔建筑高470米108层，将成为重庆第一高楼。本次竞赛仅就其裙楼商业综合体进行开放式概念设计，对商业建筑规模、建筑密度、建筑高度以及商业业态等内容均没有限制。</p>
               <p>短时间内，全国响应者众多，超低的投入带来了意想不到的方案，而且对项目也起到了很好的宣传推广作用。目前该大赛浏览量已达到4万，收到来自全球建筑师的200多份稿件。</p> 
               <h6>培训内容介绍和大纲：</h6>
               <p> 在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范一个公司中设计规范是有层次的。</p>
               <h6>行业：</h6>
               <p> 在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范一个公司中设计规范是有层次的。</p>
               <h6>其他：</h6>
               <div class="xx">
               <p class="half"> <strong>公司名称：</strong>上海金太设计公司</p>
               <p class="half"> <strong>联系人：</strong>13905689517</p>
               <p class="half"> <strong>固定电话：</strong>0551-6762967</p>
               <p class="half"> <strong>手机：</strong>13905689517</p>
               <p class="half"> <strong>邮箱：</strong>123456789@qq.com</p>
               </div>
               <div class="bot_des"><a href="#">阅读(75)</a><a href="#">回复(75)</a> <a href="#">分享到：<img src="images/share.jpg" /></a></div>
              </div>
              <div class="more_new">
              	<dl>
                	<dt><a class="left" href="#"><span>上一篇：</span>成功案例：徐圩港区海事和治安监控平台</a><a class="right" href="#"><span>下一篇：</span>成功案例：打造下一个宏村！湖北塘口万元征集乡村规划方案</a></dt>
                    <dd><a href="#">(0)</a>请投票点赞</dd>
                </dl>
              </div>
              <div class="clear"></div>
             <div class="comment">
             <div class="l_t"><img src="images/l_t.jpg" /></div>
             <div class="l_my"><textarea></textarea></div>
             <div class="l_b"><img src="images/l_b.jpg" /></div>
             <div class="right"><input type="submit" class="com_tj"  value="提交评论" /></div>
             </div>
             </div>
            <div class="clear"></div>
            <div class="intent2">
             <script src="js/jquery.tabsn.js"></script>
			<script src="js/jquery.lazyload.js"></script>
            <script type="text/javascript">
                        $(function(){
                        
                            $("img[original]").lazyload({ placeholder:"images/color3.gif" });
                            
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
                      <div class="" style="height:15px;"></div>
             <div class="p_box demo5">
             <!--<ul class="p_tab_menu" id="p_tab_menu">-->
			<ul class="p_tab_menu" id="p_tab_menu">
				<li class="current"><a href="#">查看建议</a></li>
			</ul>
			<div class="p_tab_box">
                <div>
                <div class="cpdp">
                
                <ul>
                <li class="user_dp">
                <a class="user_pic" href="#"><img src="images/dj.jpg" /></a>
                <p class="user-info"><a class="user_n" href="#">最熟悉的陌生人</a></p>
                 <div class="udescrible">
                 <p class="chxin">诚信度：<span>5</span> 分</p>
                 <p class="dpdes">房间挺大，挺干净的，性价比高，交通也很便利~附近有地中海，乐购，卜峰莲花，吃饭方便，购物方便！团了票去旁边的欢乐谷的，很近的中海，乐购，卜峰莲花，吃饭方便，购物方便！团了票去旁边的欢乐谷的，很近的</p>
                 <span class="dpdate">2014-01-15</span><a class="dpresp" href="#">回应</a>
                </div>
                </li>
                <li class="user_dp">
                <a class="user_pic" href="#"><img src="images/dj.jpg" /></a>
                <p class="user-info"><a class="user_n" href="#">最熟悉的陌生人</a></p>
                 <div class="udescrible">
                 <p class="chxin">诚信度：<span>5</span> 分</p>
                 <p class="dpdes">房间挺大，挺干净的，性价比高，交通也很便利~附近有地中海，乐购，卜峰莲花，吃饭方便，购物方便！团了票去旁边的欢乐谷的，很近的中海，乐购，卜峰莲花，吃饭方便，购物方便！团了票去旁边的欢乐谷的，很近的</p>
                 <span class="dpdate">2014-01-15</span><a class="dpresp" href="#">回应</a>
                </div>
                </li>
                <li class="user_dp">
                <a class="user_pic" href="#"><img src="images/dj.jpg" /></a>
                <p class="user-info"><a class="user_n" href="#">最熟悉的陌生人</a></p>
                 <div class="udescrible">
                 <p class="chxin">诚信度：<span>5</span> 分</p>
                 <p class="dpdes">房间挺大，挺干净的，性价比高，交通也很便利~附近有地中海，乐购，卜峰莲花，吃饭方便，购物方便！团了票去旁边的欢乐谷的，很近的中海，乐购，卜峰莲花，吃饭方便，购物方便！团了票去旁边的欢乐谷的，很近的</p>
                 <span class="dpdate">2014-01-15</span><a class="dpresp" href="#">回应</a>
                </div>
                </li>
                <li class="user_dp">
                <a class="user_pic" href="#"><img src="images/dj.jpg" /></a>
                <p class="user-info"><a class="user_n" href="#">最熟悉的陌生人</a></p>
                 <div class="udescrible">
                 <p class="chxin">诚信度：<span>5</span> 分</p>
                 <p class="dpdes">房间挺大，挺干净的，性价比高，交通也很便利~附近有地中海，乐购，卜峰莲花，吃饭方便，购物方便！团了票去旁边的欢乐谷的，很近的中海，乐购，卜峰莲花，吃饭方便，购物方便！团了票去旁边的欢乐谷的，很近的</p>
                 <span class="dpdate">2014-01-15</span><a class="dpresp" href="#">回应</a>
                </div>
                </li>
               </ul>
                </div>
                </div>
			</div>
		  </div>            
          <div class="clear"></div>
            </div>
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
    <script type="text/javascript">
	$(function ($) {
		//弹出登录
		$("#example").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '1'
			}, 1000);
		}).on('click', function () {
			$("body").append("<div id='mask'></div>");
			$("#mask").addClass("mask").fadeIn("slow");
			$("#LoginBox").fadeIn("slow");
		});
		//
		//按钮的透明度
		$("#loginbtn").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '1'
			}, 1000);
		});
		//文本框不允许为空---按钮触发
		$("#loginbtn").on('click', function () {
			var txtName = $("#txtName").val();
			var txtPwd = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$(".warning").css({ display: 'block' });
				}
				else {
					$("#warn").css({ display: 'block' });
					$("#warn2").css({ display: 'none' });
				}
			}
			else {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$("#warn").css({ display: 'none' });
					$(".warn2").css({ display: 'block' });
				}
				else {
					$(".warning").css({ display: 'none' });
				}
			}
		});
		//文本框不允许为空---单个文本触发
		$("#txtName").on('blur', function () {
			var txtName = $("#txtName").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn").css({ display: 'block' });
			}
			else {
				$("#warn").css({ display: 'none' });
			}
		});
		$("#txtName").on('focus', function () {
			$("#warn").css({ display: 'none' });
		});
		//
		$("#txtPwd").on('blur', function () {
			var txtName = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn2").css({ display: 'block' });
			}
			else {
				$("#warn2").css({ display: 'none' });
			}
		});
		$("#txtPwd").on('focus', function () {
			$("#warn2").css({ display: 'none' });
		});
		//关闭
		$(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
			$("#LoginBox").fadeOut("fast");
			$("#mask").css({ display: 'none' });
		});
	});
	</script>
</body>
</html>
