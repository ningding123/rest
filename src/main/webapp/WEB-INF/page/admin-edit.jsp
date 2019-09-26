<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top-menu.jsp"></jsp:include>
<jsp:include page="left-menu.jsp"/>

	<div class="tpl-content-wrapper">
		<ol class="am-breadcrumb">
			<li><a href="index" class="am-icon-home">首页</a>
			</li>
			<li><a href="javascript:void(0)">用户管理</a>
			</li>
			<li class="am-active">用户编辑</li>
		</ol>
		<div class="tpl-portlet-components">
			<div class="portlet-title">
				<div class="caption font-green bold">
					<span class="am-icon-code"></span> 用户编辑
				</div>
				<div class="tpl-portlet-input tpl-fz-ml">
					<div class="portlet-input input-small input-inline">
						<div class="input-icon right">
						</div>
					</div>
				</div>


			</div>
			<div class="tpl-block ">

				<div class="am-g tpl-amazeui-form">


					<div class="am-u-sm-12 am-u-md-9">
						<form  id="art_insert_form" class="am-form am-form-horizontal" action="admin/saveUpdate" method="post">
						
						<div class="am-form-group">
								<label for="agId" class="am-u-sm-3 am-form-label">权限分配</label>
								<div class="am-u-sm-9">
									<select name="agId" data-am-selected="{searchBox:1}" id="agId">
										<c:forEach items="${groups }" var="group">
											<c:choose>
												<c:when test="${account.agId==group.agId}">
													<option value=${group.agId } selected="selected">${group.agName}</option>
												</c:when>
												<c:otherwise>
													<option value=${group.agId }>${group.agName }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							<input type="hidden" name="amId" value="${account.amId}">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">登录名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" placeholder="登录名 / LoginName" name="uLoginname" value="${account.uLoginname}" required><div class="user"></div>
									
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">密码</label>
								<div class="am-u-sm-9">
									<input type="password" id="user-password" placeholder="密码/Password" name="uPassword" required>
									<div id="password"></div>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">用户名</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" placeholder="姓名 / Name" name="amName" value="${account.amName}" required>
								
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">电话</label>
								<div class="am-u-sm-9">
									<input type="tel" id="user-phone"
										placeholder="输入你的电话号码 / Telephone"	 name="mobile" value="${account.mobile}" required>
											<div id="phone"></div>
								</div>
							
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">科室</label>
								<div class="am-u-sm-9">
									<input type="text"  placeholder="科室 / Unit" name="unit"  value="${account.unit}" required>

								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">职务</label>
								<div class="am-u-sm-9">
									<input type="text" placeholder="职务 / Job" name="job" value="${account.job}"  required>

								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">单位</label>
								<div class="am-u-sm-9">
									<select  name="type">
										<option value=1 <c:if test="${account.type == 1}"> check="check"</c:if>>校医院</option>
										<option value=2 <c:if test="${account.type == 2}"> check="check"</c:if>>成都分院</option>
									</select>
								</div>
							</div>

							
							
						<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<button type="button" onclick="checkphone()" class="am-btn am-btn-primary" id="edit">保存修改</button>
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
$(function(){
	$("#user-phone").blur(function(){
		   var phone = document.getElementById("user-phone").value;
		   var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/;  
		   if (phoneReg.test(phone)) {   
		   $("#phone").html("");
		   } else { 
		   	 $("#phone").html("<small>手机号格式错误</small>"); 
		   }  	
		});
	$("#user-name").blur(function(){		
		var params ={};
		params.uLoginname=$(this).val()
		$(".user").html(" ");
		if(${account.uLoginname}!=$(this).val())
		$.ajax({
			url : "admin/checkuLoginaccount",
			data : JSON.stringify(params),
			contentType : "application/json;charset=UTF-8",//发送数据的格式
			type : "post",
			dataType : "json",//回调
			success : function(data){
				if(data.flag){
					$("#edit").attr("disabled","true");
					$(".user").html("<small style='color:red'>用户名已存在</small>");
				}else{
					$("#edit").removeAttr("disabled");
					$(".user").html("<small style='color:green'>用户名可用</small>");
				}
				
			}
			
		});
	});
	
	
	$("#user-password").blur(function(){
		var password = document.getElementById("user-password").value;
		if(password.length<6)
		 $("#password").html("<small style='color:red'>密码长度应大于6位</small>");
		else
		{
		var reg = /^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])).*$/;  
		
		if(reg.test(password))
		{
			 $("#password").html("");
		}
		else{

		 	$("#password").html("<small style='color:red'>密码格式应包括数字，特殊字符，大小写 </small>");
		}
		}
		
		});
		

});

function checkphone(){
	var password = document.getElementById("user-password").value;
	var reg = /^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])).*$/;  
	var flag = reg.test(password);
	if(flag==false)
	{
		 $("#password").html("<small style='color:red'>密码格式应包括数字，特殊字符，大小写</small>");
	}
	else{
	 $("#password").html(" ");
	}
	   var phone = document.getElementById("user-phone").value;
	   var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/;  
	   if (phoneReg.test(phone)) {  
	    $("#phone").html(""); 
	   } else {
	   	flag = false; 
	    $("#phone").html("<small style='color:red'>手机号格式错误</small>"); 
	   }  
	if(flag==false)
		return false;
	else{
		var index=layer.load(1, {shade: [0.5,'#000']});
		/**
		*验证 return fasle;
		*/
		fpost("art_insert_form",function(data){
			if(data.status=="succ"){
				layer.close(index);
				layer.confirm("修改成功!", {
					  icon: 1,
					  skin: 'layui-layer-lan',
					  btn: ['确定'] //按钮
					}, function(){
	
					  window.location.href="admin/list";
					 
					});
			}else{
				layer.close(index);
				layer.msg("修改失败");
			}
		});
	}
	
}
</script>