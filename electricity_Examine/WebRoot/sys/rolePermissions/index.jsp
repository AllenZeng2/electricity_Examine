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
<script type="text/javascript">
	if ("${sessionScope.user}" == "") {
		parent.location.href = "login.jsp";
	}
</script>
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
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {

		$(".select3").uedSelect({
			width : 120

		});
	});
</script>

<script type="text/javascript">
	function init(id) {
		if (id == 0) {
			$("#ajaxmenu").html("");
			return;
		}
		$
				.ajax({
					url : "role.do?m=rp",
					type : "post",
					data : {
						id : id,
					},
					dataType : "json",
					success : function(res) {
						var txt = "";
						txt += "<tr><td>";
						txt += "<p class='h1'>赋角色权限:</p> ";
						for ( var i = 0; i < res.menus.length; i++) {

							if (res.menus[i].menu_FATHERID == 0) {
								txt += "&nbsp;&nbsp;&nbsp;<input type=checkbox id='f"
										+ res.menus[i].menu_ID
										+ "' value='"
										+ res.menus[i].menu_ID
										+ "' name='menu' onclick='quanxuan("
										+ res.menus[i].menu_ID
										+ ");'/>"
										+ res.menus[i].menu_NAME + "<br />";
							}

							for ( var j = 0; j < res.menus.length; j++) {
								if (res.menus[j].menu_FATHERID == res.menus[i].menu_ID) {
									txt += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id='c"
											+ res.menus[j].menu_ID
											+ "' type='checkbox' value='"
											+ res.menus[j].menu_ID
											+ "' name='menu' class='zi"
											+ res.menus[i].menu_ID
											+ "' onclick='checkeDel("
											+ res.menus[j].menu_FATHERID
											+ ");'/>"
											+ res.menus[j].menu_NAME
											+ "<br />";
								}
							}
						}
						txt += "</td></tr>";
						$("#ajaxmenu").html(txt);
						for ( var i = 0; i < res.menus.length; i++) {
							if (res.r != null) {
								for ( var m = 0; m < res.r.menus.length; m++) {
									if (res.r.menus[m].menu_ID == res.menus[i].menu_ID) {
										$("#c" + res.r.menus[m].menu_ID).attr(
												"checked", "checked");
										$("#f" + res.r.menus[m].menu_ID).attr(
												"checked", "checked");
									}
								}
							}
						}

						var txtr = "";
						for ( var r = 0; r < res.role.length; r++) {
							txtr += "<option value='"+ res.role[r].role_ID+"'>"
									+ res.role[r].role_NAME + "</option>";
						}
						$("#role_id").html(
								"<option value='0' checked='checked'>--请选择角色--</option>"
										+ txtr);
					},
					error : function() {
					}
				});
	}
</script>
<script type="text/javascript">
	function quanxuan(id) {
		var quans = document.getElementsByClassName("zi" + id);
		for ( var i = 0; i < quans.length; i++) {
			quans[i].checked = document.getElementById("f" + id).checked;
		}
	}
	function checkeDel(id) {
		var count = 0;
		var alls = document.getElementsByClassName("zi" + id);
		for ( var i = 0; i < alls.length; i++) {
			if (alls[i].checked) {
				count++;
			}
		}
		if (count <= 0) {
			document.getElementById("f" + id).checked = document
					.getElementsByClassName("zi" + id).checked;
		}
		if (count > 0) {
			document.getElementById("f" + id).checked = "checked";
		}
	}
	function tijiao() {
		alert("修改成功！");
		$.ajax({
			url : "role.do?param=ap&id=" + $("#role_id").val(),
			type : "post",
			data : $("#form").serialize(),
			dataType : "text",
			success : function(res) {
			},
			error : function() {
			}
		});
	}
</script>

</head>

<body class="sarchbody">

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">系统管理</a>
			</li>
			<li><a href="#">角色权限配置</a>
			</li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<form class="f1" id="form" name="form">
				<table class="tablelist3" name="table">
					<tr>
						<td>
							<ul class='seachform1'>
								<li>
									<div class='vocation'>
										<select name='role_id' id='role_id' class='select3'
											onchange="init(this.value)">
											<option value='0' checked='checked'>--请选择角色--</option>
											<c:forEach items="${list }" var="i">
												<option value='${i.ROLE_ID }' checked='checked'>${i.ROLE_NAME
													}</option>
											</c:forEach>
										</select>
									</div>
								</li>
								<li><input name='homePageSave' type="button"
									onclick="javascript:if(confirm('确认保存？')) tijiao();else return;"
									class='scbtn1' value='保存配置' /></li>
							</ul>
							</div>
							</div></td>
					</tr>
					<tbody id="ajaxmenu"></tbody>
				</table>
			</form>
</body>
</html>
