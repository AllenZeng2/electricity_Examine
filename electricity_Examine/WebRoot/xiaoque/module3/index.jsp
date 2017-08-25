<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor.js"></script>

<script type="text/javascript">
		
		$(function(){
			$.ajax({
				url:"remo.do?method=getDefects",
				type:"post",
				dataType:"json",
				success:function(r){
					var txt2="<option  value='0' selected='selected' >-请选择-</option>";
					
					for (var i=0;i<r.list.length;i++){
						
						txt2+="<option  value='"+r.list[i].defect_ID+"' >"+r.list[i].defect_NAME+"</option>";
					}
					$("#selecttype").html(txt2);
				},
				error:function(){
				}
			});
			init(1);
		});
		
		function init(pageNum) {	
			
			
	
			$.ajax({
				url : "remo.do?method=selectRemovedefect&pageNum="+pageNum,
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
								txt += "<td>" + (res.list[i].task_status == 4 ? "已完成"
											  : (res.list[i].task_status == 3 ? "执行中"
											  : (res.list[i].task_status == 2 ? "已分配"	
											  : "未分配")))	+ "</td>";
											
								txt += "<td>" + res.list[i].receipt.line_number + "</td>";
								txt += "<td>" + res.list[i].receiptids + "</td>";
								txt += "<td>" + (res.list[i].receipt.defect_level == 1 ? "一般"
											  : (res.list[i].receipt.defect_level == 2 ? "严重"
											  : "紧急"))	+ "</td>";
											
								txt += "<td>" + res.list[i].receipt.defects.defect_NAME + "</td>";
								
								txt += "<td>" + res.list[i].receipt.find_username + "</td>";
								txt += "<td>" + res.list[i].receipt.find_date + "</td>";
								txt += "<td>" + res.list[i].giveperson_name + "</td>";
								txt += "<td>" + res.list[i].task_begintime + "</td>";
							
								
								txt += "<td>";
								txt += "<a  href='javascript:QBXX("+i+","+res.list[i].receipt.defect_level+")' id=a"+i+" >"+res.list[i].receipt.defect_desc+"</a>";
								
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
	function QBXX(i,le){
		alert($("#a"+i).html()+","+(le==1?"一般":(le==2?"严重":"紧急"))+"性的事件，需要马上处理");
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

	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body class="sarchbody" >
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>消缺任务管理</li>
    <li>消缺查询</li>
    
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    
    
    <ul class="seachform1">
    <form  method="post" name="form" id="ajaxform">
    <li><label>任务编号</label><input name="task_number" type="text" class="scinput1" value=""/></li>
    <li><label>缺陷类型</label>  
    <div class="vocation">
    <select class="select3"  name="task_type" id="selecttype" >
                <option  value="0" selected="selected" >-请选择-</option>
	       
	       
    </select>
    </div>
    </li>
  <li><input  type="button" name="homePageSelect" class="scbtn" onclick="init(1)" value="查询"/>&nbsp;
      
  </form>
  <input  type="submit" name="homePageExcel" class="scbtn" value="导出EXCEL"/>&nbsp;
    
    </ul>
    <script type="text/javascript">
$(document).ready(function(){
  $(".scbtn1").click(function(){
  $(".seachform2").fadeIn(200);
  }); 

  $('#sure').click(function(){
	  var nowPage=$('#go').val();
	  if(nowPage!=""){
	  location.href="RoleManagerController/index.do?nowPage="+nowPage;
	  }
  });
  
  $('#add').click(function(){
	  location.href="add.html";
  });
  
 
});

 function del(){
   confirm("确认删除");
 }
 
</script>
    <table class="tablelist"  name="table1">
    	<thead>
    	<tr>
        
        <th>任务编号</th>
        <th>任务状态</th>
		<th>线路编号</th>
		
        <th>杆塔编号</th>
        <th>缺陷级别</th>
        <th>缺陷类型</th>
        <th>发现人</th>
         <th>发现时间</th>
         <th>下发人</th>
          <th>下发时间</th>
         
           <th>缺陷描述</th>
        </tr>
        </thead>
        <tbody id="ajaxhtml"></tbody>
    </table>
    <script type="text/javascript">
    function del(id){
  	  if(confirm("确认删除？")){
  		  location.href="<%=basePath%>RoleManagerController/delete.do?id="+id;
  	  }
    }
    </script>
    <table class="tablelist2" name="table">
       <tr>
         <th id="spanpage"></th>
       </tr>
    </table>
      
	</div> 
    </div>
</body>

</html>
