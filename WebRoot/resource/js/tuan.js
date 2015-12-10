$(document).ready(function() {
	/*基础样式*/
	$("#nav li:first-child").css("","");
	$("#nav li:last-child a").css({"":"","width":"118px"});
	$("#project ul.hd li:last-child").css("background","none");
	$(".xmzx_lb ul li:nth-child(3n)").css("margin-right","0");
	
	
	/*公司团队*/
	$(".gltd li").each(function(index, element) {
		var _gltd = $(this);
        _gltd.click(function(){
			if($(this).find("span").hasClass("on")){
				$(this).find("span").removeClass("on");
				_gltd.css("height","90px");
			}else{
				$(this).find("span").addClass("on");
				_gltd.css("height","auto");
				_gltd.siblings("li").css("height","90px");
				_gltd.siblings("li").find("span").removeClass("on");
			};
		});
    });
	
	
	/*项目弹窗*/
	$("#mask,#xmdt").css("opacity",0);
	
	$("#xmny_l .bd").click(function(){
		$("#mask,#xmdt").css("display","block").animate({opacity:1},500);
		$("#xmdt .hd").html($(this).html());
		$("#xmdt .hd li").css("width","878px");
    });
	
	$(".close").click(function(){
		$("#mask,#xmdt").animate({opacity:0},500,function(){
			$(this).css("display","none");
		});
	});
	
});