var d = document;
var safari = (navigator.userAgent.toLowerCase().indexOf('safari') != -1) ? true : false;

var gebtn = function(parEl,child) { return parEl.getElementsByTagName(child); };
onload = function() {
	var body = gebtn(d,'body')[0];
	body.className = body.className && body.className != '' ? body.className + ' has-js' : 'has-js';
	if (!d.getElementById || !d.createTextNode) {
		return;
	}
	var ls = gebtn(d,'label');
	for (var i = 0; i < ls.length; i++) {
		var l = ls[i];
		if (l.className.indexOf('label_') == -1) {
			continue;
		}
		var inp = gebtn(l,'input')[0];
		if (l.className == 'label_check') {
			//l.className = (safari && inp.checked == true || inp.checked) ? 'label_check c_on' : 'label_check c_off';
			l.className = (safari && inp.checked == true || inp.checked) ? 'label_check c_off' : 'label_check c_on';
			l.onclick = check_it;
		};
		if (l.className == 'label_radio') {
			l.className = (safari && inp.checked == true || inp.checked) ? 'label_radio r_on' : 'label_radio r_off';
			l.onclick = turn_radio;
		};
	};
};
var check_it = function() {
	var inp = gebtn(this,'input')[0];
	if (this.className == 'label_check c_off' || (!safari && inp.checked)) {
		this.className = 'label_check c_on';
		if (safari) {
			inp.click();
		};
	} else {
		this.className = 'label_check c_off';
		if (safari){ 
			inp.click();
		};
	};
};
var turn_radio = function() {
	var inp = gebtn(this,'input')[0];
	if (this.className == 'label_radio r_off' || inp.checked) {
		var ls = gebtn(this.parentNode,'label');
		for (var i = 0; i < ls.length; i++) {
			var l = ls[i];
			if (l.className.indexOf('label_radio') == -1) {
				continue;
			};
			l.className = 'label_radio r_off';
		};
		this.className = 'label_radio r_on';
		if (safari){ 
			inp.click();
		};
	} else {
		this.className = 'label_radio r_off';
		if (safari) {
			inp.click();
		};
	};
};

var g_next_load_url = '';
var g_next_callback = null;
function SubShowClass(C,i,c,l,I){var V=this,v=V;V.parentObj=V.$(C);if(V.parentObj==null&&C!="none"){throw new Error("SubShowClass(ID)参数错误:ID 对像不存在!(value:"+C+")")};V.lock=false;V.label=[];V.defaultID=c==null?0:c;V.selectedIndex=V.defaultID;V.openClassName=l==null?"selected":l;V.closeClassName=I==null?"":I;V.mouseIn=false;var O=function(){v.mouseIn=true},o=function(){v.mouseIn=false};if(C!="none"&&C!=""){if(V.parentObj.attachEvent){V.parentObj.attachEvent("onmouseover",O)}else{V.parentObj.addEventListener("mouseover",O,false)}};if(C!="none"&&C!=""){if(V.parentObj.attachEvent){V.parentObj.attachEvent("onmouseout",o)}else{V.parentObj.addEventListener("mouseout",o,false)}};if(typeof(i)!="string"){i="onmousedown"};i=i.toLowerCase();switch(i){case "onmouseover":V.eventType="mouseover";break;case "onmouseout":V.eventType="mouseout";break;case "onclick":V.eventType="click";break;case "onmouseup":V.eventType="mouseup";break;default:V.eventType="mousedown"};V.autoPlay=false;V.autoPlayTimeObj=null;V.spaceTime=5000};SubShowClass.prototype={version:"1.31",author:"mengjia",_setClassName:function(l,I){var o=this,i;i=l.className;if(i){i=i.replace(o.openClassName,"");i=i.replace(o.closeClassName,"");i+=" "+(I=="open"?o.openClassName:o.closeClassName)}else{i=(I=="open"?o.openClassName:o.closeClassName)};l.className=i},addLabel:function(labelID,contID,parentBg,springEvent,blurEvent){var t=this,labelObj=this.$(labelID),contObj=this.$(contID);if(labelObj==null&&labelID!="none"){throw new Error("addLabel(labelID)参数错误:labelID 对像不存在!(value:"+labelID+")")};var TempID=this.label.length;if(parentBg==""){parentBg=null};this.label.push([labelID,contID,parentBg,springEvent,blurEvent]);var tempFunc=function(){t.select(TempID)};if(labelID!="none"){if(labelObj.attachEvent){labelObj.attachEvent("on"+this.eventType,tempFunc)}else{labelObj.addEventListener(this.eventType,tempFunc,false)}};if(TempID==this.defaultID){if(labelID!="none"){this._setClassName(labelObj,"open")};if(this.$(contID)){contObj.style.display=""};if(this.ID!="none"){if(parentBg!=null){this.parentObj.style.background=parentBg}};if(springEvent!=null){eval(springEvent)}}else{if(labelID!="none"){this._setClassName(labelObj,"close")};if(contObj){contObj.style.display="none"}};var mouseInFunc=function(){t.mouseIn=true},mouseOutFunc=function(){t.mouseIn=false};if(contObj){if(contObj.attachEvent){contObj.attachEvent("onmouseover",mouseInFunc)}else{contObj.addEventListener("mouseover",mouseInFunc,false)};if(contObj.attachEvent){contObj.attachEvent("onmouseout",mouseOutFunc)}else{contObj.addEventListener("mouseout",mouseOutFunc,false)}}},select:function(num,force){if(typeof(num)!="number"){throw new Error("select(num)参数错误:num 不是 number 类型!(value:"+num+")")};if(force!=true&&this.selectedIndex==num){return};var i;for(i=0;i<this.label.length;i++){if(i==num){if(this.label[i][0]!="none"){this._setClassName(this.$(this.label[i][0]),"open")};if(this.$(this.label[i][1])){this.$(this.label[i][1]).style.display=""};if(this.ID!="none"){if(this.label[i][2]!=null){this.parentObj.style.background=this.label[i][2]}};if(this.label[i][3]!=null){eval(this.label[i][3])}}else if(this.selectedIndex==i||force==true){if(this.label[i][0]!="none"){this._setClassName(this.$(this.label[i][0]),"close")};if(this.$(this.label[i][1])){this.$(this.label[i][1]).style.display="none"};if(this.label[i][4]!=null){eval(this.label[i][4])}}};this.selectedIndex=num},random:function(){var O=this;if(arguments.length!=O.label.length){throw new Error("random()参数错误:参数数量与标签数量不符!(length:"+arguments.length+")")};var l=0,o;for(o=0;o<arguments.length;o++){l+=arguments[o]};var I=Math.random(),i=0;for(o=0;o<arguments.length;o++){i+=arguments[o]/l;if(I<i){O.select(o);break}}},order:function(){var O=this;if(arguments.length!=O.label.length){throw new Error("order()参数错误:参数数量与标签数量不符!(length:"+arguments.length+")")};if(!(/^\d+$/).test(SubShowClass.sum)){return};var i=0,o;for(o=0;o<arguments.length;o++){i+=arguments[o]};var I=SubShowClass.sum%i;if(I==0){I=i};var l=0;for(o=0;o<arguments.length;o++){l+=arguments[o];if(l>=I){O.select(o);break}}},play:function(spTime){var t=this;if(typeof(spTime)=="number"){this.spaceTime=spTime};clearInterval(this.autoPlayTimeObj);this.autoPlayTimeObj=setInterval(function(){t.autoPlayFunc()},this.spaceTime);this.autoPlay=true},autoPlayFunc:function(){var i=this;if(i.autoPlay==false||i.mouseIn==true){return};i.nextLabel()},nextLabel:function(){var t=this,index=this.selectedIndex;index++;if(index>=this.label.length){index=0};this.select(index);if(this.autoPlay==true){clearInterval(this.autoPlayTimeObj);this.autoPlayTimeObj=setInterval(function(){t.autoPlayFunc()},this.spaceTime)}},previousLabel:function(){var t=this,index=this.selectedIndex;index--;if(index<0){index=this.label.length-1};this.select(index);if(this.autoPlay==true){clearInterval(this.autoPlayTimeObj);this.autoPlayTimeObj=setInterval(function(){t.autoPlayFunc()},this.spaceTime)}},stop:function(){var i=this;clearInterval(i.autoPlayTimeObj);i.autoPlay=false},$:function(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}}};SubShowClass.readCookie=function(O){var o="",l=O+"=";if(document.cookie.length>0){var i=document.cookie.indexOf(l);if(i!=-1){i+=l.length;var I=document.cookie.indexOf(";",i);if(I==-1)I=document.cookie.length;o=unescape(document.cookie.substring(i,I))}};return o};SubShowClass.writeCookie=function(i,l,o,c){var O="",I="";if(o!=null){O=new Date((new Date).getTime()+o*3600000);O="; expires="+O.toGMTString()};if(c!=null){I=";domain="+c};document.cookie=i+"="+escape(l)+O+I};SubShowClass.sum=SubShowClass.readCookie("SSCSum");if((/^\d+$/).test(SubShowClass.sum)){SubShowClass.sum++}else{SubShowClass.sum=1};SubShowClass.writeCookie("SSCSum",SubShowClass.sum,12);

function getDateStart() {
	var startdate = $("#start_date").val();
	var starthour = $("#start_hour").val();
	var startminute = $("#start_minute").val();
	var start = startdate.replace(new RegExp('-', 'g'),'')  + starthour+startminute;
	return start;
}

function getDateEnd() {
	var enddate = $("#end_date").val();
	var endhour = $("#end_hour").val();
	var endminute = $("#end_minute").val();
	var end = enddate.replace(new RegExp('-', 'g'),'') + endhour + endminute;
	return end;
}
function btnCallbackNew(data) {
    if( data.msg != undefined ) {
		if (data.title != undefined && data.title)
			showMessage(data.msg,data.title);
		else
			showMessage(data.msg);
		return;
    }
    if (data.err != undefined)
    {
    	ferror(data.err,data.title);
    }
}
function btnCallbackRefresh(data) {
    if( data.msg != undefined ) {
    	if (data.title != undefined && data.title)
			ferror(data.msg,data.title);
		else
			ferror(data.msg);
		setTimeout("window.location.reload();",2000);
		return;
    }
    if (data.err != undefined)
    	ferror(data.err);
}
function btnCallbackHref(data) {
	if( data.msg != undefined )
	{
		if (data.title != undefined && data.title)
			ferror(data.msg,data.title);
		else
			ferror(data.msg);
		setTimeout("window.location.href = g_next_load_url;",2000);
		return;
    }
    if (data.err != undefined)
    	ferror(data.err);
}
function fajax(url,params,callback,ifcache) {
    jQuery.ajaxSetup({
        cache: ifcache
    });
    jQuery.ajax({
        type: "POST",
        url: url,
        data: params,
        cache: false,
        dataType: 'json',
        success: callback
    });
}
function fget(url,params,refresh)
{
	if (refresh === true)
		fajax(url,params,btnCallbackRefresh);
	else if (typeof refresh=='function')
	{
		fajax(url,params,refresh);
	}
	else if (typeof refresh=='string' && refresh.length>0)
	{
		g_next_load_url = refresh;
		fajax(url,params,btnCallbackHref);
	}
	else
	{
		fajax(url,params,btnCallbackNew);
	}
}
function fpost(form_id,refresh)
{
	$(this).attr('disabled','false');
	var data = $('#'+form_id).serialize();
	var url = $('#'+form_id).attr('action');
	if (refresh === true)
		fajax(url,data,btnCallbackRefresh);
	else if (typeof refresh=='function')
	{
		fajax(url,data,refresh);
	}
	else if (typeof refresh=='string' && refresh.length>0)
	{
		g_next_load_url = refresh;
		fajax(url,data,btnCallbackHref);
	}
	else
	{
		fajax(url,data,btnCallbackNew);
	}
}
function fpost2(data,url,refresh)
{
	if (refresh === true)
		fajax(url,data,btnCallbackRefresh);
	else if (typeof refresh=='function')
	{
		fajax(url,data,refresh);
	}
	else if (typeof refresh=='string' && refresh.length>0)
	{
		g_next_load_url = refresh;
		fajax(url,data,btnCallbackHref);
	}
	else
	{
		fajax(url,data,btnCallbackNew);
	}
}

var index;
function movein(value,rowIndex){
	var obj = $("td[name='name']").get(rowIndex);
	index = layer.tips('<font color="#000000">'+value+'</font>', obj, {
	  tips: [2, 'white']
	});
}

function moveout(){
	layer.close(index);
}

function  whichResource(type){
	switch(type){
			case 1:
			return "music";
			break;
			case 2:
			return "dance";
			break;
			case 3:
			return "video";
			break;
			case 4:
			return "document";
			break;
			case 5:
			return "language";
			break;
			case 6:
			return "village";
			break;
			case 7:
			return "policy";
			break;
			case 8:
			return "sports";
			break;
			case 9:
			return "art";
			break;
			case 10:
			return "society";
			break;
			case 11:
			return "attachment";
			break;
	}
};

$(document).ready(function(){
	$('#resurl-up').click(function(){
        $('#file0').click();
    });
});

function importimg(id) {
	
	var formData = new FormData();
	var file = $("#file"+id).val();
	formData.append("file",document.getElementById('file'+id).files[0]);
    var index=layer.load(1, {shade: [0.5,'#000']});
     $.ajax({
       url:"picture/upload",//后台的接口地址
       type:"post",//post请求方式
       data:formData,//参数	
       cache: false,
       processData: false,
       contentType: false,
       success:function(data) {
      	   layer.close(index);
           layer.msg('上传成功', {icon: 1});
           if(id==0){
	           $("#resurl").val(data.url);
	           $("#resurl-up").val(data.name);
           }else if(id==1){
	           $("#lrcurl-value").val(data.url);
	           $("#lrcurl-up").val(data.name);
           }
           
       },error:function (data) {
  	       layer.close(index);
           layer.msg('上传失败', {icon: 1});
       }
   })
}


