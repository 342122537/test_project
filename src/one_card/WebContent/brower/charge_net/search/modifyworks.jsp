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
			<h2>统计查询>>工作量查询</h2>


		</div>
		<div>查询条件:</div>
		<form id="quary" action="" method="post">
			<div>


				统计时间: <input type="text" id="time1" name="time1" value="${time1}">
				至 <input type="text" id="time2" name="time2" value="${time2}">

				统计人员:<select name="sname" id="s_name" style="background: none">
					<option>${sname}</option>
					<c:forEach items="${staffList}" var="u" varStatus="s">
						<option>${u.s_name}</option>

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
						<td>工作人员</td>
						<td>售卡数</td>
						<td>换卡数</td>
						<td>退卡数</td>
						<td>充值数</td>
						<td>预约挂号号</td>
						<td>登记处方数</td>
						<td>处方退费数</td>


					</tr>
					<tbody id="tb_body">
						<c:forEach items="${works_staff}" var="u" varStatus="s">
							<c:if test="${s.index % 2 == 0}">
								<tr style="background-color: bule">

									<td style="width: 50px;">${(s.index+1)+(currentPages-1)*5}<span
										style="display: none; background-color: Blue"></span>

									</td>

									<td>${u.s_name}</td>
									<td>${u.sale_number}</td>
									<td>${u.chang_number}</td>
									<td>${u.exit_number}</td>
									<td>${u.add_number}</td>
									<td>${u.per_number}</td>
									<td>${u.dengji_number}</td>
									<td>${u.ctuifei_number}</td>


								</tr>
							</c:if>
							<c:if test="${s.index % 2 != 0}">
								<tr style="background-color: red">

									<td style="width: 25px;">${(s.index+1)+(currentPages-1)*5}<span
										style="display: none; background-color: Blue">11</span></td>

									<td>${u.s_name}</td>
									<td>${u.sale_number}</td>
									<td>${u.chang_number}</td>
									<td>${u.exit_number}</td>
									<td>${u.add_number}</td>
									<td>${u.per_number}</td>
									<td>${u.dengji_number}</td>
									<td>${u.ctuifei_number}</td>

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
			
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var s_name = $("#s_name").val();
			var path ="<%=path%>SearchServlet?action=works&currentPage=1&time1="+time1+"&time2"+time2+"&s_name"+s_name;
			alert("path="+path);
			$(location).prop('href', path);
			
			});
			
	});
</script>
<script type="text/javascript">
		$(function() {
			
		$("#first").on("click",function(){
			
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var s_name = $("#s_name").val();
			var path ="<%=path%>SearchServlet?action=works&time1="+time1+"&time2"+time2+"&s_name"+s_name+"&currentPage=1";
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
			
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var s_name = $("#s_name").val();
			var path ="<%=path%>SearchServlet?action=works&time1="+time1+"&time2"+time2+"&s_name"+s_name+"&currentPage=${currentPage-1 }";
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
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var s_name = $("#s_name").val();
			var path ="<%=path%>SearchServlet?action=works&time1="+time1+"&time2"+time2+"&s_name"+s_name+"&currentPage=${currentPages+1}";
					$(location).prop('href', path);

				});

	});
</script>
<script type="text/javascript">		
	$(function() {
		$("#end").on("click",function(){
			
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var s_name = $("#s_name").val();
			
			var path ="<%=path%>SearchServlet?action=works&time1="+ time1 + "&time2" + time2 + "&s_name" + s_name+ "&currentPage=${allpage}";
					$(location).prop('href', path);
				});
	});
</script>

</html>