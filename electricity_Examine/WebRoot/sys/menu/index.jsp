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

	function init(pageNum) {
		$
				.ajax({
					url : "menu.do",
					type : "post",
					data : {
						mname : $("#menu_name").val(),
						pageNum : pageNum
					},
					dataType : "json",
					success : function(res) {
						var txt = "";
						for ( var i = 0; i < res.list.length; i++) {
							txt += "<tr>";
							txt += "<td>" + res.list[i].menu_ID + "</td>";
							txt += "<td>" + res.list[i].menu_NAME + "</td>";
							txt += "<td>" + res.list[i].menu_URL + "</td>";
							txt += "<td>" + res.list[i].menu_CREATETIME
									+ "</td>";
							txt += "<td>"
									+ (res.list[i].menu_STATE == 0 ? "启用"
											: "未启用") + "</td>";

							txt += "<td>";
							txt += "<a href='menu.do?m=up&id="
									+ res.list[i].menu_ID
									+ "' class='tablelink'>修改</a>";
							txt += " | ";
							txt += "<a href='javascript:void(0)' onclick='del("
									+ res.list[i].menu_ID
									+ ")' class='tablelink'> 删除</a>";
							txt += "</td>";
							txt += "</tr>";
						}
						$("#ajaxmenu").html(txt);
						if (res.pi.totalCount == 0) {
							$("#ajaxmenu").html("没有可显示的内容");
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
					error : function() {
						$("#ajaxmenu").html("没有可显示的内容");
					}
				});
	}
</script>

<script type="text/javascript">
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
			<li>菜单管理</li>

		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">



			<ul class="seachform1">
				<form name="form">
					<li><label>菜单名称</label><input name="menu_name" type="text"
						id="menu_name" class="scinput1" value="" />
					</li>
					<li><input type="button" onclick="init(1);" class="scbtn"
						value="查询" name="homePageSelect" />&nbsp;
				</form>


				<input name="homePageInsert" id="add" type="button" class="scbtn1"
					value="添加菜单" />
				</li>

			</ul>
			<script type="text/javascript">
				$(document).ready(function() {
					$(".scbtn1").click(function() {
						$(".seachform2").fadeIn(200);
					});

					$('#add').click(function() {
						location.href = "menu.do?m=a";
					});

				});

				function del(id) {
					confirm("确认删除");

				}
			</script>
			<table class="tablelist">
				<thead>
					<tr>

						<th>序号</th>
						<th>菜单名称</th>
						<th>菜单路径</th>
						<th>创建时间</th>
						<th>状态(启用/未启用)</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="ajaxmenu">
				</tbody>
			</table>
			<script type="text/javascript">
				function del(id) {
					if (confirm("确认删除？")) {
						alert("删除成功！");
						location.href = "menu.do?m=del&id=" + id;
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

