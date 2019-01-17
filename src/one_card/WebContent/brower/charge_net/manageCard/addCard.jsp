
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
<title>工作人员登录页面</title>
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

		var st_num = document.getElementById("st_num").value;
		var end_num = document.getElementById("end_num").value;
		var perfore = document.getElementById("perfore").value;
		
		if (st_num == "") {
			document.getElementById("unameNone").innerHTML = "开始卡号不能为空";
			document.getElementById("upwdNone").innerHTML = "";
			
			document.getElementById("sexnameNone").innerHTML = "";
			return;
		} else if (end_num == "") {
			document.getElementById("upwdNone").innerHTML = "截止卡号不能为空";
			document.getElementById("unameNone").innerHTML = "";
		
			document.getElementById("sexnameNone").innerHTML = "";
		} else if (perfore == "") {
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("upwdNone").innerHTML = "";
			document.getElementById("sexnameNone").innerHTML = "前缀不能为空";
			return;
		} else {

			document.forms[0].submit();

		}

	}
	</script>

<body>
	<div id="addddd">
		<div id="line"></div>

		<div id="word">****卡入库****</div>


		<form action="<%=path%>CardInServlet?action=add&applyer=${loginname}" method="post">
			<div>
				开始卡号:<input type="text"
					name="st_num" id="st_num" placeholder="开始卡号" /> <span id="unameNone"></span>
			</div>
			<div>
				截止卡号:<input type="text"
					name="end_num" id="end_num" placeholder="截至卡号" /> <span
					id="sexnameNone"></span>
			</div>
			<div>
				前&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;缀:<input type="text"
					name="perfore" id="perfore" placeholder="前缀" /> <span id="upwdNone"></span>
			</div>
			
			<div>
				<input type="button" name="sub1" id="sub1" value="入库"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'" onclick="check()" />
				<a href="<%=path%>CardInServlet?action=addCardManage&currentPage=1"><input
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
