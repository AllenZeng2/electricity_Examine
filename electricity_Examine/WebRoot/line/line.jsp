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

<title>My JSP 'line.html' starting page</title>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link href="${pageContext.request.contextPath}/css/select.css"
	rel="stylesheet" type="text/css" />
<!--弹窗 -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>
<script type="text/javascript">
	$(function() {

		init(1);

		$("#sub").click(function() {
			var pagenumm = $("#fpagenum").val();

			init(pagenumm);

		})

	});

	function init(pagenum) {

		$
				.ajax({
					url : "line.do?m=1",//请求的路径
					type : "post",//请求的方式
					data : {
						pageNum : pagenum,
						conliname : $("#liname").val()
					},
					dataType : "json",//返回的数据类型
					success : function(res) {//ajax成功数运行的方法res就是返回值

						if (res.linelist == null || res.linelist == "") {

							$("#ajaxhtml").html("没有可显示的内容");
							var txt1 = "";
							$("#spanpage").html(txt1);
						} else {
							var txt = "";
							for ( var i = 0; i < res.linelist.length; i++) {

								/* 启用禁用的a标签中的文字，可以点击的那个 */
								var fssid = "staticid" + res.linelist[i].lineId;
								/* 启用禁用的显示标签中的文字的标签的id属性 */
								var fssid2 = "staticid2"
										+ res.linelist[i].lineId;
								var hidid = "sss" + res.linelist[i].lineId;

								//调用删除的a标签的id属性
								var delid = "del" + res.linelist[i].lineId;

								txt += "<input type='hidden' id='"+hidid+"' value='"+res.linelist[i].lineStatic+"'>";
								txt += "<tr>";
								txt += "<td>" + res.linelist[i].lineNumber
										+ "</td>";
								txt += "<td>" + res.linelist[i].lineName
										+ "</td>";
								txt += "<td>" + res.linelist[i].poleStar
										+ "</td>";
								txt += "<td>" + res.linelist[i].poleStop
										+ "</td>";
								txt += "<td>" + res.linelist[i].length
										+ "</td>";
								txt += "<td>"
										+ (res.linelist[i].lineState == 0 ? "良好"
												: "不好") + "</td>";
								txt += "<td id='"+fssid2+"'>"
										+ (res.linelist[i].lineStatic == 0 ? "启用"
												: "禁用") + "</td>";
								txt += "<td><a href='javascript:jinyong("
										+ res.linelist[i].lineId
										+ ")'  id='"
										+ fssid
										+ "' name='stop'  class='tablelink(1)'>"
										+ (res.linelist[i].lineStatic == 0 ? "禁用"
												: "启用") + " </a> &nbsp";
								txt += "<a href='javascript:disp_confirm("
										+ res.linelist[i].lineId + ","
										+ pagenum + ")' id='" + delid
										+ "' class='tablelink'>删除</a> &nbsp";
								txt += "<a href='line.do?m=5&lineId="
										+ res.linelist[i].lineId
										+ "' class='tablelink'>修改</a></td>";
								txt += "</tr>";
							}
							$("#ajaxhtml").html(txt);

							var pagetxt = "";
							pagetxt += "<th>共" + res.pi.totleCount + "条记录 当前："
									+ res.pi.pageNum + "/" + res.pi.totlePage
									+ "页&nbsp;&nbsp;"
							pagetxt += "<input type='hidden' id='fpagenum' value='"+res.pi.pageNum+"'>";
							pagetxt += "<a href='javascript:init(1)' name='pageFirst'>首页</a> &nbsp;";

							pagetxt += "<c:if test='${pi.pageNum<=1 }'>";
							pagetxt += "<span style="color:#000;">首页</span>";
							pagetxt += "</c:if>";
							pagetxt += "<a href='javascript:init("
									+ (res.pi.pageNum - 1)
									+ ")' name='pageUp'>上一页</a> ";
							pagetxt += "<a href='javascript:init("
									+ (res.pi.pageNum + 1)
									+ ")' name='pageNext'>下一页</a>&nbsp;"
							pagetxt += "<a href='javascript:init("
									+ res.pi.totlePage
									+ ")'>尾页</a> &nbsp;&nbsp;";
							pagetxt += "跳到:<input type='text' value='' onkeyup='value=value.replace(/[^\d]/g,'')' id='go' class='scinput5' name='pageGo' />页 &nbsp;&nbsp;";
							pagetxt += " <input type='button' onclick='huan()' id='sure' class='scbtn5' value='确定' name='pageSure' />	&nbsp;&nbsp; &nbsp;&nbsp;";
							pagetxt += "</th>";
							$("#spanpage").html(pagetxt);

						}

					},
					error : function() {//ajax失败是返回的内容
					}
				});

	};

	function jinyong(id) {
		var hidid = "sss" + id;
		var cc = $("#" + hidid + "").val() == 1 ? "启用" : "禁用";

		if (confirm("您确定要" + cc + "吗？？")) {

			$.ajax({
				url : "line.do?m=3",//请求的路径
				type : "post",//请求的方式
				data : {
					lineId : id,
					lineStatic : $("#" + hidid + "").val(),
				},
				dataType : "text",//返回的数据类型
				success : function(res) {//ajax成功数运行的方法res就是返回值

					$("#" + hidid + "").val(res);

					if (res == 0) {
						$("#staticid2" + id + "").html("启用");
						$("#staticid" + id + "").html("禁用");
					}
					if (res == 1) {
						$("#staticid2" + id + "").html("禁用");
						$("#staticid" + id + "").html("启用");
					}

				},
				error : function() {
				}

			});

		}
	}

	function huan() {
		var pg = $("#go").val().trim();
		init(pg);
	}

	function disp_confirm(id, pagenum) {
		if (confirm("您确删除吗？？")) {

			var delid = "del" + id;

			$.ajax({
				url : "line.do?m=4",//请求的路径
				type : "post",//请求的方式
				data : {
					lineId : id,
				},
				dataType : "text",//返回的数据类型
				success : function(res) {//ajax成功数运行的方法res就是返回值	

					init(pagenum);
					/* $("#"+delid+"").parents("tr").remove(); */

				},
				error : function() {
				}

			});
		}

	}

	//修改先注释掉
	//txt+="<td id='staticid2+"+res.linelist[i].lineId+"'>"+(res.linelist[i].lineStatic==0?"启用":"禁用")+"</td>";

	function tingyong_confirm(p) {
		if (confirm("您确定要停用吗？？")) {

		}
	}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">

			<li><a>首页</a></li>
			<li><a>基本内容</a></li>
		</ul>
	</div>






	<div class="formbody">
		<div id="usual1" class="usual">
			<ul class="seachform1">
				<li>
					<form action="" name="form">
						<label>线路名称：</label> <input name="liName" id="liname" type="text"
							class="scinput1" value="" /> <input name="homePageSelect"
							type="button" class="scbtn" id="sub" value="查询" /> &nbsp;&nbsp;
					</form>
				</li>
				<li><input name="homePageInsert" type="button" class="scbtn1"
					value="添加线路" onclick="location.href='line/line_add.jsp'" />
				</li>
			</ul>

			



			<table class="tablelist" name="table1">

				<tr>
					<th>线路编号<i class="sort"> <img
							src="${pageContext.request.contextPath}/images/px.gif" /> </i></th>
					<th>线路名称</th>
					<th>起始杆号</th>
					<th>终止杆号</th>
					<th>塔基数</th>
					<th>运行状态</th>
					<th>状态（启用/停用）</th>
					<th>操作</th>
				</tr>
				<tbody id="ajaxhtml"></tbody>
			</table>
			<table class="tablelist2" name="table">
				<tr id="spanpage">

				</tr>
			</table>
		</div>
	</div>
</body>
</html>



