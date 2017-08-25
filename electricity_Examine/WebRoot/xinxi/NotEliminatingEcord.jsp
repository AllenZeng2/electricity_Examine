<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<title>无消缺巡检记录统计</title>
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
	    KE.show({
	        id : 'content7',
	        cssPath : './index.css'
	    });
	    
	    $(function () {
			$('#newNav').click(function(){
					window.location.href="add.html";
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
	<script type="text/javascript">
		function renyuan(){
			alert("张三，李四，王五");
		}
	</script>
	</head>
	
	<body class="sarchbody" style="background-color:#ffffff" >
	
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="OrgTaskController/task.do">信息统计</a></li>
				<li><a href="OrgTaskController/task.do">无消缺巡检记录统计</a></li>
			</ul>
		</div>
	    <div class="hr"></div>
	    
			<div id="usual1">
			<form action="#" method="get" class="formbody" name="form" >
			<table class="tablelist" name="table1">
				<ul class="seachform1">
		    		<li><label>任务编号：</label>
		    			<input name="task_number" id="stBid" type="text" class="scinput1" />
		    		</li>
		    		
					<li><label>巡检时间：</label><input name="task_begintime"  id="d1" type="text" class="scinput1" value="07/10/2007"/> 
     										
     										  - 
											  <input name="task_begintime"  id="d2" type="text" class="scinput1" value="07/25/2007"/> 
     										 
					</li>
					<li>
					<input type="button" type="button" name="homePageSelect" class="scbtn" value="查询"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						<input id="" type="button" class="scbtn1" name="homePageExcel" value="导出EXCEL"/>
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
			    <table class="tablelist" name="table">
			    	<thead>
				    	<tr>
					        <th style="text-align:center;">
                           <input name="" type="checkbox" value="" />
                           </th>
					        <th style="text-align:center;">任务编号</th>
					        <th style="text-align:center;">任务名称</th>
					        <th style="text-align:center;">线路编号</th>
							<th style="text-align:center;">塔杆号</th>
							<th style="text-align:center;">有无故障</th>
					        <th style="text-align:center;">巡检时间</th>
							 <th style="text-align:center;">巡检人员</th>
					       
				        </tr>
			        </thead>
			        <tbody>
					    <tr>
                         <th style="text-align:center;">
                           <input name="" type="checkbox" value="" />
                           </th>
						   <td>CPXJ001</td>
						   <td>昌平一线任务巡检01</td>
						   <td>CP001</td>
						   <td>CP001_000001</td>
						    <td>无</td>
						   <td>2013/11/12</td>
						   <td><a href="javascript:renyuan()">张三。。。</a></td>
						</tr>


					    	<tr>
                             <th style="text-align:center;">
                           <input name="" type="checkbox" value="" />
                           </th>
						   <td>CPXJ001</td>
						   <td>昌平一线任务巡检01</td>
						   <td>CP001</td>
						   <td>CP001_000002</td>
						   <td>无</td>
						   <td>2013/11/12</td>
						   <td><a href="javascript:renyuan()">张三。。。</a></td>
						</tr>



					    	<tr>
                             <th style="text-align:center;">
                           <input name="" type="checkbox" value="" />
                           </th>
						    <td>CPXJ001</td>
						   <td>昌平一线任务巡检03</td>
						   <td>CP001</td>
						   <td>CP001_000008</td>
						   <td>无</td>
						   <td>2013/11/12</td>
						   <td><a href="javascript:renyuan()">张三。。。</a></td>
						</tr>

					    	<tr>
                             <th style="text-align:center;">
                           <input name="" type="checkbox" value="" />
                           </th>
						    <td>TZXJ001</td>
						   <td>通州一线任务巡检01</td>
						   <td>TZ001</td>
						   <td>TZ001_000001</td>
						   <td>无</td>
						   <td>2013/11/12</td>
						   <td><a href="javascript:renyuan()">张三。。。</a></td>
						</tr>
						<tr>
                         <th style="text-align:center;">
                           <input name="" type="checkbox" value="" />
                           </th>
						    <td>TZXJ001</td>
						   <td>通州一线任务巡检01</td>
						   <td>TZ001</td>
						   <td>TZ001_000002</td>
						   <td>无</td>
						   <td>2013/11/12</td>
						   <td><a href="javascript:renyuan()">张三。。。</a></td>
						</tr>
			        </tbody>
			    </table>
			    </center>
			   
			   <table class="tablelist2">
       <tr>
         <th>共2条记录
        	 当前：1/2页&nbsp;&nbsp;
          <a href="#" name="pageFirst" >首页</a><a href="#" name="pageUp">上一页</a><a href="#" name="pageNext">下一页</a><a href="#"name="pageEnd">尾页</a>
         
         &nbsp;&nbsp;跳到:<input name="pageGo" type="text" value="" onkeyup="value=value.replace(/[^\d]/g,'')" id="go" class="scinput5" />页 &nbsp;&nbsp;<input type="button" name="pageSure" id="sure" class="scbtn5" value="确定"/> &nbsp;&nbsp; &nbsp;&nbsp;
         </th>
       </tr>
    </table>



	</body>
</html>
