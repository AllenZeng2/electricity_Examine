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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
if ("${sessionScope.user}" == "") {
			parent.location.href = "login.jsp";
		}
	$(function(){
		pole(document.getElementById("poleNum1").lang);
	});
	
	function pole(id) {
		$.ajax({
			url : "task.do?param=selectReceiptByPoleNum",
			type : "post",
			data : {
				pole_id : id
			},
			dataType : "json",
			success : function(res) {
			if(res==null||res==""){
				$("#div").html("该塔杆未回执");
			}else{
				var txt = "";
				txt += "<div>";
				txt += "<label>线路编码:</label>" + res.line_number
						+ " &nbsp;&nbsp;&nbsp;&nbsp; ";
				txt += "<label>塔杆编码:</label>" + res.pole.pole_NUMBER;
				txt += "</div><div>";
				txt += "<label>有无故障:</label>"
						+ (res.defects.defect_ID == 1 ? "无" : "有")
						+ " &nbsp;&nbsp;&nbsp;&nbsp;";
				txt += "</div><div>";
				txt += "<label>缺陷类型:</label>" + res.defects.defect_NAME
						+ " &nbsp;&nbsp;&nbsp;&nbsp;";
				txt += "<label>缺陷级别:</label>"
						+ (res.defect_level == 1 ? "一般"
								: (res.defect_level == 2 ? "严重" : (res.defect_level == 3?"紧急":" 无")));
				txt += "</div><div>";
				txt += "<label>缺陷描述:</label>" + (res.defect_desc==null?"无":res.defect_desc);
				txt += "</div><div>";
				txt += "<label>巡检时间:</label>" + res.task_begaindate;
				txt += "</div>";
				$("#div").html(txt);
			}},
			error : function() {
				alert("error:ajax");
			}
		});
	}
	function fanhui() {
		if (confirm("确认返回")) {
			location.href="xunjian/module1/index.jsp";
			//location.href = "javascript:history.go(-1)";
		}
	}
</script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>巡检任务管理</li>
			<li>巡检任务制定与分配</li>
			<li>查看巡检任务</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>基本信息</span>
		</div>

		<ul class="forminfo">
			<form action="index.html" method="post" name="form">
				<table class="tablelist" name="table">
					<tr>
						<td colspan="3" align="left"><label>任务编号:</label>&nbsp;&nbsp;${task.TASK_NUMBER}
							&nbsp;&nbsp; <label>任务名称:&nbsp;&nbsp;</label>${task.TASK_NAME}
							&nbsp;&nbsp; <label>巡检线路:&nbsp;&nbsp;</label>${task.line.lineName}
							&nbsp;&nbsp; <label>起始杆号:&nbsp;&nbsp;</label>${task.TASK_BEGINPOLE}&nbsp;&nbsp;<br />
							&nbsp; <label>终止杆号:&nbsp;&nbsp;</label>${task.TASK_ENDPOLE}
							&nbsp;&nbsp;<label>下发时间:&nbsp;&nbsp;</label>${task.TASK_BEGINTIME}
							&nbsp;&nbsp; <label>任务状态:&nbsp;&nbsp;</label>${task.TASK_STATIC==1?"未分配":(task.TASK_STATIC==2?"已分配":(task.TASK_STATIC==3?"执行中":"已完成"))}
							&nbsp;&nbsp;<br /> &nbsp; <label>巡检员:&nbsp;&nbsp;</label>${task.TASK_USERNAME==null?"无":task.TASK_USERNAME}</td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td width="400px">${task.TASK_NAME }杆号
							<ol class="forminfo">
								<c:forEach items="${list}" var="p" begin="0" end="0">
									<li><a href="javascript:void(0)" id="poleNum1"
										lang="${p.POLE_ID}" onclick="pole(${p.POLE_ID})"
										class="tablelink">${p.POLE_NUMBER }</a></li>
								</c:forEach>
								<c:forEach items="${list}" var="p" begin="1">
									<li><a href="javascript:void(0)" id="poleNum"
										onclick="pole(${p.POLE_ID})" class="tablelink">${p.POLE_NUMBER
											}</a></li>
								</c:forEach>
							</ol>
						</td>

						<td colspan="2" align="left">
							<div id="div"></div>
						</td>
					</tr>
					<tr>
						<td colspan="3"><input type="button" onclick="fanhui()"
							name="homePageButton" value="返回" class="scbtn" /></td>
					</tr>

					<table>

						</form>
						</ul>


						</div>
</body>
<font style="color:red">*巡检时间:若未开始执行巡检任务,则显示尚未巡检</font>
<br />
<font style="color:red">*点击左边的杆塔好,右侧显示对应的详细信息</font>
</html>

