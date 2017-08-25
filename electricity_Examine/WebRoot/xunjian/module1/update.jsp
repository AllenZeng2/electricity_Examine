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
			<li>巡检任务制定与分配/li>
			<li>制定巡检任务</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>制定巡检任务</span>
		</div>

		<ul class="forminfo">
			<form action="index.html" method="post" name="form">
				<input type="hidden" name="creatPerson"
					value="${sessionScope.user }" />
				<li><label>巡检线路</label>
					<div>
						<select class="dfinput" name="line_number"><option>昌平一线</option>
							<option>保定二线</option>
							<option>通州三线</option>
						</select>
					</div> <i>选择某条线路就会联动可以使用的起始杆号和终止杆号</i>
				</li>
				<li><label>任务编号</label><input name="task_number" type="text"
					class="dfinput" /><i>自定义编号 例如:CPXJ001唯一性的验证</i>
				</li>
				<li><label>任务名称</label><input name="task_name" type="text"
					class="dfinput" /><i>非空验证，唯一</i>
				</li>

				<li><label>巡检员</label><input name="user_id" type="radio" />巡检人员1
					<input name="user_id" type="radio" />巡检人员2 <input name="user_id"
					type="radio" />巡检人员3 <input name="user_id" type="radio" />巡检人员4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>选择分配的巡检员只能非配给一个人，不能为多人</i>
				</li>
				<li><label>起始杆号</label><input name="pole_start" type="text"
					class="dfinput" value="" /><i>根据选择的线路，此线路支持巡检的最小杆号</i>
				</li>
				<li><label>终止杆号</label><input name="pole_stop" type="text"
					class="dfinput" value="" /> <i>终止杆号一定要大于起始杆号</i>
				</li>
				<li><label>巡检结束日期</label><input name="xjstoptime" type="text"
					class="dfinput" value="" /> <i>即要求巡检员巡检结束的日期---此处和代办列表主页面的日期是一个字段</i>
				</li>
				<li><label>下发人</label><input name="user_loginname" type="text"
					onlyread="onlyread" value="admin" />
				</li>
				<li><label>下发日期</label><input name="task_xiafadate" type="text"
					onlyread="onlyread" value="2015-12-12" /><i>系统当前时间</i>
				</li>
				<li><label>备注</label> <textarea class="dfinput"
						name="task_remark"></textarea>
				<li><label>&nbsp;</label><input name="homePageSave"
					type="submit" class="btn" value="保存" /> <input
					name="homePageButton" type="submit" class="btn" value="返回" />
				</li>
			</form>
		</ul>


	</div>


</body>

</html>
