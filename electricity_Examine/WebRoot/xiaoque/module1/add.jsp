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
		
		$(function(){
			$.ajax({
				url:"remo.do?method=getRemovedefectLines",
				type:"post",
				dataType:"json",
				success:function(r){
					var txt2="<option  value='0' selected='selected' >-请选择-</option>";
					
					for (var i=0;i<r.list.length;i++){
						
						txt2+="<option  value='"+r.list[i].lineNumber+"' >"+r.list[i].lineName+"</option>";
					}
					$("#ajaxselect").html(txt2);
				},
				error:function(){
				}
			});
			
			$.ajax({
				url:"remo.do?method=getRemovedefectUser",
				type:"post",
				dataType:"json",
				success:function(re){
					var txt2="消缺员：";
					
					for (var i=0;i<re.list.length;i++){
						
						txt2+="<input name='aa' type='radio' value='"+re.list[i].user_ID+"' >"+re.list[i].user_NAME;
						
					
					}
					$("#ajaxli").html(txt2);
					
					
				},
				error:function(){
				}
			});
			
			
			$("#ajaxhtml").html("没有可显示的内容");
			$("#ajaxselect").change(function(){
				$.ajax({
					url:"remo.do?method=getRemovedefectLinesLate",
					type:"post",
					data:"line_number="+$(this).val(),
					dataType:"json",
					success:function(res){
						if (res.list == null || res.list == "") {
							$("#ajaxhtml").html("没有可显示的内容");
						} else {
							var txt = "";
					for ( var i = 0; i < res.list.length; i++) {			
						txt += "<tr>";
						txt += "<td><input name='receipt_id' type='checkbox' value=r"+res.list[i].receipt_id+"></td>";
						txt += "<td>" + res.list[i].line_number	+ "</td>";
						txt += "<td>" + res.list[i].pole.pole_NUMBER + "</td>";
						txt += "<td>" + res.list[i].defects.defect_NAME + "</td>";
						txt += "<td>" + res.list[i].defect_desc + "</td>";
						txt += "<td>" + res.list[i].find_date + "</td>";
						txt += "<td>" + res.list[i].find_username + "</td>";
						txt += "<td>" + (res.list[i].defect_level==1 ? "一般"
									  : (res.list[i].defect_level==2 ? "严重"
									  : "紧急"))	+ "</td>";
						txt += "</tr>";
					}
					$("#ajaxhtml").html(txt);
						}
					},
					error:function(){
					}
			});
			
			
			});
			
		});
		
		
		
		

	
	function look11(num){
			location.href="${pageContext.request.contextPath}/remo.do?method=selectTaskByNumber&task_number="+num;
		}
	
	/*$(":radio").click(function(){
				alert("11111");
			});
			
			$(".aaaa").toggle(
						function(){
							alert("111");
							$(this).attr("checked","checked");
						},
						function(){
							alert("222");
							$(this).removeAttr("checked");
						}
					);
					function ale(che,va){
						if(!che){
							document.getElementById("a"+va).checked=false;
							
						}
					}*/
		
	</script>
	
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
		
		<form action="remo.do?method=addRemovedefect" method="post" class="formbody"  name="form">
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
					    <select class="select1" name="line_name"  onClick="addBillName()" id="ajaxselect">
						    <option value="0">--请选择--</option>
							
							
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
					<input  type="text" class="dfinput" value="${sessionScope.user.USER_NAME }" name="user_id" readonly  style="width:200px;"/>
					&nbsp; &nbsp; &nbsp;
				下发时间：
					<input  type="text" class="dfinput" value="2013-12-12" name="task_begintime"  readonly  style="width:200px;"/>
     				
     			</li>
				<li><label>任务描述：</label>
					<textarea name="task_desc"  class="dfinput"></textarea>
				&nbsp; &nbsp; &nbsp;
				
				</li>
				<li id="ajaxli"></li>
			</div>
		</div> 
		
    

	<div class="place">
     缺陷列表:
   
    </div>
<table class="tablelist" name="table" >
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
        <tbody id="ajaxhtml"></tbody>
    </table>
<input class="scbtn" name="homePageSave" type="submit" onclick="" value="提交" />
		<input name="homePageButton" class="scbtn1" type="button" onclick="back()" value="返回">
	</form>
</body>

</html>

