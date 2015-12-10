
/*
    ��������: Scroll
    Scroll(obj, h, s)
    ����˵��:
        obj,[object]  idֵ�����.     ����
          h,[height]  չ����ĸ߶�.   ��ѡ(Ĭ��Ϊ200px)
          s,[speed]   չ���ٶ�,ֵԽСչ���ٶ�Խ��. ��ѡ(Ĭ��Ϊ1.2){����ȡֵΪ1.1��2.0֮��[����:1.17]}.
    ��������ֵ:
        true    չ��(����ĸ߶ȵ���չ����ĸ߶�)
        false   �ر�(����ĸ߶ȵ���ԭʼ�߶�)
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