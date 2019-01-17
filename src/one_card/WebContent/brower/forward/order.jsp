<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
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
	<div style="margin: 150px auto; width: 500px; background-color: #F9F">
		<div style="width: 360px;">
			<h1>自助终端>>预约取号</h1>
		</div>
		<div>
			请输入卡号: <input type="text" id="c_id" name="c_id" value="${testname}""> <input
				type="button" id="quary_cid" nama="quary_cid" value="读卡"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'">
		</div>
		<div>姓名:{p.p_name}&nbsp;&nbsp;&nbsp;&nbsp;
			性别:{p.p_sex}&nbsp;&nbsp;&nbsp;&nbsp;
			年龄:{p.p_age}&nbsp;&nbsp;&nbsp;&nbsp;
			籍贯:{p.p_city}&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div>证件号码:{p.p_idcard}&nbsp;&nbsp;&nbsp;
			联系电话:{p.p_phone}&nbsp;&nbsp;&nbsp;</div>
		<div>现住址:{p.p_address}</div>
		<div>卡余额:{c_balance}&nbsp;&nbsp;&nbsp;
			卡押金:{c_deposit}&nbsp;&nbsp;&nbsp;</div>
		<div>
			请输入充值金额: <input type="text" id="addmomey" name="addmoney" value="">元
			<input type="button" id="addmoney" nama="addmoney" value="充值"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'">
		</div>
		<div>
			<a href="<%=path%>MainServlet?action=back"> <input type="button"
				id="back" nama="addmoney" value="返回"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'"></a>
		</div>


		</dfn>
</body>
</html>

