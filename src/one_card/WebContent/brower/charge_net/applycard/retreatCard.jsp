<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>卡业务>>换卡</title>
</head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
<style>
#quary_cid, #read_card, #back {
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

span {
	width: 150px;
	height: 20px;
	display: -moz-inline-box; /* css注释：for ff2 */
	display: inline-block;
}

.mmm {
	width: 50px;
	height: 20px;
	display: -moz-inline-box; /* css注释：for ff2 */
	display: inline-block;
}

div {
	margin: 10px auto;
	width: 550px;
}

h1 {
	color: #FFF
}
</style>
<body>
	<div style="margin: 10px auto; width: 600px; background-color: #F9F">
		<div style="width: 360px;">
			<h1>退卡</h1>
		</div>
		<form action="<%=path%>ChangeCardServlet?action=retreatCard" method="post">
		<div>
			请输入卡号: <input type="text" id="c_id" name="c_id" value=""> <input
				type="button" id="read_card" name="read_card" value="读卡"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'">
		</div>
		<div>
			姓名:<span id="p_name" class="mmm"></span>&nbsp;&nbsp;&nbsp;&nbsp; 性别:<span
				id="p_sex" class="mmm"></span>&nbsp;&nbsp;&nbsp;&nbsp; 年龄:<span
				id="p_age" class="mmm"></span>&nbsp;&nbsp;&nbsp;&nbsp; 籍贯:<span
				id="p_city" class="mmm"></span>&nbsp;&nbsp;&nbsp;&nbsp;
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
			<input type="submit" id="quary_cid" name="quary_cid" value="退卡"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'"> <a
				href=""> <input type="button" id="back" name="addmoney"
				value="返回" onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'"></a>
		</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		
		$("#read_card").on("click",function(){
			alert("进来聊聊");
			var c_id = $("#c_id").val();
			if(c_id == "" ){
				alert("请输入卡号")
				return;
			}
			$.ajax({
				url:"<%=path%>ChangeCardServlet",
				type : "post",
				dataType : "json",
				data : "action=read_card&c_id=" + c_id + "&selects=c_id",
				success : function(json) {
					if (json == null) {
						alert("查询错误！原卡号不存在或已被注销");
						return;
					}

					$("#p_name").html(json.p_name);
					$("#p_sex").html(json.p_sex);
					$("#p_age").html(json.p_age);
					$("#p_city").html(json.p_city);
					$("#p_idcard").html(json.p_idcard);
					$("#p_phone").html(json.p_phone);
					$("#p_address").html(json.p_address);
					// 					$("#c_id").html(json.c_id);
					$("#c_balance").html(json.c_balance);
					$("#c_deposit").html(json.c_deposit);

				}

			});

		});
	})
</script>
</html>

