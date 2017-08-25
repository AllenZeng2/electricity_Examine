<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		}else if(objV=="${d.DEFECT_NAME}"){
		 	$("#sp_task_number").html("");
		}else{
			ckDefectName(objV);
		}
	}
	function ckForm(){
		if(!confirm("确认提交？"))
			return false;
		ckDefectName1();		
		if($("#sp_task_number").html()=="缺陷类型可用"||$("#sp_task_number").html()==""){
			alert("修改成功");
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
			<li>修改缺陷类型</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>基本信息</span>
		</div>

		<ul class="forminfo">
			<form action="defect.do?param=updateDefect" method="post"
				onsubmit="return ckForm()" name="form">
				<input type="hidden" name="creatPerson"
					value="${sessionScope.user }" />
				<input type="hidden" name="defect_id" value="${d.DEFECT_ID}"/>
				<li><label>缺陷类型名称</label><input name="defect_name" type="text"
					id="defect_name" class="dfinput" onblur="ckDefectName1()"
					value="${d.DEFECT_NAME}" /><i id="sp_task_number"></i>
				</li>
				
				<li><label>启用状态</label><cite> <input
						name="defect_static" type="radio" value="0"
						<c:if test="${d.DEFECT_STATE==0 }">checked="checked"</c:if> />启用&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="defect_static" type="radio" value="1"
						<c:if test="${d.DEFECT_STATE==1 }">checked="checked"</c:if> />禁用</cite>
				</li>
				<li><label>&nbsp;</label><input name="homePageSave"
					type="submit" class="btn" value="确认保存" />
				</li>
			</form>
		</ul>


	</div>

	<div style="color:red">缺陷类型名称一旦改变，使用了此缺陷类型的巡检或者消缺也将改变</div>
</body>

</html>

