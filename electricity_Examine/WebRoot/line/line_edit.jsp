<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'line_edit.jsp' starting page</title>
    
    <script src="laydate/laydate.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
       

  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript">
  		$(function(){
  		
  			$("#myform").submit(function(){
  			
  			return cklineNumber()&&cklineName()&&cklineLength()&&ckpoleStar()&&ckpoleStop();
  			
  			
  			})
  			
  			
  			/*1. 线路编号不能为空或者长度大于30 */
			$("#lineNumber").blur(function() {
				cklineNumber();	
			});
			//2.线路名称不能为空且不能与数据库有重复
			$("#lineName").blur(function() {
				cklineName();	
			});
  			//3.线路名称不能为空且不能与数据库有重复
			$("#lineLength").blur(function() {
				cklineLength();	
			});
  			//4.线路名称不能为空且不能与数据库有重复
			$("#poleStar").blur(function() {
				 ckpoleStar(); 	
			});
  			//5.获得焦点时的所要进行的验证
			$("#poleStar").focus(function() {
				 ckpoleStar2(); 	
			});
			//6.对终止杆号进行非空验证以及判断终止杆号是否大于起始杆号并对杆的数量进行自动填写
			$("#poleStop").blur(function() {
				ckpoleStop();
			});
  		
  		});
  		
  		/*1. 线路编号不能为空或者长度大于30 */
		function cklineNumber(){
			var vlineNumber = $("#lineNumber").val();
				if (vlineNumber == null || vlineNumber.trim().length == 0) {
					$("#errlineNumber").html("线路编号不能为空");
					return false;
				}
	
				if (vlineNumber.trim().length > 30) {
				$("#errlineNumber").html("线路编号长度不能大于30");
					return false;
				}
			
				//修改提示内容
				$("#iLineNumber").html("可用");
				return true;
		}
  
  /* 2. 验证线路名称是否为空以及用ajax连库查询线路名称是否可用 */
  	function cklineName(){
			var vlineName = $("#lineName").val();
			if (vlineName == null || vlineName.trim().length == 0) {
				$("#ilineName").html("线路名称不能为空");
				return false;
			}
			
 
			$.ajax({
				url : "line.do?m=7",//请求的路径
				type : "post",//请求的方式
				data : {
					lineName : vlineName
				},
				dataType : "text",//返回的数据类型
				success : function(res) {//ajax成功数运行的方法res就是返回值
				 	
					if (res==0) {
						$("#iLineName").html("线路名称不可用");
						return false;
					}
					if(res==1){
						$("#iLineName").html("线路名称可用");
					}

				},
				error : function() {
				}
			});
		
			return true; 
			
			
	}
  
   /*3. 线路长度的非空验证以及数字类型的验证 */
	function cklineLength(){
			var vlineLength = $("#lineLength").val();
			if (vlineLength == null || vlineLength.trim().length == 0) {
				$("#ilineLength").html("回路长度不能为空");
				return false;
			}
			if (isNaN(vlineLength)) {
				$("#ilineLength").html("请输入数字");
				return false;
			}
			$("#ilineLength").html("");
			return true;
	}
	
	//4.对起始杆号进行非空验证以及杆号前半部分是否为线路名称
	function ckpoleStar(){
			var vlineNumber = $("#lineNumber").val();
			var vpoleStar = $("#poleStar").val();

			if (vpoleStar == null || vpoleStar.trim().length == 0) {
			$("#ipoleStar").html("起始杆号不能为空");
			
				return false;
			}
			

			var ffss = vpoleStar.split("_");
			var hh1 = ffss[1];
			var hh0 = ffss[0];
			if (isNaN(hh1)) {
				$("#ipoleStar").html("请输入数字");
				return false;
			}
			alert(hh0);
			alert(vlineNumber);
			if(hh0==vlineNumber){
			   $("#ipoleStar").html("");
			   return true;			
			} 
			
			  $("#ipoleStar").html("输入的杆号格式不正确");
			  return false;
			
			/* var ff = vpoleStar.split("_");
			var hh = ff[2];			 */
	}
	
		//5.对起始杆号移入时填上前半部分
		function ckpoleStar2(){
		    var vlineNumber = $("#lineNumber").val();
		    var vpoleStar = $("#poleStar").val();
		    
			var vvlineNumber = vlineNumber + "_";
			var ffss = vpoleStar.split("_");
			var hh1 = ffss[1];
			var hh0 = ffss[0];
			if(hh0!=vlineNumber){
			  $("#poleStar").val(vvlineNumber);		
			} 
		}
		//6.对终止杆进行非空验证，终止杆
       function ckpoleStop(){
       
       		//获取终止杆号
       		var vpoleStop = $("#poleStop").val();
			//获取初始杆号
			var vpoleStar = $("#poleStar").val();
			//获取hidden中的值，判断是否有巡检或消缺任务
			var vhid = $("#hd").val();
			//获得塔杆数，从而可以做对比。
			var vlength = $("#length").val();
			
			if (vpoleStop == null || vpoleStop.trim().length == 0) {
				$("#ipoleStop").html("终止杆号不能为空");
				return false;
			}
			//获取起始杆号后边的编号并将其后边的数字截取
			var ffss = vpoleStar.split("_");
			var hh1 = ffss[1];
			//获取终止杆号后边的编号并将其后边的数字截取
			var ffst = vpoleStop.split("_");
			var hh2 = ffst[1];
			
			
			
			//判断输入的是否是数字
			if (isNaN(hh2)) {
				$("#ipoleStop").html("请输入数字");
				return false;
			}
			
			//判断终止杆号是否大于起始杆号
			if (hh2 - hh1 < 0) {
					$("#ipoleStop").html("终止杆号不能小于起始杆号");
				return false;
			}

			
			//判断是否是有巡检或消缺任务的线路，当有任务时只能增加
			if(vhid>0&& hh2-hh1+1<vlength){
					$("#ipoleStop").html("此线路有任务正在执行，杆数只能增加不能减少");	
				return false;
			} 		
			
			$("#length").val(hh2 - hh1 +1);
			$("#length").attr("readonly","readonly");

			return true;
			
 }
		
			
       
       
       
       
      
  
  
  </script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script></head>
  
  
  
  <body>
   <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="right.html">首页</a></li>
    
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改信息</span></div>
    
   <form action="line.do?m=6" method="post" name="form">
   	<input type="hidden" value="${line.lineId }" name="lineId">
   	<input type="hidden" value="${dd }" id="hd"/>
    <ul class="forminfo">
    <li><label>线路编码</label>
    <input name="lineNumber" id="lineNumber"  type="text" class="dfinput" value="${line.lineNumber}"
     <c:if test="${dd>0 }">
           readonly="readonly" </c:if> 
     />
     <i id="ilineNumber">&nbsp;&nbsp;&nbsp;<font id="errlineNumber" style="color:red"></font></i></li>
    <li><label>线路名称</label>
    <input name="lineName" id="lineName" type="text" class="dfinput" value="${line.lineName }"/>
    <i id="ilineName"></i></li>
    <li><label>回路长度</label>
    <input name="lineLength" id="lineLength" type="text" class="dfinput" value="${line.lineLength }"/>
    <i id="ilineLength"></i></li>
    <li><label>投运时间</label><input name="lineDate" id="lineDate" type="text" class="dfinput" onclick="laydate()" value="${line.lineDate }">
    <i></i></li>
    <li><label>电压等级</label>
    <select name="lineVoltage">
			<option>请选择电压等级</option>
			<option value="0"
			 <c:if test="${line.lineVoltage==0 }">
            selected="selected"  </c:if>
			>特高压</option>
			<option value="1"
			 <c:if test="${line.lineVoltage==1 }">
            selected="selected"  </c:if>
			>超高压</option>
			<option value="2"
			<c:if test="${line.lineVoltage==2 }">
            selected="selected"  </c:if>
			>高压</option>
			<option value="3"
			<c:if test="${line.lineVoltage==3 }">
            selected="selected"  </c:if>
			>中压</option>
			<option value="4"
			<c:if test="${line.lineVoltage==4 }">
            selected="selected"  </c:if>
			>低压</option>
	</select></li>
    <li><label>起始杆号</label><input name="poleStar" id="poleStar" type="text" class="dfinput" value="${line.poleStar }" 
     <c:if test="${dd>0 }">readonly="readonly" </c:if> 
    /><i id="ipoleStar"></i>&nbsp;&nbsp;&nbsp;<font style="color:red"></font></li>
    <li><label>终止杆号</label><input name="poleStop" id="poleStop" type="text" class="dfinput" value="${line.poleStop }"/><i id="ipoleStop"></i>&nbsp;&nbsp;&nbsp;<font style="color:red"></font></li>
    <li><label>塔基数</label><input name="length" id="length" type="text" class="dfinput" value="${line.length }" readonly="readonly" /><i id="iLength"></i></li>
    <li><label>启用状态</label><cite>
    <input name="lineStatic" type="radio" value="0" 
    <c:if test="${line.lineStatic==0 }">checked="checked"</c:if>
     />立即启用&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="lineStatic" type="radio" value="1" 
     <c:if test="${line.lineStatic==1 }">checked="checked"  </c:if>
    />暂不启用</cite></li> 
    <li><label>备注</label><textarea name="lineRemark" cols="" rows="" class="textinput" >${line.lineRemark}</textarea></li>
   
    <li><label>&nbsp;</label><input name="homePageSave"  type="submit" class="btn" value="确认保存"/></li>
   
    </ul>
</form>
    </div>
  
    
 <div style="color:red">
	注意：如果此线路存在巡检任务或者消缺任务 是不可以对线路编号进行操作的，起始杆也不可以进行操作，只可以扩大终止杆号
	<br/>
	
</div>  
    
    
    
  </body>
</html>