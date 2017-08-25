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


<style>
td {
	font-size: 20px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(function() {
		$("#homePageSave").click(function() {
			if (confirm("确认修改吗？")) {

				var uname = $("#user_name").val();
				if (uname.trim().length == 0) {
					alert("用户名称不能为空！");
					return;
				}
				if (uname.trim().length < 3 || uname.trim().length > 8) {
					alert("用户名称长度必须在3-8之间！");
					return;
				}

				var intime = $("#user_intime").val();
				if (intime.trim().length == 0) {
					alert("入职日期不能为空！");
					return;
				}
				var outtime = $("#user_outtime").val();
				if (outtime.trim().length > 0) {
					if(outtime<intime){
					alert("离职日期必须是入职日期之后的时间！");
					return;
					}
				}

				var email = $("#user_email").val();
				if (email.trim().length == 0) {
					alert("邮箱不能为空！");
					return;
				}
				var e = /^\w+@\w+.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/;
				if (!e.test(email)) {
					alert("请输入正确邮箱!");
					return;
				}

				var uphone = $("#user_phone").val();
				var reg = /^1[3578]\d{9}$/;
				if (!reg.test(uphone)) {
					alert("手机号格式不正确！");
					return;
				}
				alert("修改成功！");
				$.ajax({
					url : "users.do?u=updateSelf",
					type : "post",
					data : {
						USER_NAME : $("#user_name").val(),
						USER_SEX : $("#user_sex").val(),
						USER_AGE : $("#user_age").val(),
						USER_INTIME : $("#user_intime").val(),
						USER_OUTTIME : $("#user_outtime").val(),
						USER_PHONE : $("#user_phone").val(),
						USER_EMAIL : $("#user_email").val(),
						USER_ID : $("#uid").val()
					},
					success : function() {
					},
					error : function() {
					}
				});
			}
		})
	});
	function ageTest(age) {
		$("#user_age").val($("#user_age").val().replace(/[^\d]/g, ''));
		if ($("#user_age").val() > 120) {
			$("#user_age").val(120);
		}
		if ($("#user_age").val() <= 0) {
			$("#user_age").val(0);
		}

	}
</script>
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
			<form name="form">
				<input type="hidden" id="uid" name="id" value="${user.USER_ID }" />
				<table width="80%" height="60%" name="table">

					<tr>
						<td align="center" style="font-size:16px;">登陆名:</td>
						<td>${u.USER_LOGINNAME }</td>
						<td><i></i>
						</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">用户名称:</td>
						<td><input name="user_name" id="user_name" type="text"
							class="dfinput" value="${u.USER_NAME }">
						</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">性别:</td>

						<td><input type="radio" name="user_sex" value="0"
							id="user_sex"
							<c:if test="${u.USER_SEX==0 }">checked="checked"</c:if>>男<input
							type="radio" name="user_sex" id="user_sex" value="1"
							<c:if test="${u.USER_SEX==1 }">checked="checked"</c:if>>女</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">年龄:</td>
						<td><input type="text" name="user_age" id="user_age"
							onkeyup="ageTest(this.value)" class="dfinput"
							value="${u.USER_AGE }">
						</td>
						<td><i>整数 最大值为100</i>
						</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">入职日期:</td>
						<td><input type="text" name="user_intime" id="user_intime"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
							class="dfinput" value="${u.USER_INTIME }">
						</td>
						<td><i>必填</i>
						</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">联系电话:</td>
						<td><input type="text" name="user_phone" id="user_phone"
							class="dfinput" value="${u.USER_PHONE }">
						</td>
						<td><i>正规电话号码的验证</i>
						</td>
					</tr>
					<tr>
						<td align="center" style="font-size:16px;">邮箱:</td>
						<td><input type="text" name="user_email" id="user_email"
							class="dfinput" value="${u.USER_EMAIL }">
						</td>
						<td><i>正规邮箱的验证</i>
						</td>
					</tr>
					<td colspan="2" align="center"><input type="button"
						value="保存修改" id="homePageSave" name="homePageSave" class="scbtn">
					</td>
					<table>
						</form>
						</ul>
						</div>
</body>

</html>
