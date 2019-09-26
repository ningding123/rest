<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="nun" uri="http://itcast.cn/common/" %>

<jsp:include page="top-menu.jsp"/>

    <div class="tpl-page-container">

	<jsp:include page="left-menu.jsp"/>

        <div class="tpl-content-wrapper">
            <ol class="am-breadcrumb">
                <li><a href="index" class="am-icon-home">首页</a></li>
                <li><a href="javascript:void(0)">用户管理</a></li>
                <li class="am-active">用户管理</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 用户管理
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right"></div>
                        </div>
                    </div>


                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" class="am-btn am-btn-default am-btn-success" onclick="window.location.href='admin/groupList'"><span class="am-icon-plus"></span> 新增</button>
                                </div>
                            </div>
                        </div>
                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-form-group">
							<select onchange="selectByAgid()" data-am-selected="{searchBox:1}" name="agId" id="agId">
								<option value=0>所有权限组</option>
								<c:forEach items="${groups }" var="group">
									<c:choose>
										<c:when test="${vo.agId==group.agId}">
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
                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-input-group am-input-group-sm">
                                <input type="text" class="am-form-field" name="amName" id="amName" value=${vo.amName }>
                                <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
          </span>
                            </div>
                        </div>
                    </div>
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                        <tr>
                                            <th class="table-title">用户名</th>
                                            <th class="table-type">手机</th>
                                            <th class="table-author am-hide-sm-only">建立者</th>
                                            <th class="table-date am-hide-sm-only">访问次数</th>
                                            <th class="table-date am-hide-sm-only">最近登录时间</th>
                                            <th class="table-type">状态</th>
                                            <th class="table-set">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${page.rows }" var="item">
                                            <td name="amId">${item.amId }</td>
                                            <td name="amName">${item.amName }</td>
                                            <td name="mobile">${item.mobile }</td>
                                            <td class="am-hide-sm-only" name="createdUser">${item.createdUser }</td>
                                            <td name="visitCount">${item.visitCount }</td>
                                            <td class="am-hide-sm-only" name="lastLogindate">${item.lastLogindate }</td>
                                            <td>
	                                            <c:choose>
													<c:when test="${item.uStatus==true}">
													<span>已启用</span>
													</c:when>
													<c:when test="${item.uStatus==false}">
													<span>已禁用</span>
													</c:when>
												</c:choose>
											</td>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="window.location.href='admin/update?amId='+${item.amId}"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                        <c:choose>
															<c:when test="${item.uStatus==true}">
																<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="changeStatus(${item.amId})"><span class="am-icon-copy"></span> 禁用</button>
															</c:when>
															<c:when test="${item.uStatus==false}">
																<button type="button" class="am-btn am-btn-default am-btn-xs am-text-success am-hide-sm-only" onclick="changeStatus(${item.amId})"><span class="am-icon-copy"></span> 启动</button>
															</c:when>
														</c:choose>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                       
                                 	</c:forEach>
                                    </tbody>
                                </table>
                                <div class="am-cf">

                                    <div class="am-fr">
                                        <%--<ul class="am-pagination tpl-pagination">
                                            <li class="am-disabled"><a href="#">«</a></li>
                                            <li class="am-active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a href="#">»</a></li>
                                        </ul>
                                    --%>             
                                    
                                    	<nun:page url="admin/list"></nun:page>               
                                    </div>
                                </div>
                                <hr>

                            </form>
                        </div>

                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>

        </div>

    </div>
  
<jsp:include page="footer-menu.jsp"></jsp:include>  
<script type="text/javascript">
	$('.am-icon-search').click(function () {
		window.location.href='admin/list?agId='+$('#agId').val()+'&amName='+$('#amName').val();
		});
	
	function selectByAgid(){
		window.location.href='admin/list?agId='+$('#agId').val();
	};
	
	function changeStatus(id){
		window.location.href='admin/changeStatus?amId='+id+'&amName='+$('#amName').val()+'&agId='+$('#agId').val();
	};
</script>   


 

 