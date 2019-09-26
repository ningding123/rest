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
		<li class="am-active"><c:if test='${groupinfo.agId==NULL }'>添加角色</c:if>
				<c:if test='${groupinfo.agId>0 }'>修改角色</c:if></li>
	</ol>
	<div class="tpl-portlet-components">
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span> 
				<c:if test='${groupinfo.agId==NULL }'>添加角色</c:if>
				<c:if test='${groupinfo.agId>0 }'>修改角色</c:if>
			</div>
		</div>
		<div class="tpl-block ">
			<div class="am-g tpl-amazeui-form">
				<div class="am-u-sm-12 am-u-md-9">
					<form method="post" action="group/edit_handle" class="am-form am-form-horizontal" id="amdin_group_form"  data-am-validator >
						<c:choose>
							<c:when test="${groupinfo.agId>0 }"><input type="hidden" name="agId" id="ag_id" value="${groupinfo.agId }"></c:when>
							<c:otherwise> <input type="hidden" name="agId" id="ag_id" value="0"> </c:otherwise>
						</c:choose>
						<div class="am-form-group">
							<label  class="am-u-sm-3 am-form-label">权限组名称 </label>
							<div class="am-u-sm-9">
								<input required name="agName" id="ag_name" type="text" value="${groupinfo.agName }" placeholder="请输入标题">
							</div>
						</div>
						<div class="am-form-group">
							<label class="am-u-sm-3 am-form-label">权限组描述</label>
							<div class="am-u-sm-9">
								<input required name="agInfo" id="ag_info" type="text" value="${groupinfo.agInfo }" placeholder="输入字段名 "> 
							</div>
						</div>
						
						<div class="am-form-group">
							<label  class="am-u-sm-3 am-form-label">分配权限</label>
							<!-- ---------------------------------------------- -->
							<%-- <table style="width:50%;margin:40px auto;" class="table">
								<tbody>
								    <c:forEach items="${list }" var="item">
									<tr class="text-c">
										<td style="text-align:center;"><input id="parent_${item.auId}" type="checkbox" <c:if test='${item.checked==2 }'>checked</c:if> value="${item.auId }" name="au_id">  ${item.auTitle }</td>
										<td></td>
									</tr>
									<c:forEach items="${item.sub_list }" var="bean">
									<tr class="text-c">
									    <td></td>
										<td style="text-align:center;"><input class="parent_${item.auId}" id="children_${bean.auId }" type="checkbox" <c:if test='${bean.checked==2 }'>checked</c:if> value="${bean.auId }" name="au_id">${bean.auTitle }</td>
									</tr>
									</c:forEach>
									
								</tbody>
							</table> --%>
							<!-- ---------------------------------------- -->
							<div class="am-u-sm-3 am-u-end">
							<c:forEach items="${list }" var="item">
							<div class="tree_main">
								
							        <div class="tree_th clearfix btn" >
							            <div class="tree_l" id="trees" nav="1">
							
							            </div>
							            <div>
							                <input id="parent_${item.auId}" onclick="ckAll(this)" type="checkbox" <c:if test='${item.checked==2 }'>checked</c:if> value="${item.auId }" name="au_id">  ${item.auTitle }
							            </div>
							        </div>
							      
							        <div class="tree_li btn" id="j_tb" >
							            <ul>
							            	<c:forEach items="${item.sub_list }" var="bean">
												<li><input class="parent_${item.auId}" id="children_${bean.auId }" type="checkbox" <c:if test='${bean.checked==2 }'>checked</c:if> value="${bean.auId }" name="au_id">${bean.auTitle }</li>
							                </c:forEach>
							            </ul>
							        </div>
						        
   						 </div>
   						 </c:forEach>
   						 </div>
							<!-- ----------------------------------------- -->
						</div>
						<div class="am-form-group">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<button onclick="edit_handle();" type="button" class="am-btn am-btn-primary">提交信息</button>
								<button onclick="history.go(-1);" type="button" class="am-btn am-btn-primary">返回上级</button>
							</div>
						</div>
						<input type="hidden" name="au_id" value="0">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer-menu.jsp"></jsp:include>
<script type="text/javascript">
	$(".tree_li").eq(0).removeClass("btn");
	$(".tree_l").eq(0).css("background-image","url('img/jt2.png')");
	$(".tree_l").eq(0).attr("nav", "0");
   $(".tree_l").click(function(){
           if($(this).attr("nav")==1){
               $(this).parent().next().slideDown("slow");
               this.setAttribute("nav","0");
               $(this).css("background-image","url(\"img/jt2.png\")");
           }else {
               $(this).parent().next().slideUp("slow");
               this.setAttribute("nav","1");
               $(this).css("background-image","url(\"img/jt1.png\")");
           }
        });
    var cks = document.getElementById("j_tb").getElementsByTagName("input");
     function ckAll (textnav) {
         var cks = textnav.parentNode.parentNode.nextElementSibling.getElementsByTagName("input");
        for (var i = 0; i < cks.length; i++) {
            cks[i].checked = textnav.checked;
        }
    }

    for(var i=0;i<cks.length;i++){
        cks[i].onclick=function () {
            var flag=false;
            for(var j=0;j<cks.length;j++){
                if(cks[j].checked){
                    flag=true;
                    break;
                }
            }
            ckAll.checked=flag;
        };
    }


	function edit_handle(){
		var index=layer.load(1, {shade: [0.5,'#000']});
		fpost("amdin_group_form",function(data){
			if(data.status=="succ"){
				layer.close(index);
				layer.alert("权限处理成功", {skin: 'layer-ext-moon',closeBtn: 0,anim: 4 });
				setTimeout(function(){window.location.href="group/list";}, 2000);
			}else{
				layer.msg("权限处理失败");
			}
		});
	}


	$(function(){
		$("input[name='au_id']").bind("click",function(){
			var data=$(this).attr("id");
			if(data.indexOf("children")>=0){
				var _parent=$(this).attr("class");
				var flag=false;
				$("."+_parent).each(function(obj){
					if($(this).attr("checked")=="checked" || $(this).attr("checked")==true){
						flag=true;
					}
				})
				if(flag){
					$("#"+_parent).attr("checked",true);
				}else{
					$("#"+_parent).attr("checked",false);
				}
			}else{
				var _parent=$(this).attr("id");
				if($(this).attr("checked")=="checked" || $(this).attr("checked")==true){
					$("."+_parent).attr("checked",true);
				}else{
					$("."+_parent).attr("checked",false);
				}
			}
		});
	});
</script>