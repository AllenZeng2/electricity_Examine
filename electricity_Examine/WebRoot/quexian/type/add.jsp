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
	function ckDefectName(val) {
			$.ajax({
				url : "defect.do?param=ckDefectName",
				type : "post",
				data : {
					defect_name : val
				},
				dataType : "json",
				success : function(res) {
					if (res == null || res == "") {
						$("#sp_task_number").html("缺陷类型可用");
					} else {
						$("#sp_task_number").html("缺陷类型已存在");
					}
				},
				error : function() {
					alert("error:ajax");
				}
			});
	}
	function ckDefectName1(){
		var objV = $("#defect_name").val(); 
		if (objV == null || objV == "") {
			$("#sp_task_number").html("缺陷类型不能为空");
		}else{
		 	ckDefectName(objV);
		}
	}
	function ckForm(){
		if(!confirm("确认提交？"))
			return false;
		ckDefectName1();		
		if($("#sp_task_number").html()=="缺陷类型可用"){
			alert("新增成功");
			return true;
		}else
			return false;
	}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>缺陷管理</li>
			<li>缺陷类型设置</li>
			<li>增加缺陷类型</li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>基本信息</span>
		</div>
		<ul class="forminfo">
			<form action="defect.do?param=addDefect" method="post" name="form"
				onsubmit="return ckForm()">
				
				<input type="hidden" name="creatPerson"
					value="${sessionScope.user }" />
				<li><label>缺陷类型名称</label><input name="defect_name"
					id="defect_name" onblur="ckDefectName1()" type="text"
					class="dfinput" /> <i id="sp_task_number"></i>
				</li>
				<li><label>启用状态</label><cite><input name="defect_static"
						type="radio" value="0" checked="checked" />启用&nbsp;&nbsp;&nbsp;&nbsp;<input
						name="defect_static" type="radio" value="1" />禁用</cite>
				</li>
				<li><label>&nbsp;</label><input name="homePageSave"
					type="submit" class="btn" value="确认保存" />
				</li>
			</form>
		</ul>
	</div>
</body>
</html>

