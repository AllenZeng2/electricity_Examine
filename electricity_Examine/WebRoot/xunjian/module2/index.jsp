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
	$(function() {
		init(1);
	});

	function init(pageNum) {
		$
				.ajax({
					url : "task.do?param=getTasksm2",
					type : "post",
					data : {
						task_number : $("#task_number").val(),
						task_state : $("#task_static").val(),
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
								txt += "<td>" + res.list[i].task_NUMBER
										+ "</td>";
								txt += "<td>" + res.list[i].task_NAME + "</td>";
								txt += "<td>" + res.list[i].line.lineName
										+ "</td>";
								txt += "<td>" + res.list[i].task_BEGINPOLE
										+ "</td>";
								txt += "<td>" + res.list[i].task_ENDPOLE
										+ "</td>";
								txt += "<td>" + res.list[i].give_USERNAME
										+ "</td>";
								txt += "<td>"
										+ (res.list[i].task_BEGINTIME == null ? ""
												: res.list[i].task_BEGINTIME)
										+ "</td>";
								txt += "<td>"
										+ (res.list[i].task_STATIC == 4 ? "已完成"
												: (res.list[i].task_STATIC == 3 ? "执行中"
														: (res.list[i].task_STATIC == 2 ? "已分配"
																: "未分配")))
										+ "</td>";
								txt += "<td>"
										+ (res.list[i].task_ENDDATE == null ? ""
												: res.list[i].task_ENDDATE)
										+ "</td>";
								txt += "<td>";
								txt += "<a href='javascript:void(0)' onclick='lookTask("
										+ res.list[i].task_ID
										+ ")' class='tablelink'>查看</a>";
								if (res.list[i].task_STATIC == 2) {
									txt += " | ";
									txt += "<a href='javaScript:void(0)' onclick='zhixing("
											+ res.list[i].task_ID
											+ ","
											+ res.pi.pageNum
											+ ")' class='tablelink'>执行</a>";
								}
								if (res.list[i].task_STATIC == 3) {
									txt += " | ";
									txt += "<a href='enter.html' class='tablelink'>回执录入</a>";
								}
								txt += "</td>";
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
	function lookTask(id) {
		location.href = "task.do?param=selectTask2ById&task_id=" + id;
	}
	function zhixing(id, num) {
		if (confirm("确认执行？")) {
			$.ajax({
				url : "task.do?param=share",
				type : "post",
				data : {
					task_id : id
				},
				dataType : "json",
				success : function(res) {
					alert("执行成功");
					init(num);
				},
				error : function() {
					alert("error:ajax_task");
				}
			});
		}
	}
</script>
</head>

<body class="sarchbody">
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>巡检任务管理</li>
			<li>巡检任务执行与回执</li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<ul class="seachform1">
				<form name="form">
					<li><label>任务编号</label><input id="task_number"
						name="task_number" type="text" class="scinput1" value="" /></li>
					<li><label>任务状态</label>
						<div class="vocation">
							<select class="select3" name="task_static" id="task_static">
								<option value="0" selected="selected">-请选择-</option>
								<option value="2">已分配</option>
								<option value="3">执行中</option>
								<option value="4">已完成</option>
							</select>
						</div>
					</li>
					<li><input type="button" class="scbtn" name="homePageSelect"
						onclick="init(1)" value="查询" />&nbsp;
				</form>
				</li>

			</ul>
			<script type="text/javascript">
				$(document).ready(function() {
					$(".scbtn1").click(function() {
						$(".seachform2").fadeIn(200);
					});

				});
			</script>
			<table class="tablelist" name="table1">
				<thead>
					<tr>
						<th>任务编号</th>
						<th>任务名称</th>
						<th>巡检线路</th>
						<th>起始杆号</th>
						<th>终止杆号</th>
						<th>下发人</th>
						<th>下发时间</th>
						<th>任务状态</th>
						<th>任务完成时间</th>
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
</body>

</html>
