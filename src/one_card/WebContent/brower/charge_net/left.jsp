<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<script type="text/javascript" language="javascript"
	src="<%=path%>brower/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	//slides the element with class "menu_body" when paragraph with class "menu_head" is clicked 
	$("#firstpane p.menu_head").click(function()
    {
		$(this).css({backgroundImage:"url(<%=path%>brower/js/down.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
       	$(this).siblings().css({backgroundImage:"url(<%=path%>brower/js/left.png)"});
	});
	//slides the element with class "menu_body" when mouse is over the paragraph
	$("#secondpane p.menu_head").mouseover(function()
    {
	     $(this).css({backgroundImage:"url(<%=path%>brower/js/down.png)"}).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
         $(this).siblings().css({backgroundImage:"url(<%=path%>brower/js/left.png)"
															});
										});
	$("#secondpane11 p.menu_head").mouseover(function()
    {
	     $(this).css({backgroundImage:"url(<%=path%>brower/js/down.png)"}).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
         $(this).siblings().css({backgroundImage:"url(<%=path%>brower/js/left.png)"
															});
										});

					});
</script>
<style type="text/css">
body {
	margin: 10px auto;
	font: 75%/120% Verdana, Arial, Helvetica, sans-serif;
}

.menu_list {
	width: 150px;
}

.menu_head {
	padding: 15px 20px;
	cursor: pointer;
	position: relative;
	margin: 1px;
	font-weight: bold;
	background: #eef4d3 url(<%=path%>brower/js/left.png) center right
		no-repeat;
}

.menu_body {
	display: none;
}

.menu_body a {
	display: block;
	color: #006699;
	background-color: #EFEFEF;
	padding-left: 10px;
	padding-top: 10px;
	font-weight: bold;
	text-decoration: none;
}

.menu_body a:hover {
	color: #000000;
	text-decoration: underline;
}
</style>
<body>

	<p>
		<strong> 管理系统 </strong>
	</p>
	<div class="menu_list" id="firstpane">
		<!--Code for menu starts here-->
		<p class="menu_head">系统管理</p>
		<div class="menu_body" id="firstmenu">
			<c:forEach items="${sys_menu_list}" var="f" varStatus="s">
				<a href="<%=path%>${f.m_url}" target="users">${f.m_name} </a>
			</c:forEach>
		</div>
		<p class="menu_head">卡片管理</p>
		<div class="menu_body" id="firstmenu">
			<c:forEach items="${card_menu_list}" var="f" varStatus="s">
				<a href="<%=path%>${f.m_url}" target="users">${f.m_name} </a>
			</c:forEach>
		</div>
		<p class="menu_head">卡片业务</p>
		<div class="menu_body">
			<c:forEach items="${card_opra_list}" var="f" varStatus="s">
				<a href="<%=path%>${f.m_url}" target="users">${f.m_name} </a>
			</c:forEach>

		</div>
		<p class="menu_head">日常事务</p>
		<div class="menu_body">
			<c:forEach items="${dayly_list}" var="f" varStatus="s">
				<a href="<%=path%>${f.m_url}" target="users">${f.m_name} </a>
			</c:forEach>
		</div>
		<p class="menu_head">统计查询</p>
		<div class="menu_body">
			<c:forEach items="${count_quary_list}" var="f" varStatus="s">
				<a href="<%=path%>${f.m_url}" target="users">${f.m_name} </a>
			</c:forEach>
		</div>

		<div class="menu_body">
			<c:forEach items="${count_quary_list}" var="f" varStatus="s">
				<a href="<%=path%>${f.m_url}" target="users">${f.m_name} </a>
			</c:forEach>

		</div>
	</div>

</body>
</html>