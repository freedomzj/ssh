<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设计师-内页</title>
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
            	<div class="logo left"><a href="index.html"><img src="images/logo.jpg" width="217" height="220"/></a></div>
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
            <li><a href="sjshi_zong.html">业务门类1</a></li>
            <li><a href="sjshi_zong.html">业务门类2</a></li>
            <li><a href="sjshi_zong.html">业务门类3</a></li>
            <li><a href="sjshi_zong.html">业务门类4</a></li>
            <li><a href="sjshi_zong.html">业务门类5</a></li>
            <li><a href="sjshi_zong.html">业务门类6</a></li>
            <li><a href="sjshi_zong.html">业务门类7</a></li>
            <li><a href="sjshi_zong.html">业务门类8</a></li>
            <li><a href="sjshi_zong.html">业务门类9</a></li>
            <li><a href="sjshi_zong.html">业务门类10</a></li>
            <li><a href="sjshi_zong.html">业务门类11</a></li>
            <li><a href="sjshi_zong.html">业务门类12</a></li>
            <li><a href="sjshi_zong.html">业务门类13</a></li>
            <li><a href="sjshi_zong.html">业务门类14</a></li>
            <li><a href="sjshi_zong.html">业务门类15</a></li>
            <li><a href="sjshi_zong.html">业务门类16</a></li>
            <li><a href="sjshi_zong.html">业务门类17</a></li>
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
        <li class="tjcp">
        <a class="tjpic"><img src="images/tj1.jpg" /></a>
        <p><a href="#">日上免税行</a></p>
        <p><strong>圣梦亲体肤生......</strong></p>
        </li>
        <li class="tjcp">
        <a class="tjpic"><img src="images/tj2.jpg" /></a>
        <p><a href="#">日上免税行</a></p>
        <p><strong>圣梦亲体肤生......</strong></p>
        </li>
        <li class="tjcp">
        <a class="tjpic"><img src="images/tj3.jpg" /></a>
        <p><a href="#">日上免税行</a></p>
        <p><strong>圣梦亲体肤生......</strong></p>
        </li>
        <li class="tjcp">
        <a class="tjpic"><img src="images/tj4.jpg" /></a>
        <p><a href="#">日上免税行</a></p>
        <p><strong>圣梦亲体肤生......</strong></p>
        </li>
        </div>
        </div>
        </div>
        <div class="cont_right">
        <div class="quick"><a href="index.html"><img src="images/home.png" />首页</a> > <a href="#">业务能人</a> > <span>韩月</span></div>
        	<div class="in_tentA">
            <div class="in_tentAleft left"><img src="images/tp1.jpg" width="260" height="205"/></div>
            <div class="in_tentAright right">
           <img src="images/p2.jpg" class="desiger" />
            <h2>主题</h2>
            <script type="text/javascript">
			$(function () {
				$('.pic2').each(function () {
					var distance = 10;
					var time = 250;
					var hideDelay = 500;
			
					var hideDelayTimer = null;
			
					var beingShown = false;
					var shown = false;
					var trigger = $('.trigger', this);
					var info = $('.popup', this).css('opacity', 0);
			
			
					$([trigger.get(0), info.get(0)]).mouseover(function () {
						if (hideDelayTimer) clearTimeout(hideDelayTimer);
						if (beingShown || shown) {
							// don't trigger the animation again
							return;
						} else {
							// reset position of info box
							beingShown = true;
			
							info.css({
								top: 35,
								left: 80,
								display: 'block'
							}).animate({
								top: '-=' + distance + 'px',
								opacity: 1
							}, time, 'swing', function() {
								beingShown = false;
								shown = true;
							});
						}
			
						return false;
					}).mouseout(function () {
						if (hideDelayTimer) clearTimeout(hideDelayTimer);
						hideDelayTimer = setTimeout(function () {
							hideDelayTimer = null;
							info.animate({
								top: '-=' + distance + 'px',
								opacity: 0
							}, time, 'swing', function () {
								shown = false;
								info.css('display', 'none');
							});
			
						}, hideDelay);
			
						return false;
					});
				});
			});
</script>
            <div class="ggdes">
            <p>联系人：韩先生</p>
            <p>电话: 15902154587</p>
            <p><span>邮箱：<b>sheji@163.com </b></span></p>
           </div>
             
            <div class="dpin">
            <a id="example" class="dpbt left">我要点评</a><a href="##" class="setadd">加入收藏</a><a href="#" class="dshare"><img src="images/share.png" />点击邮件联系</a> <a href="#" class="dshare"><img src="images/qq.png" />点击QQ联系</a></div>
            </div>
            <div class="clear"></div> 
             <div class="m_line"></div>
             <a href="##" class="look_more">查看更多内容</a>
             </div>
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
              <tr><td></td><td><input type="submit" class="s_in03" value="确认并提交" onclick="" /><!--<a href="dianpin.html"></a>--></td></tr>
              </tbody>
              </table>
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
                      <!--<script type="text/javascript">
						var mt = 0;
						window.onload = function () {
							var mydiv = document.getElementById("p_tab_menu");
							var mt = mydiv.offsetTop;
							window.onscroll = function () {
								var t = document.documentElement.scrollTop || document.body.scrollTop;
								if (t > mt) {
									mydiv.style.position = "fixed";
									mydiv.style.margin = "0";
									mydiv.style.top = "0";
								}
								else {
									mydiv.style.margin = "0px 0";
									mydiv.style.position = "static";
								}
							}
						}
						
					</script>-->
             <div class="p_box demo5">
             <!--<ul class="p_tab_menu" id="p_tab_menu">-->
			<ul class="p_tab_menu" id="p_tab_menu">
				<li class="current"><a href="#">详情介绍</a></li>
				<li><a href="#">查看点评</a></li>
				<li><a href="#">业务能人介绍</a></li> 
			</ul>
			<div class="p_tab_box">
				<div>
                <div class="cpdex">
               <h2>工作中的挑战，成功经验共享</h2>
                 <p>低密度的小区，有别墅和花园洋房两种，先卖的是花园洋房，得房率有88%周边都是别墅区，开车10分钟能到莘庄，公交比较少，有车的话，这个小区很适合.在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范。</p>
        		<h2>业务专长</h2>
                 <p>低密度的小区，有别墅和花园洋房两种，先卖的是花园洋房，得房率有88%周边都是别墅区，开车10分钟能到莘庄，公交比较少，有车的话，这个小区很适合.在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范。</p>
                <h2>熟悉的产品和市场</h2>
                  <p><span>99 </span>元</p>	
                  <h2>合作方式 </h2>
                  <p>线上</p>	
                  <h2>行业</h2>
                  <p>行业1 </p>	
                   <h2>工作部门</h2>
                  <p>部门1</p>
                  <h2>其他 </h2>
                  <p>低密度的小区，有别墅和花园洋房两种，先卖的是花园洋房，得房率有88%周边都是别墅区，开车10分钟能到莘庄，公交比较少，有车的话，这个小区很适合.在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范。</p>
                </div>
                <div class="" style="height:30px;"></div>
                </div>
                <div class="hide">
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
                <div class="hide">设计师介绍内容如下：</div>
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

