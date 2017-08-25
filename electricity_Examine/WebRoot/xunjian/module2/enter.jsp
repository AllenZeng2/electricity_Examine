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
label {
	color: red;
}

td {
	font-size: 15px
}

div {
	font-size: 15px
}
</style>
<script type="text/javascript">
if ("${sessionScope.user}" == "") {
		parent.location.href = "login.jsp";
	}
</script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>巡检任务管理</li>
			<li>巡检任务制定与分配</li>
			<li>巡检任务回执录入</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>回执录入</span>
		</div>

		<ul class="forminfo">
			<form action="index.html" method="post" name="form">
				<table class="tablelist" name="table">

					<tr>
						<td>昌平1号线 塔杆号
							<ol class="forminfo">
								<select name="line_end"><option>--请选择--</option>
									<option>CP0001_000001</option>
									<option>CP0001_000002</option>
									<option>CP0001_000003</option>
								</select>
							</ol></td>

						<td colspan="2" align="left">
							<ul class="forminfo">
								<form action="index.html" method="post" name="form">
									<li><label>线路编号</label>CP001</li>
									<li><label>杆塔编号</label>CP0001_000001</li>
									<li><label>缺陷类型</label>
									<div>
											<select class="dfinput" name="receipt_type"><option>--请选择--</option>
												<option>无缺陷</option>
												<option>叉梁断裂</option>
												<option>拦河线断裂</option>
												<option>杆塔倾斜</option>
											</select>
										</div>
										<i>如果无缺陷类型则不用进行缺陷等级的确认</i>
									</li>
									<li><label>缺陷级别</label>
									<div>
											<select class="dfinput" name="receipt_level"><option>--请选择--</option>
												<option>一般</option>
												<option>严重</option>
												<option>紧急</option>
											</select>
										</div>
									</li>

									<li><label>发现时间</label>系统当前时间</li>
									<li><label>发现人员</label>发现人为当前登录人员</li>
									<li><label>缺陷描述</label>
									<textarea class="dfinput" name="receipt_desc"></textarea>
							</ul></td>
					</tr>
					<tr>
						<td colspan="3"><input type="submit" value="上传回执"
							name="homePageSubmit" class="scbtn"> <input type="submit"
							value="全部完好回执" name="homePageSave" class="scbtn"> <input
							name="homePageButton" type="submit" class="btn" value="返回" />
						</td>
					</tr>

					</form>
					<table>

						</form>
						</ul>


						</div>

						<div style="color:red">如果检测的塔杆，无缺陷，则直接保存到信息统计中的无缺陷查询统计中</div>
</body>

</html>
