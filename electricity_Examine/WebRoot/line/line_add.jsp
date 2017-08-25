<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'pole.jsp' starting page</title>
<script src="laydate/laydate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#myform").submit(function(){
			return cklineNumber()&&cklineName()&&cklineLength()&&ckpoleStar()&&ckpoleStop();
		});
		
		
		/*1. 线路编号不能为空或者长度大于30 */
		$("#lineNumber").blur(function() {
			cklineNumber();
		});
		
		/* 2. 验证线路名称是否为空以及用ajax连库查询线路名称是否可用 */
		$("#lineName").blur(function() {
			cklineName();
		});
		 
	    /*3. 线路长度的非空验证以及数字类型的验证 */
		$("#lineLength").blur(function() {
			cklineLength();
			}); 

			//4.对起始杆号进行非空验证以及杆号前半部分是否为线路名称
		$("#poleStar").blur(function() {
			ckpoleStar();
		});

		//5.对终止杆号进行非空验证以及判断终止杆号是否大于起始杆号并对干的数量进行自动填写
		$("#poleStop").blur(function() {
			ckpoleStop();
		});
		//6.鼠标移入起始杆标签时将前半部分自动填入
		$("#poleStar").focus(function() {
			ckpoleStar2();
		});
		//7.鼠标移入终止杆标签时将前半部分自动填入
		$("#poleStop").focus(function() {
			ckpoleStop2();
		});
		
	});
	
	
	
	/*1. 线路编号不能为空或者长度大于30 */
	function cklineNumber(){
			var vlineNumber = $("#lineNumber").val();
			if (vlineNumber == null || vlineNumber.trim().length == 0) {
				$("#iLineNumber").html("线路编号不能为空");
				return false;
			}

			if (vlineNumber.trim().length > 30) {
					$("#iLineNumber").html("线路编号长度不能大于30");
				return false;
			}
			//修改提示内容
			$("#iLineNumber").html("可用");
			return true;
	}
	
	function cklineName(){
			/* 2. 验证线路名称是否为空以及用ajax连库查询线路名称是否可用 */
			var vlineName = $("#lineName").val();
		

			if (vlineName == null || vlineName.trim().length == 0) {
				$("#iLineName").html("线路名称不能为空");
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
				$("#iLineLength").html("回路长度不能为空");
				return false;
			}
			if (isNaN(vlineLength)) {
				$("#iLineLength").html("请输入数字");
				return false;
			}
			;
			return true;
	}
	
	//4.对起始杆号进行非空验证以及杆号前半部分是否为线路名称
	function ckpoleStar(){
			var vpoleStar = $("#poleStar").val();

			if (vpoleStar == null || vpoleStar.trim().length == 0) {
			$("#iPoleStar").html("起始杆号不能为空");
				return false;
			}

			var ffss = vpoleStar.split("_");
			var hh1 = ffss[1];
			if (isNaN(hh1)) {
				$("#iPoleStar").html("请输入数字");
				return false;
			}
			;
			/* var ff = vpoleStar.split("_");
			var hh = ff[2];			 */
	}
	
	
	//5.对终止杆号进行非空验证以及判断终止杆号是否大于起始杆号并对干的数量进行自动填写
	function ckpoleStop(){
			var vpoleStop = $("#poleStop").val();
			var vpoleStar = $("#poleStar").val();

			if (vpoleStop == null || vpoleStop.trim().length == 0) {
				$("#iPoleStop").html("终止杆号不能为空");
				return false;
			}
			//获取起始杆号后边的编号并将其后边的数字截取
			var ffss = vpoleStar.split("_");
			var hh1 = ffss[1];
			//获取终止杆号后边的编号并将其后边的数字截取
			var ffst = vpoleStop.split("_");
			var hh2 = ffst[1];
	
			if (isNaN(hh2)) {
				$("#iPoleStop").html("请输入数字");
				return false;
			}
			;

			if (hh2 - hh1 < 0) {
					$("#iPoleStop").html("终止杆号不能小于起始杆号");
				return false;
			}

			$("#length").val(hh2 - hh1 +1);
			$("#length").attr("readonly","readonly");

			return true;
	}
	//6.对起始杆号移入时填上前半部分
		function ckpoleStar2(){
		
		    //获取线路编号
		    var vlineNumber = $("#lineNumber").val(); 
		    //设置提醒，填入塔杆编号之前先填入线路编号
		     if (vlineNumber == null || vlineNumber.trim().length == 0) {
				$("#iPoleStar").html("请先填入线路编号");
				
			}
		    //将下划线拼接到线路编号的后边
			var vvlineNumber = vlineNumber + "_";
			//拼接好的字符串填入			
			  $("#poleStar").val(vvlineNumber);		
			 
		}
		//7.当终止杆号移入时填上前半部分
		function ckpoleStop2(){
		   //获取线路编号
		    var vlineNumber = $("#lineNumber").val(); 
		    //设置提醒，填入塔杆编号之前先填入线路编号
		     if (vlineNumber == null || vlineNumber.trim().length == 0) {
				$("#iPoleStop").html("请先填入线路编号");
				
			}
		    //将下划线拼接到线路编号的后边
			var vvlineNumber = vlineNumber + "_";
			//拼接好的字符串填入			
			  $("#poleStop").val(vvlineNumber);	
		}
</script>



</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="right.jsp">首页</a></li>

		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>添加信息</span>
		</div>

		<form action="line.do?m=2" method="post" name="form" id="myform">
			<ul class="forminfo">
			
				<li><label>线路编码</label><input name="lineNumber" id="lineNumber"
					type="text" class="dfinput" /><i id="iLineNumber"><font style="color:red"></font></i></li>
				<li><label>线路名称</label><input name="lineName" id="lineName"
					type="text" class="dfinput" /><font style="color:red"><i id="iLineName"></i></font></li>
				<li><label>回路长度</label><input name="lineLength" id="lineLength"
					type="text" class="dfinput" /><font style="color:red"><i id="iLineLength"></i></font></li>
				<li><label>投运时间</label><input name="lineDate" id="lineDate"
					type="text" class="dfinput" onclick="laydate()"><i></i>
				</li>
				<li><label>电压等级</label><select name="lineVoltage"
					id="lineVoltage">
						<option value="3">请选择电压等级</option>
						<option value="0">特高压</option>
						<option value="1">超高压</option>
						<option value="2">高压</option>
						<option value="3">中压</option>
						<option value="4">低压</option>
				</select></li>
				<li><label>起始杆号</label><input name="poleStar" id="poleStar"
					type="text" class="dfinput" /><i id="iPoleStar"></i>
				</li>
				<li><label>终止杆号</label><input name="poleStop" id="poleStop"
					type="text" class="dfinput" /><font style="color:red"><i id="iPoleStop"></i></font></li>
				<li><label>塔基数</label><input name="length" id="length"
					type="text" class="dfinput" /><i id="iLength"></i></li>
				<li><label>启用状态</label><cite><input name="lineStatic"
						type="radio" value="0" checked="checked" />立即启用&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="lineStatic" type="radio" value="1" />暂不启用</cite></li>
				<li><label>备注</label> <textarea name="lineRemark"
						id="lineRemark" cols="" rows="" class="textinput"></textarea></li>

				<li><label>&nbsp;</label><input name="homePageSave" id="ssub"
					type="submit" class="btn" value="确认保存" /></li>

			</ul>
		</form>
	</div>
	<div style="color:red">
		注意：在创建线路的时候 根据起始杆号 和终止杆号 自动创建杆 <br //>例如：起始杆号CP001_000001终止杆号CP001_000005
		会自动创建 杆号CP001_000001,CP001_000002
		CP001_000003,CP001_000004,CP001_000005 <br /> <br /> <br />
		电压等级：特高压 800-1000kV,超高压330-750kV,高压220kV,中压35-110kV ，低压10kV一下
	</div>




</body>
</html>
