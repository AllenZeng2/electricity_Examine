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

<title>无标题文档</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<style>
td {
	font-size: 20px;
}
</style>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>我的工作平台</li>
			<li>个人资料修改</li>

		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>基本信息</span>
		</div>

		<ul class="forminfo">
			<form action="#" method="post" name="table">
				<table width="80%" height="60%" name="form">

					<tr>
						<td align="center" style="font-size:16px;">登陆名:</td>
						<td>zhangsan</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">用户名称:</td>
						<td>张三</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">性别:</td>
						<td>男</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">年龄:</td>
						<td>23</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">入职日期:</td>
						<td>1998-02-26</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">离职日期:</td>
						<td>1998-02-28</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">联系电话:</td>
						<td>12345678952</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">邮箱:</td>
						<td>adsa@163.com</td>
					</tr>
					<td colspan="2" align="center"></td>
					<table>

						</form>
						</ul>


						</div>
</body>

</html>

