
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>卡片业务-领卡-卡申请单</title>
<link href="<%=path%>/brower/charge_net/css/login.css" type="text/css"
	rel="stylesheet" />

<style type="text/css">
form div {
	width: 390px;
	margin-left: 100px;
	height: 40px;
	margin-top: 10px;
}
</style>
</head>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function check() {

		var perfore = document.getElementById("applyNumber").value;

		if (perfore == "") {
			document.getElementById("upwdNone1").innerHTML = "申请卡数量为空";
			return;
		} else if (isNaN(perfore)) {

			document.getElementById("upwdNone1").innerHTML = "请输入0-9数字";
			return;
		} else {

			document.forms[0].submit();

		}

	}

	function tick() {
		var objD;
		objD = new Date();
		var yy = objD.getYear();
		if (yy < 1900)
			yy = yy + 1900;
		var MM = objD.getMonth() + 1;
		if (MM < 10)
			MM = '0' + MM;
		var dd = objD.getDate();
		if (dd < 10)
			dd = '0' + dd;
		var str = yy + "年" + MM + "月" + dd + "日"
		$("#newtime").val(str);
	}
</script>

<body onload="tick()">
	<div id="addddd">
		<div id="line"></div>

		<div id="word">****申请单****</div>


		<form
			action="<%=path%>Collar_CardServlet?action=addApplyer"
			method="post">
			<div>
				申&nbsp;&nbsp;&nbsp;请&nbsp;&nbsp;&nbsp;人&nbsp;:<input type="text"
					name="applyer" id="a_applyer" readonly="readonly"
					value="${loginname}" /> <span id="unameNone"></span>
			</div>
			<div>
				申请&nbsp;&nbsp;&nbsp;时间:<input type="text" name="newtime"
					id="newtime" readonly="readonly" value="" /> <span
					id="sexnameNone"></span>
			</div>
			<div>
				申请卡数量:<input type="text" name="applyNumber" id="applyNumber"
					value="" />张
			</div>
			<div>
				<span style="color: #F00" id="upwdNone1"></span>
			</div>

			<div>
				<input type="button" name="sub1" id="sub1" value="提交"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'" onclick="check()" />
				<a href="<%=path%>Collar_CardServlet?action=enter_apply&currentPage=1"><input
					type="button" name="sub1" id="sub1" value="返回"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'" /></a>
			</div>
		</form>
	</div>

</body>
<script type="text/javascript">
	
</script>
</html>
