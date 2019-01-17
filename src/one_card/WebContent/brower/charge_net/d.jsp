<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查找员工</title>
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

h2 {
	color: #FFF
}
</style>
<body>
	<div style="margin: 10px auto; width: 800px; background-color: #F9F">
		<div style="width: 360px;">
			<h2>人员管理>>人员查询</h2>
		</div>
		<form id="quary" action="" method="post">
			<div>
				人员姓名: <input type="text" id="s_name" name="s_name" value="">
				所属科室: <select name="sex" id="d_id" style="background: none">
					<option value=""></option>
					<c:forEach items="${keshi_prama}" var="f" varStatus="s">
						<option value="${f.d_id }">${f.d_name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				所属角色: <select name="role" id="role" style="background: none">
					<option value=""></option>
					<c:forEach items="${role_prama}" var="u" varStatus="s">
						<option value="${u.r_id }">${u.r_name}</option>
					</c:forEach>
				</select> 状态: <select name="s_state" id="s_state" style="background: none">
					<option></option>

					<option>启用</option>
					<option>禁用</option>
				</select> <input type="button" id="quary_cid" name="quary_cid" value=查询
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'">
			</div>
		</form>
		<div style="width: 800px;">
			<form action="" method="post" name="account" id="account">
				<table width="100%" border="1">
					<tr>
						<td>序号</td>
						<td>人员姓名</td>
						<td>科室</td>
						<td>角色</td>
						<td>状态</td>
						<td>操作</td>


					</tr>
					<tbody id="tb_body">
						<c:forEach items="${map}" var="u" varStatus="s">
							<c:if test="${s.index % 2 == 0}">
								<tr style="background-color: bule">

									<td>${(s.index+1)+(currentPage-1)*5}<span
										style="display: none; background-color: Blue">11</span>

									</td>
									<td>${u.S_NAME}</td>
									<td>${u.D_NAME}</td>
									<td>${u.R_NAME}</td>
									<td>${u.s_state}</td>
									<td width="200px"><a
										href="<%=path%>UserServlet?action=deleteStaff&s_id=+${u. S_NAME}">删除</a>
										<a
										href="<%=path%>UserServlet?action=updateStaff&s_id=+${u. S_NAME}">修改</a>
										<a
										href="<%=path%>UserServlet?action=banStaff&s_id=+${u. S_NAME}">
											<c:if test="${u.s_state ne '启用'}">启用</c:if> <c:if
												test="${u.s_state eq '启用'}">禁用</c:if>

									</a> <a
										href="<%=path%>UserServlet?action=updatePwd&s_id=+${u. S_NAME}">重置密码</a></td>

								</tr>
							</c:if>
							<c:if test="${s.index % 2 != 0}">
								<tr style="background-color: red">

									<td width="50px">${(s.index+1)+(currentPage-1)*5}<span
										style="display: none; background-color: Blue">11</span></td>
									<td>${u.S_NAME}</td>
									<td>${u.D_NAME}</td>
									<td>${u. R_NAME}</td>
									<td>${u. s_state}</td>
									<td width="200px"><a
										href="<%=path%>UserServlet?action=deleteStaff&s_id=+${u. S_NAME}">删除</a>
										<a
										href="<%=path%>UserServlet?action=updateStaff&s_id=+${u. S_NAME}">修改</a>
										<a
										href="<%=path%>UserServlet?action=banStaff&s_id=+${u. S_NAME}">
											<c:if test="${u.s_state ne '启用'}">启用</c:if> <c:if
												test="${u.s_state eq '启用'}">禁用</c:if>

									</a> <a
										href="<%=path%>UserServlet?action=updatePwd&s_id=+${u. S_NAME}">重置密码</a></td>

								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<p id="p">
					第 ${currentPage } <span id="currentPage"></span> 页/共 ${toalePage} <span
						id="toalePage"></span>页 <a id="firstPage">首页</a> <a id="lastPage">上一页</a>
					<a id="nextPage">下一页</a> <a id="endPage">尾页</a> <a
						href=>首页</a> <a id="last"
						href="<%=path %>ManageServlet?action=last/nextPage&currentPage=${currentPage-1 }">上一页</a>
					<a id="next"
						href="<%=path %>ManageServlet?action=last/nextPage&currentPage=${currentPage+1 }">下一页</a>
					<a href="<%=path%>ManageServlet?action=endPage&">尾页</a>
				</p>
			</form>
		</div>
		<div>
			<a href="<%=path%>brower/charge_net/welcome.jsp"> <input
				type="button" id="back" name="addmoney" value="返回"
				onMouseOut="this.style.backgroundColor=''"
				onMouseOver="this.style.backgroundColor='#efefef'"></a>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {

		$("#last").on("click", function() {

			var currentPage = $
			{
				currentPage
			}
			;

			if (currentPage == 1) {
				alert("已经是首页了");
				return;
			}

		});
		$("#next").on("click", function() {

			var currentPage = $
			{
				currentPage
			}
			;
			var toalePage = $
			{
				toalePage
			}
			if (currentPage == toalePage) {
				alert("已经是尾页了");
				return;
			}

		});
		
		$("#quary_cid").on("click",function(){
			
			var s_name = $("#s_name").val();
			
			var r_id = $("#role").val();
			var d_id = $("#d_id").val();
			var s_state = $("#s_state").val();
			alert("name"+s_name);
			alert("state"+s_state);alert("jues"+r_id);alert("科室"+d_id);
			var path ="<%=path%>ManageServlet?action=quary_req&s_name="+s_name+"&s_keshi="+d_id+"&r_id="+r_id+"&currentPage=1";
			$(location).prop('href', path)
			
			
			

		})
	});
</script>
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
							$("#c_id").html(json.card_msg.c_id);
							$("#c_balance").html(json.card_msg.c_balance);
							$("#c_deposit").html(json.card_msg.c_deposit);
							var presTables = json.presTables;
							alert(presTables)
							$("#tb_body").html("");
							var cru = json.currentPage;
							$.each(presTables, function(index, item) {
								var tr;
								tr = '<td>' + (cru * index + 1) + '</td>'
										+ '<td>' + item.p_name + '</td>'
										+ '<td>' + item.p_number + '</td>'
										+ '<td>' + item.p_take + '</td>'
										+ '<td>' + item.p_unit + '</td>'
										+ '<td>' + item.p_price + '</td>'
										+ '<td>' + item.p_total + '</td>';

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
				url:"<%=path%>ManageServlet",
						type : "post",
						dataType : "json",
						data :{action;"first"
							"action=firstPage&currentPage="+currentPage,
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
			var currentPage =$("#currentPage").text()-1;
			if(currentPage == 0 ){
				alert("已经是首页了");
				return;
			}
			alert("currentPage"+currentPage)
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
			alert("currentPage"+(parseInt(currentPage)+1))
			
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