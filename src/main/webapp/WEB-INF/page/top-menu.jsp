<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
	<base href="<%=basePath %>" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>学生请假送检系统</title>
    <meta name="description" content="">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="i/sdlogo.png">
    <link rel="apple-touch-icon-precomposed" href="">
    <meta name="apple-mobile-web-app-title" content="" />
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet"href="css/thickbox.css" type="text/css" />
    <link rel="stylesheet"href="css/amazeui.address.min.css" />
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/mydm.css">
    <link rel="stylesheet" href="css/text.css">
</head>
<body>
<header class="am-topbar am-topbar-inverse admin-header">
    <div class="am-topbar-brand">
        <a href="javascript:" class="tpl-logo">
            学生送检系统
          <%--  <img src="img/logo.jpg" alt="">--%>
        </a>
    </div>
    <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    <span class="tpl-header-list-user-nick">超级管理员</span><span class="tpl-header-list-user-ico"> </span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="javascript:void(0)"><span class="am-icon-bell-o"></span>资料</a></li>
                    <li><a href="admin/update?amId=${ sessionScope.admin.amId}"><span class="am-icon-cog"></span>设置</a></li>
                </ul>
            </li>
            <li><a href="logout" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
        </ul>
    </div>
</header>

