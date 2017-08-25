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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/editor/kindeditor.js"></script>
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
			var uname = $("#menu_name").val();
			if (uname.trim().length == 0) {
				alert("菜单名不能为空！");
				return;
			}
			if (uname.trim().length > 20) {
				alert("菜单名不能超过20个字符");
				return;
			}
			var url = $("#menu_url").val();
			var sel = $("#menu_fatherid").val();
			if (sel != 0 && url.trim().length == 0) {
				alert("请输入路径");
				return;
			}

			if (confirm("确认新增吗？")) {
				$.ajax({
					url : "menu.do?m=nameTest",
					type : "post",
					data : {
						uname : uname
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
	$(function() {

		change(0);

	});
	function change(v) {
		if (v == 0) {
			$("#menu_url").val("无路径");
			$("#menu_url").attr("readonly", "readonly");
		} else {
			$("#menu_url").removeAttr("readonly");
			$("#menu_url").val("");
		}

	}
</script>
</head>

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
		<form action="menu.do?m=add" method="post" id="form" name="form">
			<div class="formtitle">
				<span>增加菜单</span>
			</div>
			<ul class="forminfo">
				<li><label>菜单名称</label><input name="menu_name" id="menu_name"
					type="text" class="dfinput" /><i>名称不能超过20个字符,字符串唯一验证</i>
				</li>
				<li><label>父级菜单</label>
					<div>
						<select name="menu_fatherid" id="menu_fatherid" class="dfinput"
							onchange="change(this.value)">
							<option value="0">无</option>
							<c:forEach items="${list }" var="i">
								<c:if test="${i.MENU_FATHERID==0 }">
									<option value="${i.MENU_ID }" id="m${i.MENU_ID }">${i.MENU_NAME
										}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</li>
				<li><label>菜单路径</label><cite><input name="menu_url"
						id="menu_url" type="text" class="dfinput" />
				</li>
				<li><label>菜单状态</label><cite><input name="menu_state"
						type="radio" value="0" checked="checked" />启用&nbsp;&nbsp;&nbsp;&nbsp;<input
						name="menu_state" type="radio" value="1" />禁用</cite>
				</li>
				<li><label>&nbsp;</label><input name="homePageSave"
					id="homePageSave" type="button" class="btn" value="确认保存" />
				</li>

			</ul>
	</div>

	</form>

</body>

</html>

