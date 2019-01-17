
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
<title>卡片业务>>领卡>>查看</title>
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

<body onload=>
	<div id="addddd">
		<div id="line"></div>

		<div id="word">**查看**</div>


		<form
			action="<%=path%>Collar_CardServlet?action=updateNumber&a_id=${a_id}"
			method="post">
			<div>
				申&nbsp;&nbsp;&nbsp;请&nbsp;&nbsp;&nbsp;人&nbsp;:<input type="text"
					name="applyer" id="applyer" readonly="readonly" value="${applyer}" />
				<span id="unameNone"></span>
			</div>
			<div>
				申请&nbsp;&nbsp;&nbsp;时间:<input type="text" name="newtime"
					id="newtime" readonly="readonly" value="${newtime}" /> <span
					id="sexnameNone"></span>
			</div>
			<div>
				申请卡数量:<input type="text" name="applyNumber" id="applyNumber"
					readonly="readonly" value="${applyNumber}" /> 张
			</div>
			<div>
				审&nbsp;&nbsp;&nbsp;核&nbsp;&nbsp;&nbsp;人&nbsp;:<input type="text"
					name="c_auditor" id="c_auditor" readonly="readonly"
					value="${c_auditor}" /> <span id="unameNone"></span>
			</div>
			<div>
				审核&nbsp;&nbsp;&nbsp;时间&nbsp;:<input type="text" name="c_autime"
					id="c_autime" readonly="readonly" value="${c_autime}" /> <span
					id="unameNone"></span>
			</div>
			领用卡号:
			<c:forEach items="${card_list}" var="u" varStatus="s">
				<c:if test="${s.index % 2 == 0}">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				${u.c_id}&nbsp;&nbsp;&nbsp;,
				</c:if>
				<c:if test="${s.index % 2 != 0}">
				${u.c_id}<br />

				</c:if>
			</c:forEach>

			<div>
				<a
					href="<%=path%>ExamineApplyServlet?action=enter_exam&currentPage=1"><input
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
