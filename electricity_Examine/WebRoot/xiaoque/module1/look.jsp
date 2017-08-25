<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>制定消缺任务</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/select.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor.js"></script>


	<script type="text/javascript">
		
		$(function(){
			init("${param.task_number }");
		});
		
		
		
		function init(task_number) {
			
			$.ajax({
				url : "remo.do?method=selectTaskByNumber",
				type : "post",
				data :"task_number="+task_number,
				dataType : "json",
				success : function(res) {
					var txt1 = "";
					txt1+="<div class='div_td'>所属线路名称：</div>";
					
					txt1+="<div class='div_td2'>"+res.list[0].line.lineName+"</div>";
					
		   			txt1+="<div class='div_td'>任务编号：</div>";
					txt1+="<div class='div_td2'>"+res.list[0].task_number+"</div>";
		    		txt1+="<div class='div_td'>任务名称：</div>";
					txt1+="<div class='div_td2'>"+res.list[0].task_name+"</div>";
					txt1+="<div class='div_td'>任务状态</div>";
					txt1+="<div class='div_td2'>"+(res.list[0].task_status==1?"未分配"
												 :(res.list[0].task_status==2?"已分配"
												 :(res.list[0].task_status==3?"进行中"
												 :"已完成")))+"</div>";
					txt1+="<div class='div_td'>任务下发人：</div>";
					txt1+="<div class='div_td2'>"+res.list[0].giveperson_name+"</div>";
					txt1+="<div class='div_td'>任务下发时间：</div>";
					txt1+="<div class='div_td2'>"+res.list[0].task_begintime+"</div>";
					txt1+="<div class='div_td'>任务描述：</div>";
					txt1+="<div class='div_td2'>"+res.list[0].task_desc+"</div>";
					txt1+="<div class='div_td'>消缺员：</div>";
					txt1+="<div class='div_td2'>"+(res.list[0].task_status==1?"":res.list[0].xqperson_name)+"</div>";
					txt1+="<div class='div_td'>任务完成时间：</div>";
					txt1+="<div class='div_td2'>"+(res.list[0].task_status!=4?"":res.list[0].update_time)+"</div>";
					
					$("#ajaxdiv").html(txt1);
					
					
					var txt = "";
					for ( var i = 0; i < res.list.length; i++) {			
						txt += "<tr>";
						txt += "<td>" + res.list[i].line.lineNumber	+ "</td>";
						txt += "<td>" + res.list[i].receiptids + "</td>";
						txt += "<td>" + res.list[i].receipt.defects.defect_NAME + "</td>";
						txt += "<td>" + res.list[i].receipt.defect_desc + "</td>";
						txt += "<td>" + res.list[i].receipt.find_date + "</td>";
						txt += "<td>" + res.list[i].receipt.find_username + "</td>";
						txt += "<td>" + (res.list[i].receipt.defect_level==1 ? "一般"
									  : (res.list[i].receipt.defect_level==2 ? "严重"
									  : "紧急"))	+ "</td>";
						txt += "</tr>";
					}
					$("#ajaxhtml").html(txt);

				},
				error : function() {
					$("#ajaxhtml").html("没有可显示的内容");
				}
			});

		}
	</script>
	
	
	<script type="text/javascript">
	    KE.show({
	        id : 'content7',
	        cssPath : './index.css'
	    });
	</script>
  
	<script type="text/javascript">
	$(document).ready(function(e) {
	    $(".select1").uedSelect({
			width : 120		  
		});
	});
	</script>
	
	<style>
	.content { width:1050px;
			   height:500px;
	}
	.div_td { width:100px;
			  height:36px;
			  float:left;
			  text-align:center;
			  line-height:36px;
			  background:url(images/itabbg.png) repeat-x;
	}
	.div_td2 { width:940px;
			  height:36px;
			  padding-left:10px;
			  float:left;
			  line-height:36px;
			  border-bottom:1px #eac998 solid;
	}
	</style>
	</head>
	
	<body class="sarchbody" >
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="OrgTaskController/task.do">消缺任务管理</a></li>
				<li><a href="OrgTaskController/task.do">消缺任务制定与分配</a></li>
				<li><a href="#">查看消缺任务</a></li>
			</ul>
		</div>
	
		<div class="content" id="ajaxdiv"></div>	
		<div class="place">缺陷列表:</div>
		<table class="tablelist" name="table" >
    		<thead>
    			<tr>
        			<th>线路编号</th>
        			<th>塔杆编号</th>
        			<th>缺陷类型</th>
        			<th>缺陷描述</th>
       			 	<th>发现时间</th>
        			<th>发现人员</th>
        			<th>缺陷级别</th>
        		</tr>
        	</thead>
        	<tbody id="ajaxhtml"></tbody>
   	 	</table>
		<center>
		    <input id="backid" name="homePageButton" class="scbtn1" type="button" value="返回">
		</center>
		<script type="text/javascript"> 
			$(function () {       
				$('#backid').click(function(){
					window.history.back();
				});
		    });
		</script>
	</body>
</html>
