<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>一卡通后台</title>
</head>

<frameset rows="13%,*" >
	<frame src="<%=path%>brower/charge_net/top.jsp" scrolling="no"/></frame>
	<frameset cols="20%,*" >
    <frame src="<%=path%>brower/charge_net/left.jsp" /></frame>
    <frame src="<%=path%>brower/charge_net/welcome.jsp" name="users"></frame>
	</frameset>
</frameset>

</html>