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
		<li class="am-active">模块管理</li>
	</ol>
	<div class="tpl-portlet-components">
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span> 模块管理
			</div>
			<form method="get" action="menu/list" id="search_form">
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
                            <button type="button" class="am-btn am-btn-default am-btn-success" onclick="window.location.href='menu/edit?au_id=0'"><span class="am-icon-plus"></span> 新增</button>
                        </div>
                    </div>
                </div>
				<div class="am-u-sm-12">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th>模块名称</th>
					                <th>字段名</th>
					                <th>模块级别</th>
					                <th>是否可链接</th>
					                <th>图标类型</th>
									<th class="table-set">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows }" var="item">
									<tr>
										<td>${item.auTitle }</td>
										<td>${item.auName }</td>
										<td>${item.auLevel }级</td>
										<td>
											<c:if test="${item.auClickable==1 }">可以</c:if>
											<c:if test="${item.auClickable==0 }">不可以</c:if>
										</td>
										<td><i class="${item.auClass }"></i></td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button onclick="window.location.href='menu/edit?au_id=${item.auId}'" type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="am-cf">
							<div class="am-fr">
								<nun:page url="menu/list"></nun:page>
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




