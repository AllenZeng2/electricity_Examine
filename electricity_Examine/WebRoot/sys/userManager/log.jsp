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
					url : "users.do?log=see",
					type : "post",
					data : {
						pageNum : pageNum,
						log1 : $("#log_date1").val(),
						log2 : $("#log_date2").val(),
						id :
<%=request.getParameter("id")%>
	},
					dataType : "json",
					success : function(res) {
						var txt = "";
						for ( var i = 0; i < res.list.length; i++) {
							txt += "<tr>";
							txt += "<td>" + res.list[i].log_ID + "</td>";
							txt += "<td>" + res.list[i].log_USERNAME + "</td>";
							txt += "<td>" + res.list[i].log_DOING + "</td>";
							txt += "<td>" + res.list[i].log_DATE + "</td>";
							txt += "</tr>";
						}
						$("#ajaxlog").html(txt);
						if (res.pi.totalCount == 0) {
							$("#ajaxlog").html("没有可显示的内容");
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
					}
				});
	}
</script>

<script type="text/javascript">
	function back() {
		location.href = "index.html";
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

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">系统设置</a></li>
		</ul>
	</div>

	<div class="formbody">

		<form name="form">
			<div id="usual1" class="usual">
				<ul class="seachform1">

					<li><label>操作时间</label> <input name="log_date" id="log_date1"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"
						type="text" value="" class="scinput1" />- <input name="log_date"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"
						id="log_date2" type="text" value="" class="scinput1" />
					</li>
					<li>
						<li><input type="button" onclick="init(1);" class="scbtn"
							value="查询" name="homePageSelect" />
					</li>
				</ul>
		</form>
		<div class="formtitle">
			<span>log日志</span>
		</div>

		<table class="tablelist" name="table">
			<thead>
				<tr>
					<th>序号</th>
					<th>用户名称</th>
					<th>操作信息</th>
					<th>操作时间</th>
				</tr>
			</thead>

			<tbody id="ajaxlog">
			</tbody>
		</table>

		<table class="tablelist2">
			<tr>
				<th id="spanPage"></th>
				</div>
				</div>
</body>
</html>
