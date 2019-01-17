
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<table width="90%" border="1" height="300px">
				<tr>
					<td>门诊时间</td>
					<td>预约病人</td>
				</tr>
				<c:forEach items="${list}" var="order" varStatus="s">
					<tr>
						<c:if test="${order.p_name eq null}">

							<td><a style="color: green"
								href="<%=path%>AppointServlet?action=yuyue&c_id=${testname}&name=${order.doc_name}&p_id=${order.p_id}&app_id=${order.app_id}&dept=${order.doc_dept}&date=${order.doc_date}">${order.doc_time}</a></td>
							<td>${order.p_name}</td>
						</c:if>
						<c:if test="${order.p_name ne null}">

							<td><a style="color: red"
								href="<%=path%>AppointServlet?action=yuyue&c_id=${testname}&name=${order.doc_name}&p_id=${order.p_id}&app_id=${order.app_id}&dept=${order.doc_dept}&date=${order.doc_date}">${order.doc_time}</a></td>
							<td>${order.p_name}</td>
						</c:if>

					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</form>
		<div style="width: 500px; margin: 10px auto;">
			<a href="<%=path%>MainServlet?action=back"> <input type="button"
				id="back" name="addmoney" value="预约"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'"></a> <a
				href="<%=path%>AppointServlet?action=enter_appoin"> <input
				type="button" id="back" name="addmoney" value="返回"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'"></a>
		</div>
	</div>
</body>

</html>