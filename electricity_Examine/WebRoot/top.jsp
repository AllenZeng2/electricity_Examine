<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />


<link rel="stylesheet" href="css/index.css" type="text/css" />



<script src="js/time.js" language="javascript"></script>

<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
	if ("${sessionScope.user}" == "") {
		parent.location.href = "login.jsp";
	}
</script>
<script type="text/javascript">
	$(function() {
		//顶部导航切换
		$(".nav li a").click(function() {
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})
	})
</script>


</head>

<body style="background:url(images/topbg.gif) repeat-x;">

	<div class="topleft">
		<a href="index.jsp" target="_parent"><img src="images/logo7.jpg"
			title="系统首页" /> </a>
	</div>
	<div class="topright">
		<ul>
			<li>
				<div class="date" id="currentime"></div>
			</li>
			<li>
				<div class="time">
					<span id="h1"></span> 
					<span id="h2"></span>
					<strong>:</strong> 
					<span id="m1"></span> 
					<span id="m2"></span>
					<strong>:</strong> 
					<span id="s1"></span> 
					<span id="s2"></span>
				</div>
			</li>
			<li>欢迎 ${user.USER_NAME}</li>
			<li>角色：${user.roles.ROLE_NAME}</li>
			<li><a href="users.do?m=exit" onclick="alert('已安全退出！')"
				target="_parent">退出</a>
			</li>
		</ul>
	</div>

</body>
</html>
