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
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/
css/style.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/
css/select.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/
js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/
js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/
js/select-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/
editor/kindeditor.js"></script>
<script type="text/javascript">
	if ("${sessionScope.user}" == "") {
		parent.location.href = "login.jsp";
	}
</script>
<script type="text/javascript">
	function queding(page) {
		$("#go").val($("#go").val().replace(/[^\d]/g, ''));
		if ($("#go").val() > page) {
			$("#go").val(page);
		}
		if ($("#go").val() < 1) {
			$("#go").val(1);
		}
		var pageNum = $("#go").val();
		init(pageNum);
	}

	$(function() {

		init(1);

	});

	function init(pageNum, state) {
		$
				.ajax({
					url : "role.do",
					type : "post",
					data : {
						rname : $("#role_name").val(),
						pageNum : pageNum,
						state : $("#role_state").val()
					},
					dataType : "json",
					success : function(res) {
						var txt = "";
						for ( var i = 0; i < res.list.length; i++) {
							txt += "<tr>";
							txt += "<td>" + res.list[i].role_NUMBER + "</td>";
							txt += "<td>" + res.list[i].role_NAME + "</td>";
							txt += "<td>" + res.list[i].user_NAME + "</td>";
							txt += "<td>" + res.list[i].role_UPDATETIME
									+ "</td>";
							txt += "<td>" + res.list[i].role_CREATETIME
									+ "</td>";
							txt += "<td>"
									+ (res.list[i].role_STATE == 0 ? "启用"
											: "未启用") + "</td>";
							txt += "<td>";
							txt += "<a href='role.do?m=up&id="
									+ res.list[i].role_ID
									+ "' class='tablelink'>修改</a>";
							txt += " | ";
							txt += "<a href='javascript:void(0)' onclick='del("
									+ res.list[i].role_ID + ","
									+ res.pi.pageNum
									+ ");' class='tablelink'> 删除</a>";
							txt += "</td>";
							txt += "</tr>";
						}
						$("#ajaxrole").html(txt);
						if (res.pi.totalCount == 0) {
							$("#ajaxrole").html("没有可显示的内容");
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
							txt1 += "<input type='text' id='go' class='scinput5' name='pageGo' />页 &nbsp;&nbsp;";
							txt1 += "<input type='button' id='sure' onclick='queding("
									+ res.pi.totalPage
									+ ")' class='scbtn5' name='pageSure' value='确定' />&nbsp;&nbsp;&nbsp;&nbsp;";
							$("#spanPage").html(txt1);
						}
					},
				});
	}
</script>

<script type="text/javascript">
	<dd></dd>
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {

		$(".select3").uedSelect({
			width : 100
		});
	});
</script>
</head>

<body class="sarchbody">
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>系统管理</li>
			<li>角色管理</li>

		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">



			<ul class="seachform1">
				<form name="form">
					<li><label>角色名称</label><input name="role_name" id="role_name"
						type="text" class="scinput1" value="" />
					</li>
					<li><label>启用状态</label>
						<div class="vocation">
							<select class="select3" name="role_state" id="role_state">
								<option value="0">启用</option>
								<option value="1">未启用</option>
							</select>
						</div></li>
					<li><input name="homePageSelect" type="button"
						onclick="init(1);" class="scbtn" value="查询" />&nbsp;
				</form>
				<input name="homePageInsert" id="add" type="button" class="scbtn1"
					value="添加角色" />
				</li>

			</ul>
			<script type="text/javascript">
				$(document).ready(function() {
					$(".scbtn1").click(function() {
						$(".seachform2").fadeIn(200);
					});

					$('#add').click(function() {
						location.href = "sys/roleManager/add.jsp";
					});

				});

				function del(id) {
					confirm("确认删除？");
				}
			</script>
			<table class="tablelist">
				<thead>
					<tr>

						<th>角色编号</th>
						<th>角色名称</th>
						<th>创建人</th>
						<th>更新时间</th>
						<th>创建时间</th>
						<th>状态(启用/未启用)</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="ajaxrole">
				</tbody>
			</table>
			<script type="text/javascript">
				function del(id) {
					if (confirm("确认删除？")) {
						alert("删除成功！");
						location.href = "role.do?m=del&id=" + id;
					}
				}
			</script>
			<table class="tablelist2" name="table">
				<tr>
					<th id="spanPage"></th>
				</tr>
			</table>

		</div>
	</div>
</body>

</html>
