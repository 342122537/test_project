<%@page import="org.great.autoforward.MainServlet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<title>top</title>
<link href="css/top.css" rel="stylesheet">
<%-- <link rel="stylesheet" href="<%=path%>brower/css/global.css"> --%>
<%-- <link rel="stylesheet" href="<%=path%>brower/css/dialog.css"> --%>

<script type="text/javascript">
	
</script>
</head>
<%
	;
%>
<body>
	<div class="all"></div>

	<div id="exit">
		姓名:<a id="user">${loginname} </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		角色：${loginRole} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
			target="users"
			href="<%=path%>ManageServlet?action=updatePwd&s_id=${loginnumber}&s_name=${loginname} ">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="exit"
			href="javascript:if(confirm('确实要退出吗'));window.top.location='login.jsp'">退出系统</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a></a>
		<%
			
		%>
	</div>
	<div id="hh">
		<h2>智能一卡通系统</h2>
	</div>
	<div id="d2"></div>
	<div id="localtime" class="localtime"></div>


	<script type="text/javascript" src="<%=path%>brower/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>brower/js/dialog.js"></script>

</body>
</html>
