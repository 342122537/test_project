<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>卡管理>>卡查询</title>
</head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
<style>
#quary_cid, #addmoney, #back, #addStaff {
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

select {
	width: 60px;
	height: 20px;
}

div {
	margin: 10px auto;
	width: 600px;
}

h2 {
	color: #FFF
}
</style>
<%
	
%>


<body>
	<div style="margin: 10px auto; width: 800px; background-color: #F9F">
		<div style="width: 360px;">
			<h2>卡管理>>卡查询</h2>


		</div>
		<div>查询条件:</div>
		<form id="quary" action="" method="post">
			<div>
				卡号: <input type="text" id="c_id" name="
					c_id" value="${c_id}">

				卡状态: <select name="s_state" id="s_state" style="background: none">
					<option>${s_state}</option>
					<option>待领用</option>
					<option>已领用</option>
					<option>待销售</option>
					<option>已销售</option>
					<option>已注销</option>
				</select> 领用人:<select name=c_leader id="c_leader" style="background: none">
					<option>${c_leader}</option>
					<c:forEach items="${allstaff_list}" var="u" varStatus="s">
						<option value="${u.s_id}">${u.s_name}</option>

					</c:forEach>


	
				</select> <input type="button" id="quary_cid" name="quary_cid" value="查询"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'">
			</div>
		</form>
		<div style="width: 800px;">
			<form action="" method="post" name="account" id="account">
				<table width="100%" border="1">
					<tr>
						<td style="width: 50px;">序号</td>
						<td>卡号</td>
						<td>卡状态</td>
						<td>领用人</td>
						<td>就诊人</td>
						<td>操作</td>


					</tr>
					<tbody id="tb_body">
						<c:forEach items="${modifyList}" var="u" varStatus="s">
							<c:if test="${s.index % 2 == 0}">
								<tr style="background-color: bule">

									<td style="width: 50px;">${(s.index+1)+(currentPages-1)*5}<span
										style="display: none; background-color: Blue"></span>

									</td>

									<td>${u.c_id}</td>
									<td>${u.c_state}</td>
									<td>${u.c_leader}</td>
									<td>${u.p_name}</td>


									<td width="200px"><a
										href="<%=path%>ModifyCardServlet?action=link_card&c_id=${u.c_id}&c_state=${u.c_state}&c_leader=${u.c_leader}&p_name=${u.p_name}
										&c_balance=${c_balance}&c_seller=${c_seller}&c_sellTim=${c_sellTim}&c_leaadTime=${c_leaadTime}"
										id="deletecard">查看</a></td>
								</tr>
							</c:if>
							<c:if test="${s.index % 2 != 0}">
								<tr style="background-color: red">

									<td style="width: 25px;">${(s.index+1)+(currentPages-1)*5}<span
										style="display: none; background-color: Blue">11</span></td>

									<td>${u.c_id}</td>
									<td>${u.c_state}</td>
									<td>${u.c_leader}</td>
									<td>${u.p_name}</td>

									<td width="200px"><a
										href="<%=path%>ModifyCardServlet?action=link_card&c_id=${u.c_id}&c_state=${u.c_state}&c_leader=${u.c_leader}&p_name=${u.p_name}&c_balance=${c_balance}&c_seller=${c_seller}&c_sellTim=${c_sellTim}&c_leaadTime=${c_leaadTime}"
										id="deletecard">查看</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<p>
					第 ${currentPages } 页/共 ${allpage} 页 <a id="first">首页</a> <a
						id="last">上一页</a> <a id="next">下一页</a> <a id="end">尾页</a>
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
</script>
<script type="text/javascript">
	$(function() {
		
		$("#quary_cid").on("click",function(){
			
			var c_id = $("#c_id").val();
			
			var c_leader = $("#c_leader").val();
			alert("c_leader="+c_leader);
			var s_state = $("#s_state").val();
			alert("s_state="+s_state);

			var path ="<%=path%>ModifyCardServlet?action=modify&c_id="+c_id+"&s_state="+s_state+"&get_man="+c_leader+"&currentPage=1";
			
			alert("path="+path);
			$(location).prop('href', path);
			
			});
			
	});
</script>
<script type="text/javascript">
		$(function() {
			
		$("#first").on("click",function(){
			
			var c_id = $("#c_id").val();
			var c_leader = $("#c_leader").val();
			var s_state = $("#s_state").val();
			var path ="<%=path%>ModifyCardServlet?action=modify&c_id="+c_id+"&s_state="+s_state+"&get_man="+c_leader+"&currentPage=1";
			$(location).prop('href', path);
			
			

			
		});
		});
		</script>
<script type="text/javascript">
		$(function() {
		$("#last").on("click",function(){
			var current = ${currentPages }
			
			if(current==1){
				alert("已经是首页了")
				return;
			}
			
			
			
			var c_id = $("#c_id").val();
			var c_leader = $("#c_leader").val();
			var s_state = $("#s_state").val();
			var path ="<%=path%>ModifyCardServlet?action=modify&c_id="+c_id+"&s_state="+s_state+"&get_man="+c_leader+"&currentPage=${currentPages-1}";
			$(location).prop('href', path);
			
			
			

			
		});
	});
	</script>
<script type="text/javascript">		
	$(function() {
		$("#next").on("click",function(){
			var current = ${currentPages };
			var total =  ${allpage};
			
			if(current==total||total==0){
				alert("已经是尾页了")
				return;
			}
			var c_id = $("#c_id").val();
			var c_leader = $("#c_leader").val();
			var s_state = $("#s_state").val();
			var path ="<%=path%>ModifyCardServlet?action=modify&c_id="+c_id+"&s_state="+s_state+"&get_man="+c_leader+"&currentPage=${currentPages+1}";
			$(location).prop('href', path);
			
			
			

			
		});
		
	});
	</script>
<script type="text/javascript">		
	$(function() {
		$("#end").on("click",function(){
			
			var c_id = $("#c_id").val();
			var c_leader = $("#c_leader").val();
			var s_state = $("#s_state").val();
			
			var path ="<%=path%>
	ModifyCardServlet?action=modify&c_id="
							+ c_id + "&s_state=" + s_state + "&get_man="
							+ c_leader + "&currentPage=${allpage}";
					$(location).prop('href', path);
				});
	});
</script>

</html>