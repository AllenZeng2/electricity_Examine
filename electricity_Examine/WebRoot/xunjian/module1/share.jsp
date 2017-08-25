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
<link href="${pageContext.request.contextPath}/css/select.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/editor/kindeditor.js"></script>

<style type="text/css">
.f1 {
	font-size: 16px;
	padding-left: 15px
}

.h1 {
	font-size: 18px;
	padding-left: 0px
}
</style>

<script type="text/javascript">
if ("${sessionScope.user}" == "") {
			parent.location.href = "login.jsp";
		}
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});

	$(document).ready(function(e) {

		$(".select3").uedSelect({
			width : 120

		});
	});

	function fanhui() {
		if (confirm("确认返回")) {
			location.href="xunjian/module1/index.jsp";
			//location.href = "javascript:history.go(-1)";
		}
	}
	function baocun() {
		if (confirm("确认保存")) {
			$.ajax({
				url : "task.do?param=xunjianyuan",
				type : "post",
				data :  $("#form").serialize(),
				dataType : "json",
				success : function(res) {
					alert("保存成功");
					location.href="xunjian/module1/index.jsp";
				},
				error : function() {
					alert("error:ajax_task");
				}
			});
		}
	}
	
</script>
</head>

<body class="sarchbody">

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">巡检任务管理</a></li>
			<li><a href="#">分配巡检任务</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<form class="f1" name="form" id="form" >
				<input type="hidden" name="task_id" value="${task_id }"/>
				<table class="tablelist3" name="table">
					<tr>
						<td align='left' bgcolor="#FFFFFF"
							onMouseMove="javascript:this.bgColor='#FCFDEE';"
							onMouseOut="javascript:this.bgColor='#FFFFFF';">
							<p class="h1">分配人员:</p> 
							<c:forEach items="${list }" var="u" begin="0" end="0">
								<p class="h1">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="xunjianyuan" id="xunjianyuan" checked="checked" value="${u.USER_NAME}"  />&nbsp;&nbsp;${u.USER_NAME
									}
								</p>
							</c:forEach>
							<c:forEach items="${list }" var="u" begin="1">
								<p class="h1">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="xunjianyuan" id="xunjianyuan" value="${u.USER_NAME}"  />&nbsp;&nbsp;${u.USER_NAME
									}
								</p>
							</c:forEach>
							</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>
							<ul class="seachform1">
								<li>
									<div class="vocation"></div>
								</li>
								<li><input name="homePageSave" type="button" class="scbtn1"
									onclick="baocun()" value="保存" /> <input name="homePageButton"
									type="button" class="scbtn1" value="返回" onclick="fanhui()" />
								</li>
							</ul>
							</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>

</html>