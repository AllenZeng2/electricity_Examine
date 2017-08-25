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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<script type="text/javascript">
		if ("${sessionScope.user}" == "") {
			parent.location.href = "login.jsp";
		}
</script>
<script type="text/javascript">
	$(function() {
		$("#homePageSave").click(function() {
			var num = $("#role_id").val();
			if (num.trim().length == 0) {
				alert("编号不能为空！");
				return;
			}
			if (num.trim().length > 20) {
				alert("编号不能超过20个字符");
				return;
			}
			var uname = $("#role_name").val();
			if (uname.trim().length == 0) {
				alert("角色名不能为空！");
				return;
			}
			if (uname.trim().length > 20) {
				alert("角色名不能超过20个字符");
				return;
			}

			if (confirm("确认新增吗？")) {
				$.ajax({
					url : "role.do?m=nameTest",
					type : "post",
					data : {
						num : num,
						name : uname
					},
					dataType : "text",
					success : function(res) {
						if (res != 1) {
							alert(res);
						} else {
							alert("新增成功");
							$("#form").submit();
						}
					},
					error : function() {
					}
				});
			}
		});
	});
</script>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>系统管理</li>
			<li>角色管理</li>
			<li>添加角色</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>基本信息</span>
		</div>

		<ul class="forminfo">
			<form action="role.do?m=add" method="post" name="form" id="form">
				<input type="hidden" name="creatPerson"
					value="${sessionScope.user }" />
				<li><label>角色编号</label><input name="role_id" id="role_id"
					value="" type="text" class="dfinput" /><i>编号不能超过20个字符</i></li>
				<li><label>角色名称</label><input name="role_name" id="role_name"
					type="text" class="dfinput" /><i>名称不能超过20个字符，唯一性的验证</i></li>
				<li><label>启用状态</label><cite><input name="role_state"
						type="radio" value="0" checked="checked" />启用&nbsp;&nbsp;&nbsp;&nbsp;<input
						name="role_state" type="radio" value="1" />禁用</cite></li>
				<li><label>&nbsp;</label><input name="homePageSave"
					id="homePageSave" type="button" class="btn" value="确认保存" /></li>
			</form>
		</ul>


	</div>


</body>

</html>

