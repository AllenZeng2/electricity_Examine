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
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
	$(document).ready(function(e) {

		$(".select3").uedSelect({
			width : 100
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		init(1);
	});
	function init(pageNum) {
		$
				.ajax({
					url : "defect.do?param=getDefects",
					type : "post",
					data : {
						dname : $("#defect_name").val(),
						pageNum : pageNum
					},
					dataType : "json",
					success : function(res) {
						if (res.list == null || res.list == "") {
							$("#ajaxhtml").html("没有可显示的内容");
							var txt1 = "";
							$("#spanPage").html(txt1);
						} else {
							var txt = "";
							for ( var i = 0; i < res.list.length; i++) {
								txt += "<tr>";
								txt += "<td>" + res.list[i].defect_NAME
										+ "</td>";
								txt += "<td>"
										+ (res.list[i].defect_STATE == 1 ? "禁用"
												: "启用") + "</td>";
								if (res.list[i].defect_ID != 1) {
									txt += "<td>";
									txt += "<a href='javascript:void(0)' onclick='updateDefect("
											+ res.list[i].defect_ID
											+ ")' class='tablelink'>修改</a>";
									txt += " | ";
									txt += "<a href='javascript:void(0)' onclick='deleteDefect("
											+ res.list[i].defect_ID
											+ ","
											+ res.pi.pageNum
											+ ","
											+ res.pi.totleCount
											+ ")' class='tablelink'> 删除</a>";
									txt += "</td>";
								}
								txt += "</tr>";
							}
							$("#ajaxhtml").html(txt);
							var txt1 = "";
							txt1 += "共" + res.pi.totleCount + "条记录 当前："
									+ res.pi.pageNum + "/" + res.pi.totlePage
									+ "页&nbsp;&nbsp;";
							if (res.pi.pageNum == 1) {
								txt1 += "首页&nbsp;上一页&nbsp; ";
							} else if (res.pi.pageNum > 1) {
								txt1 += "<a href='javascript:void(0)' onclick='init(1)' name='pageFirst' id='pageFirst' >首页</a>";
								txt1 += "<a href='javascript:void(0)' onclick='init("
										+ (res.pi.pageNum - 1)
										+ ")' name='pageUp' id='pageUp'>&nbsp;上一页&nbsp;&nbsp;</a>";
							}
							if (res.pi.pageNum == res.pi.totlePage) {
								txt1 += "下一页&nbsp;尾页&nbsp;&nbsp;跳到:";
							} else if (res.pi.pageNum < res.pi.totlePage) {
								txt1 += "<a href='javascript:void(0)' onclick='init("
										+ (res.pi.pageNum + 1)
										+ ")' name='pageNext' id='pageNext' >下一页&nbsp;</a>";
								txt1 += "<a href='javascript:void(0)' onclick='init("
										+ res.pi.totlePage
										+ ")' name='pageEnd' id='pageEnd' >尾页</a>&nbsp;&nbsp;跳到:";
							}
							txt1 += "<input type='text' value='' onkeyup='goOnkeyup(this)' id='go' class='scinput5' name='pageGo' />页 &nbsp;&nbsp;";
							txt1 += "<input type='button' id='sure' onclick='go("
									+ res.pi.totlePage
									+ ")' class='scbtn5' name='pageSure' value='确定' />&nbsp;&nbsp;&nbsp;&nbsp;";
							$("#spanPage").html(txt1);
						}
					},
					error : function() {
						$("#ajaxhtml").html("没有可显示的内容");
					}
				});

	}
	function goOnkeyup(objgo) {
		if (isNaN(objgo.value)) {
			objgo.value = "";
		}
	}
	function go(totlePage) {
		var num = $("#go").val();
		num = Math.floor(num);
		if (num > totlePage) {
			num = totlePage;
		}
		if (num < 1) {
			num = 1;
		}
		init(num);
	}
	function deleteDefect(id, num, totleCount) {
		if (confirm("确认删除吗？")) {
			$.ajax({
				url : "defect.do?param=deleteDefect",
				type : "post",
				data : {
					defect_id : id
				},
				dataType : "json",
				success : function(res) {
					alert("删除成功");
					if (num == Math.floor((totleCount + 4) / 5)
							&& totleCount % 5 == 1) {
						num = num - 1;
					}
					init(num);
				},
				error : function() {
					alert("error:ajax_delect");
				}
			});
		}
	}
	function updateDefect(id) {
		location.href = "defect.do?param=updateDefectInfo&defect_id=" + id;
	}
</script>
</head>
<body class="sarchbody">
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>缺陷管理</li>
			<li>缺陷类型设置</li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<ul class="seachform1">
				<form name="form">
					<li><label>类型名称</label><input name="defect_name"
						id="defect_name" type="text" class="scinput1" />
					</li>
					<li><input name="homePageSelect" type="button"
						onclick="init(1)" class="scbtn" value="查询" />&nbsp;
				</form>
				<input name="homePageInsert" id="add" type="button" class="scbtn1"
					onclick="javascript:location.href='quexian/type/add.jsp'"
					value="添加缺陷类型" />
				</li>
			</ul>
			<table class="tablelist" name="table1">
				<thead>
					<tr>
						<th>缺陷类型名称</th>
						<th>状态(启用/未启用)</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="ajaxhtml">
				</tbody>
			</table>
			<table class="tablelist2" name="table">
				<tr>
					<th><span id="spanPage"></span></th>
				</tr>
			</table>
		</div>
	</div>
	<div style="color:red;">
		缺陷类型的删除 数据库中只能状态删除！被删除的缺陷类型不可以再次使用，<br />但是以前记录的信息依然可以显示
	</div>
</body>

</html>
