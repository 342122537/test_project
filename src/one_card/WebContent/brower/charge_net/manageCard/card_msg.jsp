<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>查看卡信息</title>

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
	<div style="margin: 10px auto; width: 500px; background-color: #F9F">
		<div style="width: 360px;">
			<h1>卡管理>>卡查询>>卡详细信息</h1>
		</div>
		<div>
			卡号: <span id="c_id">${cid}</span> 卡余额 :<span id="c_balance">${balance}
			</span>
		</div>
		<div>
			卡状态:<span id="c_state">${state}</span>&nbsp;&nbsp;&nbsp;&nbsp; 就诊人:<span
				id="p_name">${name}</span>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			领用人:<span id="c_leader">${leader}</span>&nbsp;&nbsp;&nbsp; 领用时间:<span
				id="c_leaadTime">${leaadTime}</span>&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			售卡人:<span id="c_seller">${seller}</span> 售卡时间:<span id="c_balance">${seller}</span>&nbsp;&nbsp;&nbsp;

		</div>
		<div>
			<a href="<%=path%>ModifyCardServlet?action=modify&currentPage=1">
				<input type="button" id="back" name="addmoney" value="返回"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'">
			</a>
		</div>


	</div>
</body>
</html>

