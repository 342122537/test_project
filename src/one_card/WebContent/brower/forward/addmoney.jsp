<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>自助终端>>卡充值</title>

</head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
<style>
#quary_cid, #addmoney, #back {
	background-color: #FF0;
	border-radius: 5px;
	border: 1px #555 solid;
	color: #333;
	color: #000;
	width: 100px;
	margin: 0 auto;
}

#back {
	margin: 0 150px;
}

div {
	margin: 10px auto;
	width: 450px;
}

h1 {
	color: #FFF
}
</style>
<body>
	<div style="margin: 150px auto; width: 500px; background-color: #F9F">
		<div style="width: 360px;">
			<h1>自助终端>>卡充值</h1>
		</div>
		<div>
			请输入卡号: <input type="text" id="c_id" name="c_id" value="${testname}"> <input
				type="button" id="quary_cid" name="quary_cid" value="读卡"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'">
		</div>
		<div>
			姓名:<span id="p_name"></span>&nbsp;&nbsp;&nbsp;&nbsp; 性别:<span
				id="p_sex"></span>&nbsp;&nbsp;&nbsp;&nbsp; 年龄:<span id="p_age"></span>&nbsp;&nbsp;&nbsp;&nbsp;
			籍贯:<span id="p_city"></span>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			证件号码:<span id="p_idcard"></span>&nbsp;&nbsp;&nbsp; 联系电话:<span
				id="p_phone"></span>&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			现住址:<span id="p_address"></span>
		</div>
		<div>
			卡余额:<span id="c_balance"></span>元&nbsp;&nbsp;&nbsp; 卡押金:<span
				id="c_deposit"></span>元&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			请输入充值金额: <input type="text" id="addtext" name="addtext" value="">元<span
				style="display: none" id="errow"></span> <input type="button"
				id="addmoney" name="addmoney" value="充值"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'">
		</div>
		<div>
			<a href="<%=path%>MainServlet?action=back"> <input type="button"
				id="back" name="addmoney" value="返回"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'"></a>
		</div>


	</div>
</body>
<script type="text/javascript">
	$(function(){
		
// 		$("#addmoney").attr('disabled',true);
		
		$("#quary_cid").on("click",function(){
			var c_id = $("#c_id").val();
			if(c_id == "" ){
				alert("请输入卡号")
				return;
			}
			$.ajax({
				url:"<%=path%>MainServlet",
				type:"post",
				dataType:"json",
				data:"action=readcard&c_id="+c_id,
				success:function(json){
					if(json==null||json==","){
						alert("查询错误！"+json);
						return;
					}
					
						$("#p_name").html(json[0].p_name);
						$("#p_sex").html(json[0].p_sex);
						$("#p_age").html(json[0].p_age);
						$("#p_city").html(json[0].p_city);
						$("#p_idcard").html(json[0].p_idcard);
						$("#p_phone").html(json[0].p_phone);
						$("#p_address").html(json[0].p_address);
						$("#c_id").html(json[0].c_id);
						$("#c_balance").html(json[0].c_balance);
						$("#c_deposit").html(json[0].c_deposit);
						
						//启动充值按钮
// 						$("#rechargebtn").attr('disabled',false);
					}
				
			});
			
		});
	})
</script>
<script type="text/javascript">
	$(function(){		
		
		$("#addmoney").on("click",function(){
			
			var addtext = $("#addtext").val();
			//alert(addtext);
			if(addtext==""||isNaN(addtext)){
				alert("充值有误,请重新输入");
				return;
			}
			var c_id = $("#c_id").val();
			if(c_id == "" ){
				//alert("请输入卡号")
				return;
			}
			var c_balance= $("#c_balance").text();
			alert(c_balance);
			$.ajax({
				url:"<%=path%>MainServlet",
				type : "post",
				data : {
					"action" : "risemoney",
					"addtext" : addtext,
					"c_id" : c_id,
					"c_balance" : c_balance

				},
				dataType : "json",
				success : function(json) {
					if (json != null) {
						$("#p_name").html(json[0].p_name);
						$("#p_sex").html(json[0].p_sex);
						$("#p_age").html(json[0].p_age);
						$("#p_city").html(json[0].p_city);
						$("#p_idcard").html(json[0].p_idcard);
						$("#p_phone").html(json[0].p_phone);
						$("#p_address").html(json[0].p_address);
						$("#c_id").html(json[0].c_id);
						$("#c_balance").html(json[0].c_balance);
						$("#c_deposit").html(json[0].c_deposit);
						$("#addtext").val(null);
						alert("充值成功！");
					} else {
						alert("充值失败！");
					}
				}
			});

		});

	})
</script>
</html>

