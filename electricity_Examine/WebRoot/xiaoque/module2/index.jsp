<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<title>消缺任务制定与分配</title>
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
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jedate/jedate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor.js"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<script src="js/ace-extra.min.js"></script>

	<script type="text/javascript">
		
		$(function(){
			init(1);
		});
		
		function init(pageNum) {
			$.ajax({
				url : "remo.do?method=getRemovedefect2&pageNum="+pageNum,
				type : "post",
					data :$("#ajaxform").serialize(),
					dataType : "json",
					success : function(res) {
						if (res.list == null || res.list == "") {
							$("#ajaxhtml").html("没有可显示的内容");
							var txt1 = "";
							$("#spanpage").html(txt1);
						} else {
							var txt = "";
							for ( var i = 0; i < res.list.length; i++) {			
								txt += "<tr>";
								txt += "<td>" + res.list[i].line.lineNumber + "</td>";
								txt += "<td>" + res.list[i].task_number	+ "</td>";
								txt += "<td>" + res.list[i].task_name + "</td>";
								txt += "<td>" + res.list[i].giveperson_name + "</td>";
								txt += "<td>" + res.list[i].task_begintime + "</td>";
								txt += "<td id='"+res.list[i].task_number+"'>" + (res.list[i].task_status == 4 ? "已完成"
											  : (res.list[i].task_status == 3 ? "执行中"
											  : "已分配"	))	+ "</td>";
								txt += "<td>" + (res.list[i].update_time ==null ? "": res.list[i].update_time )	+ "</td>";
								
								txt += "<td>";
								txt += "<a href='xiaoque/module2/look.jsp?task_number="+res.list[i].task_number+"' class='tablelink'>查看</a>";
								if (res.list[i].task_status == 2) {
									txt += " | <a href='javascript:void(0)' onclick='shareTask(this.lang)' lang="+res.list[i].task_number+" id='a"+res.list[i].task_number+"' class='tablelink'>执行</a>";
								}
								if (res.list[i].task_status == 3) {
									txt += " | <a href='xiaoque/module2/enter.jsp?task_number="+res.list[i].task_number+"' class='tablelink'>回执录入</a>";
								}
								txt += "</td></tr>";
							}
							$("#ajaxhtml").html(txt);
							var txt1 = "";
							txt1 += "共" + res.pi.totleCount + "条记录 当前：" + res.pi.pageNum 
									+ "/" + res.pi.totlePage + "页&nbsp;&nbsp;";
							if (res.pi.pageNum == 1) {
								txt1 += "首页&nbsp;上一页&nbsp; ";
							} else if (res.pi.pageNum > 1) {
								txt1 += "<a href='javascript:void(0)' onclick='init(1)' name='pageFirst' id='pageFirst' >首页</a>";
								txt1 += "<a href='javascript:void(0)' onclick='init(" + (res.pi.pageNum - 1)
										+ ")' name='pageUp' id='pageUp'>&nbsp;上一页&nbsp;&nbsp;</a>";
							}
							if (res.pi.pageNum == res.pi.totlePage) {
								txt1 += "下一页&nbsp;尾页&nbsp;&nbsp;跳到:";
							} else if (res.pi.pageNum < res.pi.totlePage) {
								txt1 += "<a href='javascript:void(0)' onclick='init(" + (res.pi.pageNum + 1)
										+ ")' name='pageNext' id='pageNext' >下一页&nbsp;</a>";
								txt1 += "<a href='javascript:void(0)' onclick='init(" + res.pi.totlePage
										+ ")' name='pageEnd' id='pageEnd' >尾页</a>&nbsp;&nbsp;跳到:";
							}
							txt1 += "<input type='text' value='' onkeyup='goOnkeyup(this)' id='go' class='scinput5' name='pageGo' />页 &nbsp;&nbsp;";
							txt1 += "<input type='button' id='sure' onclick='go(" + res.pi.totlePage
									+ ")' class='scbtn5' name='pageSure' value='确定' />&nbsp;&nbsp;&nbsp;&nbsp;";
							$("#spanpage").html(txt1);
						}
					},
					error : function() {
						$("#ajaxhtml").html("没有可显示的内容");
					}
				});

	}
		
	function shareTask(num){
		if($("#"+num).html()=="已分配"){
			if(confirm("确定要执行？")){
				
				$.ajax({
					url : "remo.do?method=executeRemovedefect",
					type : "post",
					data :"task_number="+num,
					dataType : "json",
					success : function(res) {
						
							$("#"+num).html("执行中");
							$("#a"+num).html("回执录入");
					
					},
					error : function() {
						
					}
				});
				
			}
		}else{
				location.href="xiaoque/module2/enter.jsp?task_number="+num;
		}
	}
		
		
	</script>

	<script type="text/javascript">
	    KE.show({
	        id : 'content7',
	        cssPath : './index.css'
	    });
	    
	    $(function () {
			$('#newNav').click(function(){
					window.location.href="AddTaskController/add.do";
			 });
	     });
	     
	     function checkall(){
			var alls=document.getElementsByName("check");
			var ch=document.getElementById("checkall");
			if(ch.checked){
				for(var i=0;i<alls.length;i++){
					alls[i].checked=true;	
				}	
			}else{
				for(var i=0;i<alls.length;i++){
					alls[i].checked=false;	
				}	
			}
		}
	</script>
	  
	<script type="text/javascript">
		$(document).ready(function(e) {
			$(".select3").uedSelect({
				width : 200
			});
			
		});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
		  $(".click").click(function(){
		  $(".tip").fadeIn(200);
		  });
		  
		  $(".tiptop a").click(function(){
		  $(".tip").fadeOut(200);
		});
		
		  $(".sure").click(function(){
		  $(".tip").fadeOut(100);
		});
		
		  $(".cancel").click(function(){
		  $(".tip").fadeOut(100);
		});
		
		});

		function zhixing(){
			confirm("确定要执行？");
		}
	</script>
	
	</head>
	
	<body style="background-color:#ffffff" >
	
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="OrgTaskController/task.do">消缺任务管理</a></li>
				<li><a href="OrgTaskController/findTask.do">消缺任务执行与回执</a></li>
			</ul>
		</div>
	    <div class="hr"></div>
	    
			<div id="usual1">
			<form class="formbody" name="form" id="ajaxform">
			<table class="tablelist" name="table" >
				<ul class="seachform1">
		    		<li><label>任务编号：</label>
		    			<input name="task_number"   id="stBid" type="text" class="scinput1" />
		    		</li>
		    		
					<li><label>消缺路线：</label>  
						<input name="line_name"  id="stlx" type="text" class="scinput1" />
					</li>
					<li><label>下发人：</label>
						<input name="user_id" id="stUser" type="text" class="scinput1" />
					</li>
					<li><label>下发时间：</label><input ame="task_begintime"  id="d1" type="text" class="scinput1"/> 
     										 
     										  - 
											  <input ame="task_endtime"  id="d2" type="text" class="scinput1"/> 
     										 
					</li>
					<li>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;
					<input type="button" name="homePageSelect" class="scbtn" onclick="init(1)" value="查询"/>
					</li>
				</ul>
			    <script type="text/javascript">
					$(document).ready(function(){
						$(".scbtn1").click(function(){
							$(".seachform2").fadeIn(200);
						});
					});
				</script>
				
				</table>
				</form>
			</div>
			
			<!-- <div class="hr hr-18 dotted hr-double"></div> -->
			
			<div class="formbody">
				<center>
			    <table class="tablelist" name="table1" >
			    	<thead>
				    	<tr>
					        <th style="text-align:center;">消缺线路</th>
					        <th style="text-align:center;">任务编号</th>
					        <th style="text-align:center;">任务名称</th>
					        
					        <th style="text-align:center;">下发人</th>
					        <th style="text-align:center;">下发时间</th>
					        <th style="text-align:center;">任务状态</th>
					        <th style="text-align:center;">任务完成时间</th>
					        <th style="text-align:center;">操作</th>
				        </tr>
			        </thead>
			        <tbody id="ajaxhtml">
			        	<tr>
						<td>CP001</td>
						 <td>CPXQ001</td>
                          <td>昌平一线消缺任务</td> 
						  
						  <td>线路人员1</td>
						  <td>2013-12-12</td>
						  <td>已分配</td>
						  <td></td>
						  <td>
					      <a href="look.html" class="tablelink">查看</a> |						   <a href="javaScript:zhixing()" class="tablelink">执行</a></td>
                         </tr>

						 <tr>
						 <td>TZ001</td>
						 <td>TZXQ001</td>
                          <td>通知一线消缺任务</td> 
						  
						  <td>线路人员2</td>
						  <td>2013-12-12</td>
						  <td>执行中</td>
						  <td></td>
						  <td>
						   <a href="look.html" class="tablelink">查看</a> |
						   <a href="enter.html" class="tablelink">回执录入</a></td>
                         </tr>

						  <tr>
						 <td>CY001</td>
						 <td>CYXQ001</td>
                          <td>朝阳一线消缺任务</td> 
						  
						  <td>线路人员3</td>
						  <td>2013-12-12</td>
						  <td>已完成</td>
						  <td>2014-12-20</td>
						  <td>
						   <a href="look.html" class="tablelink">查看</a></td>
                         </tr>
                          

						   <tr>
						 <td>HD001</td>
						 <td>HDXQ001</td>
                          <td>海淀一线消缺任务</td> 
						  
						  <td>线路人员4</td>
						  <td>2013-12-12</td>
						  <td>已完成</td>
						  <td>2013-12-23</td>
						  <td>
						   <a href="look.html" class="tablelink">查看</a></td>
                         </tr>

			        </tbody>
			    </table>
			    </center>
			   
			   <table class="tablelist2">
       <tr>
         <th id="spanpage">共2条记录
        	 当前：1/2页&nbsp;&nbsp;
          <a href="#" name="pageFirst">首页</a><a href="#" name="pageUp">上一页</a><a href="#" name="pageNext">下一页</a><a href="#" name="pageEnd">尾页</a>
         
         &nbsp;&nbsp;跳到:<input type="text" name="pageGo" value="" onkeyup="value=value.replace(/[^\d]/g,'')" id="go" class="scinput5" />页 &nbsp;&nbsp;<input type="button" name="pageSure" id="sure" class="scbtn5" value="确定"/> &nbsp;&nbsp; &nbsp;&nbsp;
         </th>
       </tr>
    </table>
		
	</body>
</html>

