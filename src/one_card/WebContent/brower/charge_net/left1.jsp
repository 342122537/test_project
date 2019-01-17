<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
			<a href="<%=path%>ManageServlet?action=staffManage" target="users">人员管理</a>



			<a
				href="<%=path%>Permi_ManageServlet?action=enter_permi&current_id=1"
				target="users">权限管理</a> <a href="#">菜单管理</a> <a
				href="<%=path%>Doctor_Servlet?action=enter_doct&current_id=1"
				target="users">医生排班</a> <a
				href="<%=path%>LogServlet?action=enter_log&current_id=1&currentPage=1"
				target="users">日志查看</a> <a href="#">参数管理</a>
		</div>
		<p class="menu_head">卡片管理</p>
		<div class="menu_body">
			<a href="<%=path%>CancleCardServlet?action=cancle_Main&currentPage=1"
				target="users">卡注销</a> <a
				href="<%=path%>CardInServlet?action=addCardManage&currentPage=1"
				target="users">卡入库</a> <a
				href="<%=path%>ModifyCardServlet?action=modify&currentPage=1"
				target="users">卡查询</a> <a
				href="<%=path%>ExamineApplyServlet?action=enter_exam&currentPage=1"
				target="users">卡领取</a>
		</div>
		<p class="menu_head">卡片业务</p>
		<div class="menu_body">
			<a
				href="<%=path%>Collar_CardServlet?action=enter_apply&currentPage=1"
				target="users">领卡</a> <a
				href="<%=path%>brower/charge_net/applycard/sell_Card.jsp"
				target="users">售卡</a> <a
				href="<%=path%>brower/charge_net/applycard/changeCard.jsp"
				target="users">换卡</a><a
				href="<%=path%>brower/charge_net/applycard/retreatCard.jsp"
				target="users">退卡</a>
		</div>
		<p class="menu_head">日常事务</p>
		<div class="menu_body">
			<a href="#">处方退费</a>
		</div>
		<p class="menu_head">统计查询</p>
		<div class="menu_body">
			<a href="<%=path%>SearchServlet?action=card_search&currentPage=1"
				target="users"> 领卡查询</a> <a
				href="<%=path%>SearchServlet?action=works&currentPage=1"
				target="users">工作量统计</a>
		</div>
	</div>

</body>
</html>