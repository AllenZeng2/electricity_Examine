<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	function back(){
	  history.back();
	 }
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
	<script type="text/javascript">
		function renyuan(){
			alert("巡检人员1，李四，王五");
		}
	</script>
	</head>

	<body>
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="OrgTaskController/task.do">消缺任务管理</a></li>
				<li><a href="OrgTaskController/task.do">消缺任务制定与分配</a></li>
				<li><a href="AddTaskController/add.do">制定消缺任务</a></li>
			</ul>
		</div>
		
		<form action="index.html" class="formbody"   name="form" >
	    	<div id="usual1" class="usual">
	    		<div class="itab">
				  	<ul> 
				    <li><a href="#tab" class="selected">制定消缺任务</a></li>
				  	</ul>
			    </div> 
	    
			  	<div id="tab" class="tabson">
			    <ul class="forminfo">
				 <li><label>消缺线路<b>*</b></label>
					<div class="vocation">
					    <select class="select1" name="line_name" onClick="addBillName()">
						    <option value="0">--请选择--</option>
							<option value="0">昌平一线</option>
							<option value="0">昌平二线</option>
							<option value="0">朝阳一线</option>
							<option value="0">通州二线</option>
							
					    </select><i>选择哪条线路，此线路下存在消缺的杆联动到消缺列表</i>
					    <span id="noneBillName"></span>
					</div>
				</li>
			    <li><label>消缺任务编号<b>*</b></label>
			    	<input name="task_number" id="stBid" type="text" class="dfinput" value=""  style="width:200px;"  onblur="addId()"/> &nbsp; &nbsp; &nbsp;
			    	消缺任务名称<b>*</b>
			    	<input name="task_name" id="stName" type="text" class="dfinput" value=""  style="width:200px;" />
			    	<span id="noneName"></span>
			    </li>
			    
			   
				
				<li><label>下发人：</label>
					<input  type="text" class="dfinput" value="admin" name="task_name" readonly  style="width:200px;"/>
					&nbsp; &nbsp; &nbsp;
				下发时间：
					<input  type="text" class="dfinput" value="2013-12-12" readonly  style="width:200px;"/>
     				
     			</li>
				<li><label>任务描述：</label>
					<textarea  name="task_desc" class="dfinput"></textarea>
				&nbsp; &nbsp; &nbsp;
				
				</li>
				<li>消缺员：<input name="aa" type="radio" >人员1<input  name="aa" type="radio" >人员2<input   name="aa" type="radio" >人员3<input name="aa" type="radio" >人员4
			</div>
		</div> 
		
    

	<div class="place">
     缺陷列表:
   
    </div>
<table class="tablelist" >
    	<thead>
    	<tr>
        
        <th><input type="checkbox"></th>
        <th>线路编号</th>
        <th>塔杆编号</th>
        <th>缺陷类型</th>
        <th>缺陷描述</th>
        <th>发现时间</th>
        <th>巡检人员</th>
        <th>缺陷级别</th>
        </tr>
        </thead>
        <tbody>
     
        <tr> 
		 <td><input type="checkbox"></td>
         
         <td>CP001</td>
         <td>CP001_000001</td>
         <td>拦河线断裂</td>
        
         <td>断裂严重</td>
         <td>2015-2-10</td>
		 <td><a href="javascript:renyuan()">检测人员1。。。</a></td>
         
         <td>紧急  </td>
        </tr> 
      
	   
	   <tr> 
		 <td><input type="checkbox"></td>
         
         <td>CP001</td>
         <td>CP001_000002</td>
         <td>拦河线断裂</td>
        
         <td>断裂严重</td>
         <td>2015-2-10</td>
         <td><a href="javascript:renyuan()">检测人员1。。。</a></td>
         <td>紧急  </td>
        </tr> 
       

         <tr> 
		 <td><input type="checkbox"></td>
         
		 <td>CP001</td>
         <td>CP001_000003</td>
         <td>拦河线断裂</td>
        
         <td>断裂严重</td>
         <td>2015-2-10</td>
         <td><a href="javascript:renyuan()">检测人员1。。。</a></td>
         <td>紧急  </td>
        </tr> 
        </tbody>
    </table>
<input type="submit"  class="scbtn" type="button" name="homePageSave"  value="提交">
		<input class="scbtn1" name="homePageButton" type="button" onclick="back()" value="返回">
	</form>
</body>

</html>

