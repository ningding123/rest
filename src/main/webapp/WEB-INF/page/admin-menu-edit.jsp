<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="top-menu.jsp" />
<jsp:include page="left-menu.jsp" />
<div class="tpl-content-wrapper">
	<ol class="am-breadcrumb">
		<li><a href="index" class="am-icon-home">首页</a>
		</li>
		<li><a href="javascript:void(0)">系统管理</a>
		</li>
		<li class="am-active"><c:if test='${menuinfo.auId==NULL }'>添加模块</c:if>
				<c:if test='${menuinfo.auId>0 }'>修改模块</c:if></li>
	</ol>
	<div class="tpl-portlet-components">
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span>
				<c:if test='${menuinfo.auId==NULL }'>添加模块</c:if>
				<c:if test='${menuinfo.auId>0 }'>修改模块</c:if>
			</div>
		</div>
		<div class="tpl-block ">
			<div class="am-g tpl-amazeui-form">
				<div class="am-u-sm-12 am-u-md-9">
					<form method="post" action="menu/edit_handle" class="am-form am-form-horizontal" id="amdin_menu_form"  data-am-validator >
						<c:choose>
							<c:when test="${menuinfo.auId>0 }"><input type="hidden" name="auId" id="au_id" value="${menuinfo.auId }"></c:when>
							<c:otherwise> <input type="hidden" name="auId" id="au_id" value="0"> </c:otherwise>
						</c:choose>
						<div class="am-form-group">
							<label for="au_title" class="am-u-sm-3 am-form-label">标题 </label>
							<div class="am-u-sm-9">
								<input required name="auTitle" id="au_title" type="text" value="${menuinfo.auTitle }" placeholder="请输入标题">
								<small>输入模块标题，左侧菜单显示信息。</small>
							</div>
						</div>
						<div class="am-form-group">
							<label for="au_name" class="am-u-sm-3 am-form-label">字段名</label>
							<div class="am-u-sm-9">
								<input required name="auName" id="au_name" type="text" value="${menuinfo.auName }" placeholder="输入字段名 "> 
								<small>模块点击跳转请求的路径。</small>
							</div>
						</div>
						<div class="am-form-group">
							<label for="au_info" class="am-u-sm-3 am-form-label">功能描述</label>
							<div class="am-u-sm-9">
								<input name="auInfo" id="au_info" type="text" value="${menuinfo.auInfo }" placeholder="请输入功能描述" >
								<small>用来进行相应的选中样式的匹配。</small>
							</div>
						</div>
						<div class="am-form-group">
							<label for="au_level" class="am-u-sm-3 am-form-label">级别</label>
							<div class="am-u-sm-9">
								<select id="au_level" onchange="onChangeLevel(this.value);" name="auLevel">
							        <option value="">请选择级别</option>
							        <option value=1 <c:if test="${menuinfo.auLevel==1 }">selected</c:if>>一级菜单</option>
							        <option value=2 <c:if test="${menuinfo.auLevel==2 }">selected</c:if>>二级菜单</option>
							    </select>
							</div>
						</div>
						<div class="am-form-group">
							<label for="auPid" class="am-u-sm-3 am-form-label">父菜单项</label>
							<div class="am-u-sm-9">
								<input type="hidden" id="au_pid_hidden" value="${menuinfo.auPid }"/>
								<select name=auPid id="au_pid">
							        <option value="0">无上级菜单</option>
							    </select>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-weibo" class="am-u-sm-3 am-form-label">点击是否有效</label>
							<div class="am-u-sm-9">
								<div class="tpl-switch">
                                    <input type="checkbox" <c:if test="${menuinfo.auClickable==1 }">checked</c:if> value="1" name="auClickable" id="au_clickable" class="ios-switch bigswitch tpl-switch-btn"/>
                                    <div class="tpl-switch-btn-view">
                                        <div></div>
                                    </div>
                                </div>
							</div>
						</div>
						<div class="am-form-group">
							<label for="au_sort" class="am-u-sm-3 am-form-label">模块排序</label>
							<div class="am-u-sm-9">
								<input type="number" value="${menuinfo.auSort }"  name="auSort" id="au_sort"  required placeholder="请输入模块排序"/>
								<small>大的数排在前。</small>
							</div>
						</div>
						<div class="am-form-group">
							<label for="au_class" class="am-u-sm-3 am-form-label">模块图片样式</label>
							<div class="am-u-sm-9">
								<input type="text"  value="${menuinfo.auClass }"  name="auClass" id="au_class"  required placeholder="请输入模块图片样式"/>
								<i class="${menuinfo.auClass }"></i>
							</div>
						</div>
						<div class="am-form-group">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<button onclick="edit_handle();" type="button" class="am-btn am-btn-primary">提交信息</button>
								<button onclick="history.go(-1);" type="button" class="am-btn am-btn-primary">返回上级</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer-menu.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	if($("#au_level").val()==2){
		onChangeLevel(2);
	}
});
function edit_handle(){
	var index=layer.load(1, {shade: [0.5,'#000']});
	/**
	*验证 return fasle;
	*/
	/* if($("#au_level").val()==2){
		if($("#au_clickable").attr("checked")==false || $("#au_clickable").attr("checked")!="checked"){
			layer.msg("级别为2，该模块必须可点击！");
			return false;
		}
		if($("#au_pid").val()==0){
			layer.msg("级别为2，父菜单项不能为空！");
			return false;
		}	
	} */
	fpost("amdin_menu_form",function(data){
		if(data.status=="succ"){
			layer.close(index);
			window.location.href="menu/list";
		}else{
			layer.msg("模块处理失败");
		}
	});
}

function onChangeLevel(level){
	if (level>1){
		var url = "menu/getMenuList";//get
		/*var data={};
		data["type"]=1;
		data["id"]=2;    post  */
		fajax(url,null,parentList);
	}else{
		var select_root=document.getElementById('au_pid');
		select_root.options.length=0;
		select_root.options.add(new Option('无上级菜单',0));
	}
}
function parentList(data){
	var select_root=document.getElementById('au_pid');
	select_root.options.length=0;
	select_root.options.add(new Option('无上级菜单',0));
	if (data.msg == 'succ'){
    	var list = data.data;
		for(var i=0;i<list.length;i++){
			var xValue= list[i].auId;
			var xText=list[i].auTitle;
			var option=new Option(xText,xValue);
			select_root.options.add(option);
		}
	}
	$("#au_pid").val($("#au_pid_hidden").val());
}
</script>
