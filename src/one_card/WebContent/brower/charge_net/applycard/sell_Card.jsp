<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>卡片业务>>售卡</title>
</head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
<style>
#quary_cid, #sell, #back {
	background-color: #FF0;
	border-radius: 5px;
	border: 1px #555 solid;
	color: #333;
	color: #000;
	width: 100px;
	margin: 0 auto;
}

#p_age, #p_age1 {
	width: 50px;
}

#p_address {
	width: 400px;
}

div {
	margin: 10px auto;
	width: 500px;
}

h1 {
	color: #FFF
}

#booleaner {
	border: none;
	color: red;
	bcakground: #FFF;
}
</style>
<script type="text/javascript">

	function check() {
		var p_name = document.getElementById("p_name").value;
		var p_age = document.getElementById("p_age").value;
		var p_age1 = document.getElementById("p_age1").value;
		var p_city = document.getElementById("p_city").value;
		var p_idcard = document.getElementById("p_idcard").value;
		var p_phone = document.getElementById("p_phone").value;
		var p_address = document.getElementById("p_address").value;
		var c_balance = document.getElementById("c_balance").value;
		var c_id = document.getElementById("c_id").value;
		var booleaner = document.getElementById("booleaner").innerText;

		if (p_name == "") {
			document.getElementById("unameNone").innerHTML = "姓名不能为空";
			return;
		}else if (p_age == "") {
			document.getElementById("unameNone").innerHTML = "岁不能为空";
			return;
		}else if (p_age1 == "") {
			document.getElementById("unameNone").innerHTML = "周不能为空";
			return;
		}else if (p_city == "") {
			document.getElementById("unameNone").innerHTML = "籍贯不能为空";
			return;
	
		}else if (p_idcard == "") {
			document.getElementById("unameNone").innerHTML = "证件号码不能为空";
			return;
		}else if (p_phone == "") {
			document.getElementById("unameNone").innerHTML = "联系电话不能为空";
		
			return;

   
		}else if (p_address == "") {
			document.getElementById("unameNone").innerHTML = "现住址不能为空";
			return;
		}else if (c_balance == "") {
			document.getElementById("unameNone").innerHTML = "预存金额不能为空";
			return;
	
		}else if (!(/(^[1-9]\d*$)/.test(c_balance))) { 
			document.getElementById("unameNone").innerHTML = "预存金额输入的不是正整数";
			return ; 
		}else if (c_id == "") {
			document.getElementById("unameNone").innerHTML = "卡号不能为空";
			return;
	
		} else {

			document.forms[0].submit();

		}
		
		
		
	};
	
</script>


<body>
	<div style="margin: 10px auto; width: 700px; background-color: #F9F">
		<div style="width: 360px;">
			<h1>出售</h1>
		</div>
		<form
			action="<%=path %>SellCardSerevlet?action=selling&loginname=${loginname}"
			method="post">
			<div>
				姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:<input type="text"
					id="p_name" name="p_name" value=""> &nbsp;
				年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄:<input type="text"
					id="p_age" name="p_age" value="">岁<input type="text"
					id="p_age1" name=p_age1 value="">周
			</div>
			<div>
				性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type="radio"
					name="p_sex" style="background: none;" value="男" checked="checked" />男
				<input type="radio" name="p_sex" style="background: none" value="女" />女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯:<input type="text"
					id="p_city" name="p_city" value="">

			</div>

			<div>
				证件号码:<input type="text" id="p_idcard" name="p_idcard" value="">&nbsp;&nbsp;&nbsp;
				联系电话:<span id="p_phone"></span><input type="text" id="p_phone"
					name="p_phone" value="">&nbsp;&nbsp;&nbsp;
			</div>
			<div>
				现住&nbsp;&nbsp;&nbsp;址:<input type="text" id="p_address"
					name="p_address" value="">
			</div>
			<div>
				预存余额:<input type="text" id="c_balance" name="c_balance" value="">元&nbsp;&nbsp;&nbsp;
				卡&nbsp;&nbsp;&nbsp;号:<input type="text" id="c_id" name="c_id"
					value="">&nbsp;&nbsp;&nbsp;
			</div>
			<div>
				<span id="unameNone" style="color: red"></span><span
					style="color: red" id="booleaner" /></span>
			</div>
			<div>
				<a><input type="button" id="sell" name="sell" value="出售"
					onclick="check();" onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"></a> <a
					href="<%=path%>brower/charge_net/welcome.jsp"> <input
					type="button" id="back" name="addmoney" value="返回"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"></a>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
// 	$(function(){
// 		$("#c_id").on("blur",function(){
// 			var c_id = $("#c_id").val();
// 			if(c_id==""){
// 				$("unameNone").text("卡号不能为空");
// 				return;
// 			}
// 		alert("ss");
// 			$.ajax({
<%-- 				url:"<%=path%>SellCardSerevlet", --%>
// 				type : "post",
// 				dataType : "text",
// 				data : "action=chick_c_id&c_id=" + c_id,
// 				success : function(json) {
// 					if (json != null) {
// 						$("#unameNone").text(json);
// 						$("#booleaner").text("")
// 						return;
// 					} else {

// 						$("#booleaner").text("卡号存在")
// 					}
// 				}
// 			});
// 		});
// 	});
</script>
</html>

