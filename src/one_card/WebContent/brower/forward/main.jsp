
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>一卡通自助终端</title>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<style>
#button {
	background-color: #FF0;
	border-radius: 5px;
	border: 1px #555 solid;
	color: #333;
	color: #039;
	width: 200px;
	margin: 0 auto;
}

div {
	margin: 30px auto;
	width: 200px;
}

h1 {
	color: #900;
}
</style>
</head>
<script src="<%=path%>brower/js/jquery.min.js"></script>

<body>
	<div
		style="margin: 150px auto; background: #F6F; width: 400px; height: 400px">
		<form id="auto_form" name="auto_form" method="post" action="">
			<div style="width: 360px;">
				<h1>欢迎使用一卡通自助终端</h1>
			</div>
			<div id="mrdiv">
				<a href="<%=path%>MainServlet?action=add"> <input type="button"
					id="button" name="add" value="卡充值"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"></a>
			</div>
			<div id="mrdiv">
				<a href="<%=path%>MainServlet?action=accounts"> <input
					type="button" id="button" name="accounts" value="卡对账"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"></a>
			</div>
			<div id="mrdiv">
				<a href="<%=path%>AppointServlet?action=enter_appoin"> <input
					type="button" id="button" name="appointment" value="预约挂号"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"></a>
			</div>
			<div id="mrdiv">
				<a href="<%=path%>MainServlet?action=order"> <input
					type="button" id="button" name="order" value="预约取号"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"></a>
			</div>
			<div id="mrdiv">
				<a href="<%=path%>MainServlet?action=quary"> <input
					type="button" id="button" name="quary" value="处方查询"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"></a>
			</div>
		</form>
	</div>
</body>

</html>