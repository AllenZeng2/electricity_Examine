<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson .header").click(
				function() {
					var $parent = $(this).parent();
					$(".menuson>li.active").not($parent).removeClass(
							"active open").find('.sub-menus').hide();
					$parent.addClass("active");
					if (!!$(this).next('.sub-menus').size()) {
						if ($parent.hasClass("open")) {
							$parent.removeClass("open").find('.sub-menus')
									.hide();
						} else {
							$parent.addClass("open").find('.sub-menus').show();
						}
					}
				});
		// 三级菜单点击
		$('.sub-menus li').click(function(e) {
			$(".sub-menus li.active").removeClass("active")
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('.menuson').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('.menuson').slideUp();
			} else {
				$(this).next('.menuson').slideDown();
			}
		});
	})
</script>
<script type="text/javascript">
	function savelog(uname) {
		$.ajax({
			url : "users.do?m=savelog",
			type : "post",
			data : {
				uname : uname
			},
			dataType : "text",
			success : function(res) {
			},
			error : function() {
			}
		});
	}
</script>
<script type="text/javascript">
		if ("${sessionScope.user}" == "") {
			parent.location.href = "login.jsp";
		}
</script>

</head>

<body style="background:#fff3e1;">


	<dl class="leftmenu">
		<c:forEach items="${user.roles.menus }" var="m">
			<dd>
				<div class="title">
					<c:if test="${m.MENU_FATHERID==0 }">
						<span><img src="images/leftico01.png" /> </span>
						<P lang="${m.MENU_NAME}" onclick="savelog(lang)">${m.MENU_NAME}</P>
					</c:if>
				</div>

				<ul class="menuson">
					<c:forEach items="${user.roles.menus }" var="mm">
						<c:if test="${mm.MENU_FATHERID==m.MENU_ID }">
							<li>
								<div class="header">
									<cite></cite> <a href="${mm.MENU_URL }" target="rightFrame"><P
											lang="${mm.MENU_NAME}" onclick="savelog(lang)">${mm.MENU_NAME}</P>
									</a>
								</div>
							</li>
							<li>
						</c:if>
					</c:forEach>
				</ul>

			</dd>
		</c:forEach>
	</dl>
</body>
</html>
