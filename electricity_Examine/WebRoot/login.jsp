<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


<title>欢迎登录后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- <script language="JavaScript" src="js/jquery.js"></script> -->
<script src="js/cloud.js" type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			var uname = $("#username").val();
			if (uname.trim().length == 0) {
				alert("请输入账号！");
				return;
			}
			var upwd = $("#password").val();
			if (upwd.trim().length == 0) {
				alert("请输入密码！");
				return;
			}
			$("#form").submit();
		})
	});
	var msg = "${sessionScope.user}";
	if (msg == "用户名密码错误！"||msg=="该账户以被冻结，请和管理员联系！") {
		alert(msg);
	}
<%request.getSession().removeAttribute("user");%>
	
</script>

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		});
	});
</script>

</head>

<body
	style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>




	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">
			<form action="users.dd" method="post" id="form"
				name="form">
				<ul>
					<li><input name="user_loginname" id="username" type="text"
						class="loginuser" /></li>
					<li><input name="user_password" id="password" type="password"
						class="loginpwd" /></li>
					<li><input id="login" type="button" class="loginbtn"
						value="登录" />
					</li>
				</ul>
			</form>

		</div>

	</div>

</body>

</html>
