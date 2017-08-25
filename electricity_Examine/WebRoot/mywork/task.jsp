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
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>
<script type="text/javascript" src="../editor/kindeditor.js"></script>

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
			<li>我的工作平台</li>
			<li>代办列表</li>

		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">



			<ul class="seachform1">
				<form action="task.html" method="post" name="form">
					<li><label>任务名称</label><input name="task_name" type="text"
						class="scinput1" value="" />
					</li>

					<li><input type="submit" class="scbtn" value="查询"
						name="homePageSelect" />&nbsp;
				</form>


			</ul>
			<script type="text/javascript">
				$(document)
						.ready(
								function() {
									$(".scbtn1").click(function() {
										$(".seachform2").fadeIn(200);
									});

									$('#sure')
											.click(
													function() {
														var nowPage = $('#go')
																.val();
														if (nowPage != "") {
															location.href = "RoleManagerController/index.do?nowPage="
																	+ nowPage;
														}
													});

									$('#add').click(function() {
										location.href = "add.html";
									});

								});

				function del() {
					confirm("确认删除");
				}
			</script>
			<table class="tablelist">
				<thead>
					<tr>

						<th>代办任务类型</th>
						<th>代办任务名称</th>
						<th>巡检结束日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<tr>

						<td>巡查任务</td>
						<td>昌平一号线巡查任务</td>
						<td>20016-03-15 22:10:10</td>



						<td><a href="look.html" class="tablelink">查看</a> | <a
							href="../xunjian/module2/index.html" class="tablelink"> 处理</a>
						</td>
					</tr>
					<td>巡查任务</td>
					<td>通州一号线巡查任务</td>
					<td>20016-03-15 22:10:10</td>



					<td><a href="look.html" class="tablelink">查看</a> | <a
						href="../xunjian/module2/index.html" class="tablelink"> 处理</a>
					</td>
					</tr>
					<tr>

						<td>消缺任务</td>
						<td>昌平一号线消缺任务</td>

						<td>20016-03-15 22:10:10</td>
						<td><a href="look.html" class="tablelink">查看</a> | <a
							href="../xiaoque/module2/index.html" class="tablelink"> 处理</a>
						</td>
					</tr>

					<td>消缺任务</td>
					<td>朝阳一号线消缺任务</td>

					<td>20016-03-15 22:10:10</td>
					<td><a href="look.html" class="tablelink">查看</a> | <a
						href="../xiaoque/module2/index.html" class="tablelink"> 处理</a>
					</td>
					</tr>

				</tbody>
			</table>

			<table class="tablelist2" name="table">
				<tr>
					<th>共2条记录 当前：1/2页&nbsp;&nbsp; <a href="#" name="pageFirst">首页</a><a
						href="#" name="pageUp">上一页</a><a href="#" name="pageNext">下一页</a><a
						href="#" name="pageEnd">尾页</a> &nbsp;&nbsp;跳到:<input type="text"
						value="" onkeyup="value=value.replace(/[^\d]/g,'')" id="go"
						class="scinput5" name="pageGo" />页 &nbsp;&nbsp;<input
						type="button" id="sure" class="scbtn5" value="确定" name="pageSure" />
						&nbsp;&nbsp; &nbsp;&nbsp;</th>
				</tr>
			</table>

		</div>
	</div>
</body>
<font color="red">1.巡检人员只能看到巡检的任务，消缺人员只能看到消缺的任务 <br />2.点击处理会跳到相应的任务类型页面</font>
</html>
