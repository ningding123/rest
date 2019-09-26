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
		<li class="am-active">送检单更新</li>
	</ol>
	<div class="tpl-portlet-components">
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span>送检单更新
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
					<form  id="art_insert_form" class="am-form am-form-horizontal" action="returnorder/insert" method="post">
						<input type="hidden" value="${returnorder.id}" id="returnorder" name="id">
						<input type="hidden" value="${order.id}" name="oid">
						<div class="am-form-group">
							<label  class="am-u-sm-3 am-form-label">送检单编号</label>
							<div class="am-u-sm-9">
								<input type="text" placeholder="请输入送检单编号" value="${order.ordernumber}" name="ordernumber" readonly>
							</div>
						</div>
						<input type="hidden" name="amId">
						<div class="am-form-group">
							<label  class="am-u-sm-3 am-form-label">就诊学生</label>
							<div class="am-u-sm-9">
								<input type="text" value="${student.name}" name="ordernumber" readonly>
							</div>
						</div>
						<div class="am-form-group">
							<label class="am-u-sm-3 am-form-label">就诊医生</label>
							<div class="am-u-sm-9">
								<input type="text" value="${adminaccount.amName}" name="ordernumber" readonly>
							</div>
						</div>
						<div class="am-form-group">
							<label  class="am-u-sm-3 am-form-label">就诊地点</label>
							<div class="am-u-sm-9">
								<input type="text" name="address" value="${order.address}"  placeholder="请输入就诊地点" readonly>
							</div>
						</div>
						<div class="am-form-group">
							<label class="am-u-sm-3 am-form-label">产生原因</label>
							<div class="am-u-sm-9">
								<input type="text" name="address" value="${order.cause}"  placeholder="请输入就诊地点" readonly>
							</div>
						</div>
						<div class="am-form-group">
							<label for="test" class="am-u-sm-3 am-form-label">病情描述</label>
							<div class="am-u-sm-9">
								<input type="text" name="address" value="${order.studesc}"  placeholder="请输入就诊地点" readonly>
							</div>
						</div>
						<div class="am-form-group">
							<label for="test" class="am-u-sm-3 am-form-label">推荐科室</label>
							<div class="am-u-sm-9">
								<input type="text" name="unit" value="${returnorder.unit}" id="unit"  placeholder="请输入推荐科室">
							</div>
						</div>
						<div class="am-form-group">
							<label for="test" class="am-u-sm-3 am-form-label">推荐医生</label>
							<div class="am-u-sm-9">
								<input type="text" name="docid" value="${returnorder.docid}" id="docid"  placeholder="请输入推荐医生">
							</div>
						</div>
						<div class="am-form-group">
							<label for="test" class="am-u-sm-3 am-form-label">其他指示</label>
							<div class="am-u-sm-9">
								<textarea name="other" id="other" style="width: 650px;height:200px">${returnorder.other}</textarea>
							</div>
						</div>
						<div class="am-form-group">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<button type="button" onclick="checkphone()" class="am-btn am-btn-primary" id="edit">更新送检单回执</button>
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
		if($("#returnorder").val().length>0){
			var data = {};
			data['id'] = $("#returnorder").val();
			data['unit'] = $("#unit").val();
			data['docid'] = $("#docid").val();
			data['other'] = $("#other").val();
			$.ajax({
				url : "returnorder/update",
				data :data,
				type : "post",
				success : function(data){
					if(data.status=="succ"){
						layer.confirm("更新成功!", {
							icon: 1,
							skin: 'layui-layer-lan',
							btn: ['确定'] //按钮
						}, function(){
							window.location.href="returnorder/list";

						});
					}else{
						layer.msg("更新失败")
					}
				}
			});
		}else{
			var index=layer.load(1, {shade: [0.5,'#000']});
			fpost("art_insert_form",function(data){
				if(data.status=="succ"){
					layer.close(index);
					layer.confirm("更新成功!", {
						icon: 1,
						skin: 'layui-layer-lan',
						btn: ['确定'] //按钮
					}, function(){
						window.location.href="returnorder/list";

					});
				}else{
					layer.close(index);
					layer.msg("更新失败");
				}
			});
		}

	}
</script>