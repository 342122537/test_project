<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="<%=path%>mainwin/date_css/favicon.ico">
<link
	href="<%=path%>brower/charge_net/date_css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link
	href="<%=path%>brower/charge_net/date_css/font-awesome.css?v=4.4.0"
	rel="stylesheet">

<link href="<%=path%>brower/charge_net/date_css/custom.css"
	rel="stylesheet">

<link href="<%=path%>brower/charge_net/date_css/fullcalendar.css"
	rel="stylesheet">
<link href="<%=path%>brower/charge_net/date_css/fullcalendar.print.css"
	rel="stylesheet">

<link href="<%=path%>brower/charge_net/date_css/animate.css"
	rel="stylesheet">
<link href="<%=path%>brower/charge_net/date_css/style.css?v=4.1.0"
	rel="stylesheet">
</head>
<!-- 全局js -->
<script src="<%=path%>brower/charge_net/date_js/jquery.min.js?v=2.1.4"></script>
<script
	src="<%=path%>brower/charge_net/date_js/bootstrap.min.js?v=3.3.6"></script>



<!-- 自定义js -->
<script src="<%=path%>brower/charge_net/date_js/content.js?v=1.0.0"></script>


<script src="<%=path%>brower/charge_net/date_js/jquery-ui.custom.min.js"></script>

<!-- iCheck -->
<script src="<%=path%>brower/charge_net/date_js/icheck.min.js"></script>

<!-- Full Calendar -->
<script src="<%=path%>brower/charge_net/date_js/fullcalendar.min.js"></script>

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
	<div style="margin: 10px auto; width: 70%; background-color: #F9F;">
		<div style="width: 500px;">
			<h1>自助终端>>预约挂号</h1>
		</div>
		<div>
			请输入卡号: <input type="text" id="c_id" name="c_id" value="${testname}">
			<input type="button" id="quary_cid" name="quary_cid" value="读卡"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'">
		</div>
		<c:forEach items="${patientTable}" var="p" varStatus="s">
			<div>姓名:${p.p_name}&nbsp;&nbsp;&nbsp;&nbsp;
				性别:${p.p_sex}&nbsp;&nbsp;&nbsp;&nbsp;
				年龄:${p.p_age}&nbsp;&nbsp;&nbsp;&nbsp;
				籍贯:${p.p_city}&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<div>证件号码:${p.p_idcard}&nbsp;&nbsp;&nbsp;
				联系电话:${p.p_phone}&nbsp;&nbsp;&nbsp;</div>
			<div>现住址:${p.p_address}</div>
			<div>卡余额:${p.c_balance}&nbsp;&nbsp;&nbsp;
				卡押金:${p.c_deposit}&nbsp;&nbsp;&nbsp;</div>
		</c:forEach>
		<div></div>
		门诊排班表:
		<form action="" method="post" name="account" id="account">
			<table width="90%" border="1">
				<tr>
					<td>科室/日期</td>
					<c:forEach items="${week}" var="u" varStatus="s">
						<td>${u.value}<br />${u.key}</td>
					</c:forEach>
				</tr>
				<tr>
					<td>内科</td>
					<c:forEach items="${neike_list}" var="neike" varStatus="s">

						<td><a
							href="<%=path%>AppointServlet?action=doctor&name=${neike.doc_name}&date=${neike.doc_date}&dept=${neike.doc_dept}&c_id=${testname}">${neike.doc_name}</a></td>
					</c:forEach>
				</tr>
				<tr>
					<td>外科</td>
					<c:forEach items="${waike_list}" var="waike" varStatus="s">

						<td><a
							href="<%=path%>AppointServlet?action=doctor&name=${waike.doc_name}&date=${waike.doc_date}&dept=${waike.doc_dept}&c_id=${testname}">${waike.doc_name}</a></td>
					</c:forEach>
				</tr>
				<tbody id="tb_body">
				</tbody>
			</table>
		</form>

		<p style="width: 500px; margin: 10px auto;">

			<a id="thisweek">本周</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
				id="lastweek">上一周&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a> <a
				id="nextweek">下一周&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

		</p>
		<div style="width: 500px; margin: 10px auto;">
			<a href="<%=path%>MainServlet?action=back"> <input type="button"
				id="back" name="addmoney" value="返回"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'"></a>
		</div>

	</div>
</body>
<script type="text/javascript">
	$(function(){
		
		
		$("#quary_cid").on("click",function(){
			var c_id=$( "#c_id").val();
			if(c_id== "" ){
				alert("请输入卡号")
				return;
			}
			var path ="<%=path%>AppointServlet?action=readcard&c_id=" + c_id;
			$(location).prop('href', path);

		});
		$("#lastweek").on("click",function(){
			var c_id=$( "#c_id").val();
		
			var path ="<%=path%>AppointServlet?action=last&c_id=" + c_id+"&lastweek=${lastweek}";
			$(location).prop('href', path);

		});
		$("#nextweek").on("click",function(){
			var c_id=$( "#c_id").val();
			
			var path ="<%=path%>AppointServlet?action=next&c_id="+ c_id + "&nextweek=${nextweek}";
					$(location).prop('href', path);

				});
		$("#thisweek").on("click",function(){
			var c_id=$( "#c_id").val();
			
			var path ="<%=path%>AppointServlet?action=thisweek&c_id="
							+ c_id + "&nextweek=${nextweek}";
					$(location).prop('href', path);

				});
	})
</script>
</html>

