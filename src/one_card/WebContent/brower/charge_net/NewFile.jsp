<%@page import="org.great.entity.MenuTable"%>
<%@page import="org.great.dao.MemuTableDao"%>
<%@page import="org.great.dao.FactoryDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"">
<title>Insert title here</title>
</head>
<body>
	<%
		List<MenuTable> list = new ArrayList<MenuTable>();

		list.add(new MenuTable("first", "ssss", "first", "ssss", "first"));
		list.add(new MenuTable("second", "ssss", "first", "ssss", "first"));
		List<MenuTable> list2 = new ArrayList<MenuTable>();
		list.add(new MenuTable("firs11t", "ssss", "first", "ssss", "first"));
		list.add(new MenuTable("second11", "ssss", "first", "ssss", "first"));
		Map<String, List<MenuTable>> map1 = new HashMap();
		map1.put("a", list);
		map1.put("b", list2);
		request.setAttribute("map", map1);
	%>

	<c:forEach var="item" items="${map}">
		<c:forEach items="${item.value}" var="it">   
${it.m_name }<br>
		</c:forEach>
	</c:forEach>

	<c:forEach items="${maplll}" var="map" varStatus="s">

		<p class="menu_head">&nbsp;&nbsp;&nbsp;&nbsp;${map.key}  +++++${map.value}</p>


		<c:forEach items="${map.value}" var="v" varStatus="v">

			<a> ${v} </a>

		</c:forEach>

		<c:forEach items="${o_list}" var="mmmm" varStatus="v">

			<a> ${o_list.mname} </a>

		</c:forEach>



	</c:forEach>

</body>
</html>