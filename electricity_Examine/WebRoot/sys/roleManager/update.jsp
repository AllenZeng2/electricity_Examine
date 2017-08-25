<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	if ("${sessionScope.user}" == "") {
		parent.location.href = "login.jsp";
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#homePageSave").click(function() {
			if (confirm("确认修改吗？")) {
				alert("修改成功！");
				$("#form").submit();
			}
		});
	});
</script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>系统管理</li>
			<li>角色管理</li>
			<li>修改角色</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>基本信息</span>
		</div>
		<ul class="forminfo">
			<form action="role.do?m=update" method="post" name="form" id="form">
				<input name="id" type="hidden" value="${updateRole.id}" /> <input
					name="rid" type="hidden" value="${r.ROLE_ID}" />
				<li><label>角色编号</label><input name="role_id"
					value="${r.ROLE_NUMBER }" type="text" class="dfinput" /><i>编号不能超过20个字符</i>
				</li>
				<li><label>角色名称</label><input name="role_name"
					value="${r.ROLE_NAME }" type="text" class="dfinput" /><i>名称不能超过20个字符</i>
				</li>

				<li><label>启用状态</label><cite> <input name="role_state"
						type="radio" value="0"
						<c:if test="${r.ROLE_STATE==0 }">checked="checked"</c:if> />启用&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="role_state" type="radio" value="1"
						<c:if test="${r.ROLE_STATE==1 }">checked="checked"</c:if> />禁用</cite>
				</li>

				<li><label>&nbsp;</label><input name="homePageSave"
					id="homePageSave" type="button" class="btn" value="确认保存" />
				</li>
			</form>
		</ul>


	</div>


</body>

</html>
