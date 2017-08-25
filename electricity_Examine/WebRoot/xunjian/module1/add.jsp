<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script src="js/time.js" language="javascript"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	if ("${sessionScope.user}" == "") {
		parent.location.href = "login.jsp";
	}
	function ck_task_number() {
		var objN = $("#task_number").val();
		if (objN !== null && objN !== "") {
			$.ajax({
				url : "task.do?param=ck_task_number",
				type : "post",
				data : {
					task_number : objN
				},
				dataType : "json",
				success : function(res) {
					if (res == null || res == "") {
						$("#sp_task_number").html("√");
					} else {
						$("#sp_task_number").html("任务编号已存在");
					}
				},
				error : function() {
					alert("error1");
				}
			});
		} else {
			$("#sp_task_number").html("任务编号不能为空");
		}
	}
	function ck_task_name() {
		var objN = $("#task_name").val();
		if (objN !== null && objN !== "") {
			$.ajax({
				url : "task.do?param=ck_task_name",
				type : "post",
				data : {
					task_name : objN
				},
				dataType : "json",
				success : function(res) {
					if (res == null || res == "") {
						$("#sp_task_name").html("√");
					} else {
						$("#sp_task_name").html("任务名称已存在");
					}
				},
				error : function() {
					alert("error2");
				}
			});
		} else {
			$("#sp_task_name").html("任务名称不能为空");
		}
	}
	$(function() {
		ckPole($("#line_number").val());
	});
	function ckPole(num) {
		$
				.ajax({
					url : "task.do?param=ckPole",
					type : "post",
					data : {
						line_id : num
					},
					dataType : "json",
					success : function(res) {
						$("#pole_start").val(res.pole_start);
						var txt = "";
						for ( var i = 0; i < res.pole_end.length; i++) {
							txt += "<option >" + res.pole_end[i] + "</option>";
						}
						if (res.pole_end.length != 0) {
							$("#pole_stop").html(txt);
						} else {
							$("#pole_stop")
									.html(
											"<option value='0'>没有可操作的终止杆！请扩展杆号或选择其他线路</option>");
						}
					},
					error : function() {

					}
				});
	}
	function fanhui() {
		if (confirm("确认返回")) {
			location.href = "xunjian/module1/index.jsp";
			//location.href = "javascript:history.go(-1)";
		}
	}
	function baocun() {
		ck_task_name();
		ck_task_number();
		if ($("#sp_task_name").html() == "√"
				&& $("#sp_task_number").html() == "√"
				&& $("#pole_stop").val() != 0
				&& $("#sp_xjstoptime").html() == "√") {
			tijiao();
		}
	}
	function tijiao() {
		$.ajax({
			url : "task.do?param=addTask",
			type : "post",
			data : $("#form").serialize(),
			dataType : "json",
			success : function(res) {
				alert("保存成功");
				location.href = "xunjian/module1/index.jsp";
			},
			error : function() {
				alert("error:ajax_xunjian/module1/add.jsp");
			}
		});
	}
	function ck_xjstoptime() {
		$("#sp_xjstoptime").html("");
		if ($("#xjstoptime").val() != "") {
			var end = $("#xjstoptime").val();
			var t1 = new Date(Date.parse(end.replace(/-/g, "/"))).getTime();
			var t2 = new Date().getTime();
			if (t1 > (t2 + 3600000)) {
				$("#sp_xjstoptime").html("√");
			} else {
				$("#sp_xjstoptime").html("mmp !! 给1个小时巡检啊");
			}
		}
	}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>巡检任务管理</li>
			<li>巡检任务制定与分配</li>
			<li>制定巡检任务</li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>制定巡检任务</span>
		</div>
		<ul class="forminfo">
			<form name="form" id="form">
				<input type="hidden" name="creatPerson"
					value="${sessionScope.user }" />
				<li><label>巡检线路</label> <select class="dfinput"
					id="line_number" onchange="ckPole(this.value)" name="line_number">
						<c:forEach items="${lines}" var="l">
							<option value="${l.lineId}">${l.lineName }</option>
						</c:forEach>
				</select>
				</li>
				<li><label>任务编号</label><input name="task_number"
					onblur="ck_task_number()" id="task_number" type="text"
					class="dfinput" /><i id="sp_task_number"></i>
				</li>
				<li><label>任务名称</label><input name="task_name"
					onblur="ck_task_name()" id="task_name" type="text" class="dfinput" /><i
					id="sp_task_name"></i>
				</li>

				<li><label>巡检员</label> <c:forEach items="${users }" var="u">
						<input name="user_id" type="radio" value="${u.USER_NAME }" />${u.USER_NAME }
				</c:forEach> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<i
					id="sp_user_id"></i></li>
				<li><label>起始杆号</label><input name="pole_start" id="pole_start"
					type="text" class="dfinput" readonly="readonly" />
				</li>
				<li><label>终止杆号</label><select class="dfinput" id="pole_stop"
					name="pole_stop"></select>
				</li>
				<li><label>巡检结束日期</label><input name="xjstoptime"
					id="xjstoptime" type="text" onblur="ck_xjstoptime()"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"
					class="dfinput" value="" /> <i id="sp_xjstoptime"></i></li>
				<li><label>下发人</label><input name="user_loginname" type="text"
					readonly="readonly" value="${user.USER_NAME }" />
				</li>
				<li><label>下发日期</label><span name="task_xiafadate"> <a
						class="date" id="currentime"></a> <a id="h1"></a><a id="h2"
						style="margin-left: -1"></a><a style="margin-left: 1">:</a> <a
						id="m1"></a><a id="m2" style="margin-left: -1"></a><a
						style="margin-left: 1">:</a> <a id="s1"></a><a id="s2"
						style="margin-left: -1"></a> </span>
				</li>
				<li><label>备注</label> <textarea class="dfinput"
						name="task_remark"></textarea>
				<li><label>&nbsp;</label> <input name="homePageSave"
					id="homePageSave" type="button" onclick="baocun()" class="btn"
					value="保存" /> <input name="homePageButton" type="button"
					id="homePageButton" onclick="fanhui()" class="btn" value="返回" />
				</li>
			</form>
		</ul>

	</div>

</body>

</html>
