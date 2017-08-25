<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/styless.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	if ("${sessionScope.user}" == "") {
		parent.location.href = "login.jsp";
	}
</script>
<script>
	$(function() {
		$("#homePageSave").click(function() {
			if (confirm("确认新增吗？")) {
				var loginName = $("#user_id").val();
				if (loginName.trim().length == 0) {
					alert("登录名不能为空！");
					return;
				}

				var uname = $("#user_name").val();
				if (uname.trim().length == 0) {
					alert("用户名称不能为空！");
					return;
				}
				if (uname.trim().length < 3 || uname.trim().length > 8) {
					alert("用户名称长度必须在3-8之间！");
					return;
				}
				var upwd = $("#user_password").val();
				if (upwd.trim().length == 0) {
					alert("密码不能为空！");
					return;
				}
				if (upwd.trim().length < 6 || upwd.trim().length > 20) {
					alert("密码长度必须在6-20之间！");
					return;
				}
				/* <!-- onkeydown     */
				/* var uage = $("#user_age").val();
				if(uage<0){
					
				} */
				var intime = $("#user_intime").val();
				if (intime.trim().length == 0) {
					alert("入职日期不能为空！");
					return;
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
				$.ajax({
					url : "users.do?m=nameTest",
					type : "post",
					data : {
						name : loginName
					},
					dataType : "text",
					success : function(res) {
						if (res != 1) {
							alert(res);
						} else {
							alert("新增成功！");
							document.form.submit();
						}
					},
					error : function() {
					}
				});
			}
		});
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">表单</a></li>
		</ul>
	</div>
	<form action="users.do?m=add" method="post" name="form">
		<div class="formbody" align="center">
			<h1 class="formtitle">
				<span>添加用户</span>
			</h1>
			<table class="forminfo" name="table">
				<tr>
					<td>登录账号:</td>
					<td><input name="user_id" id="user_id" type="text"
						class="dfinput" /></td>
					<td><i>唯一性验证</i></td>
				</tr>
				<tr>
					<td>用户名称:</td>
					<td><input name="user_name" id="user_name" type="text"
						class="dfinput" /></td>
					<td><i>长度验证大于3个 小于8个字符</i></td>
				</tr>
				<tr>
					<td>用户密码:</td>
					<td><input name="user_password" id="user_password"
						type="password" class="dfinput" /></td>
					<td><i>长度验证大于6个 小于20个字符</i></td>
				</tr>
				<tr>
					<td align="right" style="font-size:13px;">性别:&nbsp;&nbsp;</td>
					<td><input type="radio" name="user_sex" value="0"
						checked="checked">男<input type="radio" value="1"
						name="user_sex">女</td>
				</tr>
				<tr>
					<td align="right" style="font-size:13px;">年龄:&nbsp;&nbsp;</td>
					<td><input type="text" class="dfinput" value=""
						onkeyup="ageTest(this.value)" name="user_age" id="user_age">
					</td>
					<td><i>整数 最大值为120</i></td>
				</tr>
				<tr>
					<td>用户角色:</td>
					<td><select name="role_id" id="role_id">
							<c:forEach items="${list }" var="i">
								<option value="${i.ROLE_ID }">${i.ROLE_NAME}</option>
							</c:forEach>
					</select></td>
					<td></td>
				</tr>
				<tr>
					<td>入职时间:</td>
					<td><input name="user_intime" id="user_intime"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"
						class="dfinput" /></td>
					<td><i>必填</i></td>
				</tr>

				<tr>
					<td>使用状态：</td>
					<td><input type="radio" value="0" name="user_state"
						checked="checked">正常 <input type="radio" value="1"
						name="user_state">冻结</td>
					<td></td>
				</tr>
				<tr>
					<td align="right" style="font-size:13px;">邮箱:&nbsp;&nbsp;</td>
					<td><input type="text" class="dfinput" id="user_email"
						name="user_email">
					</td>
					<td><i>正规邮箱的验证</i></td>
				</tr>
				<tr>
					<td align="center" style="font-size:13px;">联系电话:</td>
					<td><input type="text" class="dfinput" id="user_phone"
						name="user_phone">
					</td>
					<td><i>正规电话号码的验证</i></td>
				</tr>
				<tr>
					<td></td>
					<td><input name="homePageSave" id="homePageSave" type="button"
						class="btn" value="确认保存">&nbsp;&nbsp;&nbsp; <input
						name="homePageButton" type="button" class="btn" value="返回"
						onclick="javascript:if(confirm('确认返回？')) history.go(-1);else return;">
					</td>
					<td></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
