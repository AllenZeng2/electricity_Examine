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
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
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
			<li>代办列表</li>
			<li>查看</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>基本信息</span>
		</div>

		<ul class="forminfo">
			<form action="task.html" method="post" name="form">
				<table width="60%" height="80%" name="table">

					<tr>
						<td align="center">任务编号:</td>
						<td>CPXJ001</td>
					</tr>
					<tr>
						<td align="center">任务名称:</td>
						<td>昌平一号线巡检任务</td>
					</tr>
					<tr>
						<td align="center">巡检线路:</td>
						<td>昌平一号线</td>
					</tr>
					<tr>
						<td align="center">起始杆号:</td>
						<td>CP001_00001</td>
					</tr>
					<tr>
						<td align="center">终止杆号:</td>
						<td>CP001_00005</td>
					</tr>
					<tr>
						<td align="center">下发人:</td>
						<td>某某</td>
					</tr>
					<tr>
						<td align="center">下发时间:</td>
						<td>2015-12-25</td>
					</tr>
					<tr>
						<td align="center">备注信息:</td>
						<td>无</td>
					</tr>
					<td colspan="2" align="right"><input type="submit" value="返回"
						name="homePageback" class="scbtn">
					</td>
					<table>

						</form>
						</ul>


						</div>
</body>

</html>
