<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="nun" uri="http://itcast.cn/common/"%>
<jsp:include page="top-menu.jsp" />
<jsp:include page="left-menu.jsp" />
<div class="tpl-content-wrapper">
	<ol class="am-breadcrumb">
		<li><a href="index" class="am-icon-home">首页</a>
		</li>
		<li><a href="javascript:void(0)">系统管理</a>
		</li>
		<li class="am-active">角色管理</li>
	</ol>
	<div class="tpl-portlet-components">
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span> 角色管理
			</div>
			<form method="get" action="group/list" id="search_form">
			<div class="tpl-portlet-input tpl-fz-ml">
				<div class="portlet-input input-small input-inline">
					<div class="input-icon right">
					</div>
				</div>
			</div>
			</form>
		</div>
		<div class="tpl-block">
			<div class="am-g">
				<div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default am-btn-success" onclick="window.location.href='group/edit?agid=0'"><span class="am-icon-plus"></span> 新增</button>
                        </div>
                    </div>
                </div>
				<div class="am-u-sm-12">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-type">权限组</th>
									<th class="table-text">描述</th>
									<th class="table-type">状态</th>
									<th class="table-set">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows }" var="item">
									<tr>
										<td>${item.agName }</td>
										<td>${item.agInfo }</td>
										<td>${item.agStatus }级</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button onclick="window.location.href='group/edit?agid=${item.agId}'" type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 禁用</button>
                                                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-success am-hide-sm-only"><span class="am-icon-trash-o"></span> 查看用户</button>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="am-cf">
							<div class="am-fr">
								<nun:page url="group/list"></nun:page>
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
<jsp:include page="footer-menu.jsp"></jsp:include>




