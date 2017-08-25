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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	/* $(function() {
		$("#homePageSave").click(function() {
			if (confirm("确认修改吗？")) {

				var upwd = $("#user_password").val();
				if (upwd.trim().length == 0) {
					alert("用户名称不能为空！");
					return;
				}
				var hpwd = $("#hiddengo").val();
				
				var i = 0;
				if (upwd != hpwd) {
					i++;
					alert("原密码输入错误！还有次" + (3 - i) + "机会");
					if (i == 3) {
						parent.location.href = "login.jsp";
						return;
					}
				}

				alert("修改成功！");
				 $.ajax({
					url : "users.do?u=updateSelf",
					type : "post",
					data : {

					},
					success : function() {
					},
					error : function() {
					}
				}); 
			}
		})
	}); */
	var i = 0;
	function check() {

		if (i < 3) {
			var upwd = $("#user_password").val();
			var hpwd = $("#hiddengo").val();
			if (upwd == hpwd) {

				var upwd1 = $("#newpassword1").val();
				var upwd2 = $("#newpassword2").val();
				if (upwd1.trim().length == 0 || upwd2.trim().length == 0) {
					alert("新密码不能为空！");
					return;
				}
				if (upwd1.trim().length < 6 || upwd1.trim().length > 20) {
					alert("密码长度不符！");
					return;
				}
				if (upwd1 != upwd2) {
					alert("两次密码输入不一致！");
					return;
				}
				alert("修改成功！请重新登录！");
				$.ajax({
					url : "users.do?u=uppwd",
					type : "post",
					data : {
						pwd : upwd1,
						uid : $("#uid").val()
					},
					success : function() {
					},
					error : function() {
					}
				});
				parent.location.href = "login.jsp";
			} else {
				i++;
				alert("原密码输入错误！还有次" + (3 - i) + "机会");
			}
		}

		if (i == 3) {
			parent.location.href = "login.jsp";
		}
	}
</script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>我的工作平台</li>
			<li>修改密码</li>

		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>修改密码</span>
		</div>

		<ul class="forminfo">
			<form action="#" method="post" name="form">
				<input type="hidden" id="hiddengo" value="${u.USER_PASSWORD }" /> <input
					type="hidden" id="uid" value="${u.USER_ID }" />
				<table width="70%" height="30%" name="table">
					<tr>
						<td align="center" style="font-size:16px;">原密码:</td>
						<td><input name="user_password" id="user_password"
							type="password" class="dfinput" value=""></td>
						<td><i>非空验证，原密码输入三次返回登陆页面</i>
						</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">新密码:</td>
						<td><input name="newpassword" id="newpassword1"
							type="password" class="dfinput"></td>
						<td><i>非空验证，长度验证 最少六个 最多二十个字符</i>
						</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">确认新密码:</td>
						<td><input name="newpassword" id="newpassword2"
							type="password" class="dfinput"></td>
						<td><i>和新密码相同性验证</i>
						</td>
					</tr>
					<td colspan="2" align="center"><input type="button"
						onclick="check()" name="homePageSave" id="homePageSave"
						value="保存修改" class="scbtn"></td>
					<table>

						</form>
						</ul>


						</div>
</body>

</html>

