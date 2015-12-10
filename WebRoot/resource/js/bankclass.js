
/*
    函数名称: Scroll
    Scroll(obj, h, s)
    参数说明:
        obj,[object]  id值或对象.     必需
          h,[height]  展开后的高度.   可选(默认为200px)
          s,[speed]   展开速度,值越小展开速度越慢. 可选(默认为1.2){建议取值为1.1到2.0之间[例如:1.17]}.
    函数返回值:
        true    展开(对象的高度等于展开后的高度)
        false   关闭(对象的高度等于原始高度)
*/
function Scroll(obj, h, s){
    if(obj == undefined){return false;}
    var h = h || 0;
    var s = s || 1.2;
    var obj = typeof(obj)=="string"?document.getElementById(obj):obj;
    var status = obj.getAttribute("status")==null;
    var oh = parseInt(obj.offsetHeight);
    obj.style.height = oh;
    obj.style.display = "block";
    obj.style.overflow = "hidden";
    if(obj.getAttribute("oldHeight") == null){
        obj.setAttribute("oldHeight", oh);
    }else{
        var oldH = Math.ceil(obj.getAttribute("oldHeight"));
    }
    var reSet = function(){
        if(status){
            if(oh < h){
                oh = Math.ceil(h-(h-oh)/s);
                obj.style.height = oh+"px";
            }else{
                obj.setAttribute("status",false);
                window.clearInterval(IntervalId);
            }
        }else{
            obj.style.height = oldH+"px";
            obj.removeAttribute("status");
            window.clearInterval(IntervalId);
        }
    }
    var IntervalId = window.setInterval(reSet,10);
 return status;
}
window.onload= function(){
    document.getElementById('bankclass').onclick = function(){
        Scroll('bankclass');
    }
}