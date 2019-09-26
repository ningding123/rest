<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top-menu.jsp"></jsp:include>
<jsp:include page="left-menu.jsp"/>

<div class="tpl-content-wrapper">
	<ol class="am-breadcrumb">
		<li><a href="index" class="am-icon-home">首页</a>
		</li>
		<li><a href="javascript:void(0)">送检单管理</a>
		</li>
		<li class="am-active">送检单新增</li>
	</ol>
	<div class="tpl-portlet-components">
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span>送检单新增
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
					<form  id="art_insert_form" class="am-form am-form-horizontal" action="order/insert" method="post">
						<div class="am-form-group">
							<label  class="am-u-sm-3 am-form-label">送检单编号</label>
							<div class="am-u-sm-9">
								<input type="text" placeholder="请输入送检单编号" name="ordernumber" required>
							</div>
						</div>
						<input type="hidden" name="amId">
						<div class="am-form-group">
							<label  class="am-u-sm-3 am-form-label">就诊学生</label>
							<div class="am-u-sm-9">
								<select name="stuid" data-am-selected="{searchBox: 1,btnWidth:'100.5%'}">
									<c:forEach items="${student}" var="student">
											<option value="${student.id}"> ${student.name} </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="am-form-group">
							<label class="am-u-sm-3 am-form-label">就诊医生</label>
							<div class="am-u-sm-9">
								<select name="docid" data-am-selected="{searchBox: 1,btnWidth:'100.5%'}">
									<c:forEach items="${admin}" var="admin">
										<option value="${admin.amId}"> ${admin.amName} </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="am-form-group">
							<label  class="am-u-sm-3 am-form-label">就诊地点</label>
							<div class="am-u-sm-9">
								<input type="text" name="address"  placeholder="请输入就诊地点">
							</div>
						</div>
						<div class="am-form-group">
							<label class="am-u-sm-3 am-form-label">产生原因</label>
							<div class="am-u-sm-9">
								<textarea name="cause" style="width: 650px;height:200px"></textarea>
							</div>
						</div>
						<div class="am-form-group">
							<label class="am-u-sm-3 am-form-label">病情描述</label>
							<div class="am-u-sm-9">
								<textarea name="studesc" style="width: 650px;height:200px"></textarea>
							</div>
						</div>
						<div class="am-form-group">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<button type="button" onclick="checkphone()" class="am-btn am-btn-primary" id="edit">生成看病单</button>
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
	function checkphone(){
			var index=layer.load(1, {shade: [0.5,'#000']});
			/**
			 *验证 return fasle;
			 */
			fpost("art_insert_form",function(data){
				if(data.status=="succ"){
					layer.close(index);
					layer.confirm("看病单已生成!", {
						icon: 1,
						skin: 'layui-layer-lan',
						btn: ['确定'] //按钮
					}, function(){

						window.location.href="order/list";

					});
				}else{
					layer.close(index);
					layer.msg("生成失败");
				}
			});
	}
</script>