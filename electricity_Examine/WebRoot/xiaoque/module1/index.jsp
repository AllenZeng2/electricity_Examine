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
	
	
	<script src="js/ace-extra.min.js"></script>
	
	<script type="text/javascript">
		
		$(function(){
			init(1);
		});
		
		
		
		function init(pageNum) {
			$.ajax({
				url : "remo.do?method=getRemovedefect1&pageNum="+pageNum,
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
								txt += "<td>" + res.list[i].task_number	+ "</td>";
								txt += "<td>" + res.list[i].task_name + "</td>";
								txt += "<td>" + res.list[i].giveperson_name + "</td>";
								txt += "<td>" + res.list[i].task_begintime + "</td>";
								txt += "<td>" + (res.list[i].task_status == 4 ? "已完成"
											  : (res.list[i].task_status == 3 ? "执行中"
											  : (res.list[i].task_status == 2 ? "已分配"	
											  : "未分配")))	+ "</td>";
								txt += "<td>" + (res.list[i].update_time ==null ? "": res.list[i].update_time )	+ "</td>";
								txt += "<td>否</td>";
								
								txt += "<td>";
								txt += "<a href='xiaoque/module1/look.jsp?task_number="+res.list[i].task_number+"'  class='tablelink'>查看</a>";
								if (res.list[i].task_status == 1) {
									txt += " | <a href='javascript:void(0)' onclick='shareTask()' class='tablelink'>分配任务</a>";
								}
								if (res.list[i].task_status == 1 || res.list[i].task_status == 2) {
									txt += " | <a href='javascript:void(0)' onclick='updateTask()' class='tablelink'>修改</a>";
								}
								if (res.list[i].task_status == 1) {
									txt += " | <a href='javascript:void(0)' onclick='deleteTask()' class='tablelink'>取消</a>";
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
	function look11(num){
			location.href="${pageContext.request.contextPath}/remo.do?method=selectTaskByNumber&task_number="+num;
		}
	
		
	</script>

	<script type="text/javascript">
		
	    KE.show({
	        id : 'content7',
	        cssPath : './index.css'
	    });
	    
	    $(function () {
			$('#newNav').click(function(){
					window.location.href="xiaoque/module1/add.jsp";
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
	</script>
	
	</head>
	
	<body class="sarchbody" style="background-color:#ffffff" >
	
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="OrgTaskController/task.do">消缺任务管理</a></li>
				<li><a href="OrgTaskController/task.do">消缺任务制定与分配</a></li>
			</ul>
		</div>
	    <div class="hr"></div>
	    
			<div id="usual1">
			<form  method="post" class="formbody" name="form" id="ajaxform">
			<table class="tablelist" name="table1">
				<ul class="seachform1">
					 
		    		<li><label>任务编号：</label>
		    			<input name="task_number" id="stBid" type="text" class="scinput1" />
		    		</li>
		    		
					<li><label>任务状态：</label>  
						<div class="vocation">
							<select name="task_status" class="select3"  >
								<option value="0">--请选择--</option>
							    <option value="1">待分配</option>
							    <option value="2">已分配</option>
							    <option value="3">执行中</option>
							    <option value="4">已完成</option>
							</select>
						</div>
					</li>
					<li><label>下发人：</label>
						<input name="user_id"  id="stUser" type="text" class="scinput1" />
					</li>
					<li><label>下发时间：</label><input name="task_begintime" id="d1" type="text" class="scinput1"/> 
     										
     										  - 
											  <input name="task_endtime" id="d2" type="text" class="scinput1"/> 
     										 
					</li>
					<li>
					<input type="button" class="scbtn" value="查询" onclick="init(1)" name="homePageSelect" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="newNav" type="button" class="scbtn1" value="制定消缺任务" name="homePageInsert"/>
					</li>
				</ul>
			    <script type="text/javascript">
					$(document).ready(function(){
						$(".scbtn1").click(function(){
							$(".seachform2").fadeIn(200);
							
						});
					});

					 function quxiao(){
							 confirm("确认取消");
					 }
				</script>
			
				</table>
				</form>
			</div>
			
			<!-- <div class="hr hr-18 dotted hr-double"></div> -->
			
			<div class="formbody">
				<center>
			    <table class="tablelist" name="table">
			    	<thead>
				    	<tr>
					       
					        <th style="text-align:center;">任务编号</th>
					        <th style="text-align:center;">任务名称</th>
					       
					        <th style="text-align:center;">下发人</th>
					        <th style="text-align:center;">下发时间</th>
					        <th style="text-align:center;">任务状态</th>
					        <th style="text-align:center;">任务完成时间</th>
					        <th style="text-align:center;">任务是否取消</th>
					        <th style="text-align:center;">操作</th>
				        </tr>
			        </thead>
			        <tbody id="ajaxhtml">
					    <tr>
						   <td>
						     <a href="look.html" class="tablelink">查看</a>  |
							 <a href="share.html" class="tablelink">分配任务</a>  |
							 <a href="update.html" class="tablelink">修改</a>  |
							 <a href="javascript:quxiao()" class="tablelink">取消</a></td>
					
						</tr>


			    </table>
			    </center>
			   
			   <table class="tablelist2">
       <tr>
         <th id="spanpage">共2条记录
        	 当前：1/2页&nbsp;&nbsp;
          <a href="#" name="pageFirst">首页</a><a href="#" name="pageUp">上一页</a><a href="#" name="pageNext">下一页</a><a href="#" name="pageEnd">尾页</a>
         
         &nbsp;&nbsp;跳到:<input type="text" value="" name="pageGo" onkeyup="value=value.replace(/[^\d]/g,'')" id="go" class="scinput5" />页 &nbsp;&nbsp;<input name="pageSure" type="button" id="sure" class="scbtn5" value="确定"/> &nbsp;&nbsp; &nbsp;&nbsp;
         </th>
       </tr>
    </table>

	</body>
</html>
