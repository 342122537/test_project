<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>自助终端>>处方查询</title>
</head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
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
			<h1>自助终端>>处方查询</h1>
		</div>
		<div>
			请输入卡号: <input type="text" id="c_id" name="c_id" value="${testname}">
			<input type="button" id="quary_cid" name="quary_cid" value="读卡"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'">
		</div>
		<div>
			姓名:<span id="p_name"></span>&nbsp;&nbsp;&nbsp;&nbsp; 性别:<span
				id="p_sex"></span>&nbsp;&nbsp;&nbsp;&nbsp; 年龄:<span id="p_age"></span>&nbsp;&nbsp;&nbsp;&nbsp;
			籍贯:<span id="p_city"></span>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			证件号码:<span id="p_idcard"></span>&nbsp;&nbsp;&nbsp; 联系电话:<span
				id="p_phone"></span>&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			现住址:<span id="p_address"></span>
		</div>
		<div>
			卡余额:<span id="c_balance"></span>元&nbsp;&nbsp;&nbsp; 卡押金:<span
				id="c_deposit"></span>元&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			处方查询:<br />
			<form action="" method="post" name="account" id="account">
				<table width="90%" border="1">
					<tr>
						<td>序号</td>
						<td>药品名称</td>
						<td>数量</td>
						<td>服用方式</td>
						<td>单位</td>
						<td>单价</td>
						<td>小计</td>

					</tr>

					<tbody id="tb_body">
					</tbody>
				</table>
				<p>
					第 <span id="currentPage"></span> 页/共 <span id="toalePage"></span> 页
					<a id="firstPage">首页</a> <a id="lastPage">上一页</a> <a id="nextPage">下一页</a>
					<a id="endPage">尾页</a>
				</p>
			</form>
		</div>
		<div>
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
			var c_id = $("#c_id").val();
			if(c_id == "" ){
				alert("请输入卡号")
				return;
			}
			$.ajax({
				url:"<%=path%>QuaryServlet",
						type : "post",
						dataType : "json",
						data : "action=show&c_id=" + c_id,
						success : function(json) {
							if (json == null || json == ",") {
								alert("查询错误！" + json);
								return;
							}

							$("#p_name").html(json.patientTable.p_name);
							$("#p_sex").html(json.patientTable.p_sex);
							$("#p_age").html(json.patientTable.p_age);
							$("#p_city").html(json.patientTable.p_city);
							$("#p_idcard").html(json.patientTable.p_idcard);
							$("#p_phone").html(json.patientTable.p_phone);
							$("#p_address").html(json.patientTable.p_address);
							$("#c_id").html(json.patientTable.c_id);
							$("#c_balance").html(json.patientTable.c_balance);
							$("#c_deposit").html(json.patientTable.c_deposit);
							var presTables = json.presTables;
// 							alert("sdadasd")
							$("#tb_body").html("");
							var cru = json.currentPage;
							$.each(presTables, function(index, item) {
								var tr;
								tr = '<td>' + (cru*index+1)+ '</td>' +
								'<td>' + item.p_name + '</td>' + '<td>'
										+ item.p_number + '</td>' + '<td>'
										+ item.p_take + '</td>' + '<td>'
										+ item.p_unit + '</td>' + '<td>'
										+ item.p_price + '</td>' + '<td>'
										+ item.p_total + '</td>';

								$("#tb_body").append('<tr>' + tr + '</tr>')

							})
							$("#currentPage").html(json.currentPage);
							$("#toalePage").html(json.toalePage);

						}

					});

				});
	})
</script>
<script type="text/javascript">
	$(function(){
		
		$("#firstPage").on("click",function(){
			var c_id = $("#c_id").val();
			if(c_id == "" ){
				alert("请输入卡号")
				return;
			}
			var currentPage =$("#currentPage").text();
			if(currentPage == 1 ){
				alert("已经是首页")
				return;
			}
			$.ajax({
				url:"<%=path%>QuaryServlet",
						type : "post",
						dataType : "json",
						data : "action=firstPage&c_id=" + c_id+"&currentPage="+currentPage,
						success : function(json) {
							if (json == null || json == ",") {
								alert("查询错误！" + json);
								return;
							}
							$("#tb_body").html("");
							var presTables = json.presTables;
							var cru = json.currentPage;
							$.each(presTables, function(index, item) {
								var tr;
								tr =  '<td>' + (cru*index+1)+ '</td>' +'<td>' + item.p_name + '</td>' + '<td>'
										+ item.p_number + '</td>' + '<td>'
										+ item.p_take + '</td>' + '<td>'
										+ item.p_unit + '</td>' + '<td>'
										+ item.p_price + '</td>' + '<td>'
										+ item.p_total + '</td>';

								$("#tb_body").append('<tr>' + tr + '</tr>')

							})
							$("#currentPage").html(json.currentPage);
										
						}

					});

				});
	})
</script>
<script type="text/javascript">
	$(function(){
		
		$("#lastPage").on("click",function(){
			var c_id = $("#c_id").val();
			if(c_id == "" ){
				alert("请输入卡号")
				return;
			}
			currentPage =$("#currentPage").text()-1;
			if(currentPage <= 0 ){
				alert("已经是首页了");
				return;
			}
// 			alert("currentPage"+currentPage)
			$.ajax({
				url:"<%=path%>QuaryServlet",
						type : "post",
						dataType : "json",
						data : "action=last/nextPage&c_id=" + c_id+"&currentPage="+currentPage,
						
						success : function(json) {
							if (json == null || json == ",") {
								alert("查询错误！" + json);
								return;
							}
							$("#tb_body").html("");
							var presTables = json.presTables;
							var cru = json.currentPage;
							$.each(presTables, function(index, item) {
								var tr;
								tr =  '<td>' + (cru*5+index-4)+ '</td>' +'<td>' + item.p_name + '</td>' + '<td>'
										+ item.p_number + '</td>' + '<td>'
										+ item.p_take + '</td>' + '<td>'
										+ item.p_unit + '</td>' + '<td>'
										+ item.p_price + '</td>' + '<td>'
										+ item.p_total + '</td>';

								$("#tb_body").append('<tr>' + tr + '</tr>')

							})
							$("#currentPage").html(json.currentPage);
						
						}

					});

				});
	})
</script>
<script type="text/javascript">
	$(function(){
		
		$("#nextPage").on("click",function(){
			var c_id = $("#c_id").val();
			if(c_id == "" ){
				alert("请输入卡号")
				return;
			}
			var currentPage =$("#currentPage").text();
			var toalePage =$("#toalePage").text();
			
			if(toalePage == currentPage ){
				alert("已经是尾页了")
				return;
			}
// 			alert("currentPage"+(parseInt(currentPage)+1))
			
			$.ajax({
				url:"<%=path%>QuaryServlet",
						type : "post",
						dataType : "json",
						data : "action=last/nextPage&c_id=" + c_id+"&currentPage="+(parseInt(currentPage)+1),
						success : function(json) {
							if (json == null || json == ",") {
								alert("查询错误！" + json);
								return;
							}
							$("#tb_body").html("");
							var presTables = json.presTables;
							var cru = json.currentPage;
							$.each(presTables, function(index, item) {
								var tr;
								tr =  '<td>' + (cru*5+index-4)+ '</td>' +'<td>' + item.p_name + '</td>' + '<td>'
										+ item.p_number + '</td>' + '<td>'
										+ item.p_take + '</td>' + '<td>'
										+ item.p_unit + '</td>' + '<td>'
										+ item.p_price + '</td>' + '<td>'
										+ item.p_total + '</td>';

								$("#tb_body").append('<tr>' + tr + '</tr>')

							})
							$("#currentPage").html(json.currentPage);
						
						}

					});

				});
	})
</script>
<script type="text/javascript">
	$(function(){
		
		$("#endPage").on("click",function(){
			var c_id = $("#c_id").val();
			if(c_id == "" ){
				alert("请输入卡号")
				return;
			}
			
			$.ajax({
				url:"<%=path%>QuaryServlet",
						type : "post",
						dataType : "json",
						data : {
							"action" : "endPage",
							"c_id" : c_id
						},
						success : function(json) {
							if (json == null || json == ",") {
								alert("查询错误！" + json);
								return;
							}
							$("#tb_body").html("");
							var presTables = json.presTables;
							var cru = json.currentPage;
							$.each(presTables, function(index, item) {
								var tr;
								tr = '<td>' + (cru * 5 + index - 4) + '</td>'
										+ '<td>' + item.p_name + '</td>'
										+ '<td>' + item.p_number + '</td>'
										+ '<td>' + item.p_take + '</td>'
										+ '<td>' + item.p_unit + '</td>'
										+ '<td>' + item.p_price + '</td>'
										+ '<td>' + item.p_total + '</td>';

								$("#tb_body").append('<tr>' + tr + '</tr>')

							})
							$("#currentPage").html(json.currentPage);

						}

					});

				});
	})
</script>
</html>
