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
					url : "defect.do?param=getDefectsLevel",
					type : "post",
					data : {
						task_number : $("#task_number").val(),
						line_number : $("#line_number").val(),
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
								txt += "<td>" + res.list[i].task.task_NUMBER
										+ "</td>";
								txt += "<td>" + res.list[i].line_number
										+ "</td>";
								txt += "<td>" + res.list[i].pole.pole_NUMBER
										+ "</td>";
								txt += "<td>" + res.list[i].defects.defect_NAME
										+ "</td>";
								txt += "<td>" + res.list[i].defect_desc
										+ "</td>";
								txt += "<td>" + res.list[i].find_date + "</td>";
								txt += "<td>" + res.list[i].find_username
										+ "</td>";
								txt += "<td><div class='vocation'><select class='select3' name='state' id='state'>";
								txt += "<option value='3' ";
								if (res.list[i].defect_level == 3)
									txt += "selected";
								txt += ">紧急</option>";
								txt += "<option value='2' ";
								if (res.list[i].defect_level == 2)
									txt += "selected";
								txt += ">严重</option>";
								txt += "<option value='1' ";
								if (res.list[i].defect_level == 1)
									txt += "selected";
								txt += ">一般</option>";
								txt += "</select></div></td>";
								txt += "<td><input name='' type='button' onclick='baocun("
										+ res.list[i].pole.pole_ID
										+ ")' class='scbtn1' value='保存'/></td>";
								txt += "</tr>";
							}
							$("#ajaxhtml").html(txt);

							var txt1 = "";
							txt1 += "共" + res.pi.totleCount
									+ "条记录 当前：<a id='ApageNum'>"
									+ res.pi.pageNum
									+ "</a>/<a id='AtotlePage'>"
									+ res.pi.totlePage + "</a>页&nbsp;&nbsp;";
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
	function baocun(id) {
		if (confirm("确认保存？")) {
			var val = $("#state").val();
			$.ajax({
				url : "defect.do?param=saveDefectLevel",
				type : "post",
				data : {
					pole_id : id,
					defect_level : val
				},
				dataType : "json",
				success : function(res) {
					alert("保存成功");
					init($("#ApageNum").html());
				},
				error : function() {
					alert("error:ajax");
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
			<li>缺陷管理</li>
			<li>缺陷类型设置</li>

		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<ul class="seachform1">
				<form name="form">
					<li><label>任务编号</label><input name="task_number"
						id="task_number" type="text" class="scinput1" value="" />
					</li>
					<li><label>线路编号</label><input name="line_number"
						id="line_number" type="text" class="scinput1" value="" />
					</li>
					<li><input type="button" class="scbtn" value="查询"
						onclick="init(1)" name="homePageSelect" />&nbsp;</li>
				</form>
			</ul>
			<table class="tablelist" name="table1">
				<thead>
					<tr>
						<th>任务编号</th>
						<th>线路编号</th>
						<th>塔杆编号</th>
						<th>缺陷类型</th>
						<th>缺陷描述</th>
						<th>发现时间</th>
						<th>发现人员</th>
						<th>缺陷级别</th>
						<th>等级确认</th>
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

	<font color="red"><h1>
			说明:确认级别后的数据在列表中不再显示
			<h1>
	</font>
</body>

</html>

