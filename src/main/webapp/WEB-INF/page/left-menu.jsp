<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="tpl-page-container tpl-page-header-fixed">
	<div class="tpl-left-nav tpl-left-nav-hover">
		<div class="tpl-left-nav-title">功能模块列表</div>
		<div class="tpl-left-nav-list">
			<ul class="tpl-left-nav-menu">
			    <c:forEach items="${SESSIONAUTHLIST }" var="parent">
			    <c:if test="${parent.checked==2 }">
				<li class="tpl-left-nav-item">
					<a href="javascript:;" class="nav-link tpl-left-nav-link-list <c:if test="${parent.auInfo==cla}">active</c:if>"> 
						<i class="${parent.auClass}"></i> 
						<span>${parent.auTitle}</span>
						<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
					</a>
					<ul class="tpl-left-nav-sub-menu" <c:if test="${parent.auInfo==cla}">style="display:block;"</c:if>>
						<li>
						 	<c:forEach items="${parent.sub_list }" var="children">
						 	<c:if test="${children.checked==2 }">
							<a href="${children.auName}"> <i class="am-icon-angle-right"></i> 
								<span>${children.auTitle}</span>
								<i class="${children.auClass} tpl-left-nav-content-ico am-fr am-margin-right"></i>
							</a> 
							</c:if>
							</c:forEach>
						</li>
					</ul>
				</li>
				</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>