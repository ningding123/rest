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
<title>学生送检请假系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="i/sdlogo.png">
<link rel="apple-touch-icon-precomposed"
	href="../i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/amazeui.min.css" />
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="css/app.css">
</head>

<body data-type="login">

	<div class="am-g myapp-login">
		<div class="myapp-login-logo-block  tpl-login-max">
			<div class="myapp-login-logo-text">
				<div class="myapp-login-logo-text">
					学生送检请假系统<span> 登录</span> <i class="am-icon-skyatlas"></i>
				</div>
			</div>

			<div class="login-font">
				<i>Log In </i> or <span> Sign Up</span>
			</div>
			<div class="am-u-sm-10 login-am-center">
				<form class="am-form" action="admin/login" method="post">
					<fieldset>
						<div class="am-form-group">
							<input type="text" name="uLoginname" class="am-form-field"
								id="doc-ipt-name-1" placeholder="请输入用户名" required>
						</div>
						<div class="am-form-group">
							<input type="password" name="uPassword" class="am-form-field"
								id="doc-ipt-pwd-1" placeholder="请输入密码" required>
						</div>
						<div class="am-input-group" style="margin-top: 20px;">
							<input name="code" id="code"  class="am-form-field" type="text" placeholder="验证码" style="width:150px;" required>
							<img id="validateImgCode" src="getKaptchaImage" onclick="change()">
							<a id="kanbuq"
							   href="javascript:change()">看不清，换一张</a>
						</div>
						<p>
							<button  id="loginBt" type="submit" class="am-btn am-btn-default">登录</button>
						</p>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<script src="js/app.js"></script>
</body>

<script type="text/javascript">
	function  change() {
		$("#validateImgCode").attr("src","getKaptchaImage");
	}
</script>
</html>