<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
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
<script type="text/javascript">
	function dian(id) {
		$.ajax({
			url : "users.do?m=state",
			type : "post",
			data : {
				id : id
			},
			dataType : "text",
			success : function(res) {
				$("#s" + id).html(res == 0 ? "冻结" : "启用");
				$("#u" + id).html(res == 0 ? "启用" : "冻结");
			},
			error : function() {
			}
		});
	}

	function valueTest(page) {
		$("#go").val($("#go").val().replace(/[^\d]/g, ''));
		if ($("#go").val() > page) {
			$("#go").val(page);
		}
		if ($("#go").val() < 1) {
			$("#go").val(1);
		}
	}
	function queding() {
		var pageNum = $("#go").val();
		init(pageNum);
	}
	$(function() {

		init(1);

	});

	function init(pageNum) {
		$
				.ajax({
					url : "users.do?m=s",
					type : "post",
					data : {
						uname : $("#user_name").val(),
						pageNum : pageNum,
						state : $("#user_state").val()
					},
					dataType : "json",
					success : function(res) {
						var txt = "";
						for ( var i = 0; i < res.list.length; i++) {
							txt += "<tr>";
							txt += "<td>" + res.list[i].user_LOGINNAME
									+ "</td>";
							txt += "<td>" + res.list[i].user_NAME + "</td>";
							txt += "<td>" + res.list[i].roles.role_NAME
									+ "</td>";
							txt += "<td>" + res.list[i].user_EMAIL + "</td>";
							txt += "<td>" + res.list[i].user_LOGINTIME + "</td>";
							txt += "<td><span id='u"+res.list[i].user_ID+"'>"
									+ (res.list[i].user_STATE == 0 ? "启用"
											: "冻结") + "</span></td>";

							txt += "<td>";
							txt += "<a href='javaScript:void(0)' id='s"
									+ res.list[i].user_ID
									+ "' onclick='dian("
									+ res.list[i].user_ID
									+ ")' class='tablelink'>"
									+ (res.list[i].user_STATE == 0 ? "冻结"
											: "启用") + "</a>";
							txt += "<a href='users.do?m=up&id="
									+ res.list[i].user_ID
									+ "' class='tablelink'>|修改|</a>";
							txt += "<a href='javascript:void(0)' onclick='del("
									+ res.list[i].user_ID
									+ ")' class='tablelink'>删除|</a>";
							txt += "<a href='sys/userManager/log.jsp?id="
									+ res.list[i].user_ID
									+ "'  class='tablelink'> LOG日志</a>";
							txt += "</td>";
							txt += "</tr>";
						}
						$("#ajaxusers").html(txt);
						if (res.pi.totalCount == 0) {
							$("#ajaxusers").html("没有可显示的内容");
						} else {
							var txt1 = "";
							txt1 += "共" + res.pi.totalCount + "条记录 当前："
									+ res.pi.pageNum + "/" + res.pi.totalPage
									+ "页&nbsp;&nbsp;";
							if (res.pi.pageNum == 1) {
								txt1 += "首页&nbsp;上一页&nbsp; ";
							} else if (res.pi.pageNum > 1) {
								txt1 += "<a href='javascript:void(0)' onclick='init(1)' name='pageFirst'>首页</a>";
								txt1 += "<a href='javascript:void(0)' onclick='init("
										+ (res.pi.pageNum - 1)
										+ ")' name='pageUp' id='pageUp' >上一页&nbsp;</a>";
							}
							if (res.pi.pageNum == res.pi.totalPage) {
								txt1 += "下一页&nbsp;尾页&nbsp;";
							} else if (res.pi.pageNum < res.pi.totalPage) {
								txt1 += "<a href='javascript:void(0)' onclick='init("
										+ (res.pi.pageNum + 1)
										+ ")' name='pageNext' id='pageNext' >下一页&nbsp;</a>";
								txt1 += "<a href='javascript:void(0)' onclick='init("
										+ res.pi.totalPage
										+ ")' name='pageEnd' id='pageEnd' >尾页</a> &nbsp;&nbsp;跳到:";
							}
							txt1 += "<input type='text' onkeyup='valueTest("
									+ res.pi.totalPage
									+ ")' id='go' class='scinput5' name='pageGo' />页 &nbsp;&nbsp;";
							txt1 += "<input type='button' id='sure' onclick='queding()' class='scbtn5' name='pageSure' value='确定' />&nbsp;&nbsp;&nbsp;&nbsp;";
							$("#spanPage").html(txt1);
						}
					},
					error : function() {
					}
				});
	}
</script>
<script type="text/javascript">
	function del(id) {
		if (confirm("确认删除？")) {
			alert("删除成功");
			location.href = "users.do?m=del&id=" + id;
		}
	}

	function Dongjie() {
		confirm("确定冻结用户？");
	}
	function Qiyong() {
		confirm("确认启动用户？");
	}

	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {

		$(".select3").uedSelect({
			width : 152
		});
	});
</script>
</head>

<body class="sarchbody">

	<script language="javascript">
		$(document).ready(function() {
			$(".scbtn1").click(function() {
				if ($(".seachform2").hasClass("hideclass")) {
					$(".seachform2").removeClass("hideClass");
				} else {
					$(".seachform2").addClass("hideClass");
				}
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$(".scbtn1").click(function() {
				$(".seachform2").fadeIn(200);
			});
		});
	</script>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a>
			</li>
			<li><a href="#">系统设置</a>
			</li>
		</ul>
	</div>
	<div class="formbody">
		<form name="form">
			<div id="usual1" class="usual">
				<ul class="seachform1">

					<li><label>用户名称</label> <input name="user_name" id="user_name"
						type="text" value="" class="scinput1" /></li>
					<li><label>用户状态</label>
						<div class="vocation">
							<select class="select3" name="user_state" id="user_state">
								<option value="-1">-请选择-</option>
								<option value="0">启用</option>

								<option value="1">未启用</option>

							</select>
						</div></li>
					<li><input type="button" onclick="init(1);" class="scbtn"
						value="查询" name="homePageSelect" /> <input type="button"
						class="scbtn" value="添加" onclick="location.href='users.do?m=a'"
						name="homePageInsert" />
		</form>
		</li>
		</ul>
		<div class="formtitle">
			<span>用户信息</span>
		</div>

		<table class="tablelist" name="table">
			<thead>
				<tr>
					<th>用户账号</th>
					<th>用户名称</th>
					<th>角色</th>
					<th>邮箱</th>
					<th>最后登录时间</th>
					<th>状态（正常/冻结）</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="ajaxusers">
			</tbody>
		</table>
		<table class="tablelist2">
			<tr>
				<th id="spanPage"></th>
			</tr>
		</table>

	</div>
	</div>
</body>
</html>

