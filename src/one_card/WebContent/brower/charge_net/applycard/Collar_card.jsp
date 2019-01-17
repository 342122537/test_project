<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>卡片业务>>领卡</title>
</head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
<style>
#quary_cid, #addmoney, #back, #addStaff ,#newapply{
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
			<h2>领卡>>申请单</h2>
		</div>
		<form id="quary" action="" method="post">


			<div>
				申请日期: <input type="text" id="time1" name="time1"
					value="${pplyTime1}"> 至 <input type="text" id="time2"
					name="time2" value="${pplyTime2}"> 审核状态: <select
					name="s_state" id="s_state" style="background: none">
					<option>${pplys_state}</option>

					<option></option>
					<option>待审核</option>
					<option>已审核</option>
					
				</select>
			</div>
			<div>
				<input type="button" id="quary_cid" name="quary_cid" value="查询"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"> <input
					type="button" id="newapply" name="newapply" value="新申请"
					onclick="javascript:location.href='<%=path%>brower/charge_net/applycard/newapply.jsp'"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'">
			</div>
		</form>
		<div style="width: 800px;">
			<form action="" method="post" name="account" id="account">
				<table width="100%" border="1">
					<tr>
						<td style="width: 50px;">序号</td>
						<td>申请日期</td>
						<td>申请卡数量</td>
						<td>申请人</td>
						<td>审核状态</td>
						<td>审核人</td>
						<td>审核时间</td>
						<td>操作</td>


					</tr>
					<tbody id="tb_body">
						<c:forEach items="${apply_list}" var="u" varStatus="s">
							<c:if test="${s.index % 2 == 0}">
								<tr style="background-color: bule">

									<td style="width: 50px;">${(s.index+1)+(currentPages-1)*5}<span
										style="display: none; background-color: Blue"></span>

									</td>

									<td>${u.c_imptime}</td>
									<td>${u.a_appNumber}</td>
									<td>${u.c_applyer}</td>
									<td>${u.state}</td>
									<td>${u.a_auditor}</td>
									<td>${u.a_autime}</td>


									<td width="200px"><c:if test="${u.state eq '待审核'}">
											<a
												href="javascript:if(confirm('确认要修改吗？')); 
									$(location).prop('href', '<%=path%>Collar_CardServlet?action=apply_msg&applyer=${u.c_applyer}&applyTime=${u. c_imptime}&applyNumer=${u.a_appNumber}&a_id=${u.a_id}&');"
												id="deletecard">修改</a>

										</c:if></td>
								</tr>
							</c:if>
							<c:if test="${s.index % 2 != 0}">
								<tr style="background-color: red">

									<td style="width: 25px;">${(s.index+1)+(currentPages-1)*5}<span
										style="display: none; background-color: Blue">11</span></td>

									<td>${u.c_imptime}</td>
									<td>${u.a_appNumber}</td>
									<td>${u.c_applyer}</td>
									<td>${u.state}</td>
									<td>${u.a_auditor}</td>
									<td>${u.a_autime}</td>


									<td width="200px"><c:if test="${u.state eq '待审核'}">
											<a
												href="javascript:if(confirm('确认要修改吗？')); 
									$(location).prop('href', '<%=path%>Collar_CardServlet?action=apply_msg&applyer=${u.c_applyer}&applyTime=${u. c_imptime}&applyNumer=${u.a_appNumber}&a_id=${u.a_id}&');"
												id="deletecard">修改</a>

										</c:if></td>
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
			
			
			var s_state = $("#s_state").val();
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var path ="<%=path%>Collar_CardServlet?action=enter_apply&applytime1="+time1+"&pplytime2="+time2+"&pplys_state="+s_state+"&currentPage=1";
			$(location).prop('href', path);
			
			});
			
	});
</script>
<script type="text/javascript">
		$(function() {
			
		$("#first").on("click",function(){
			
			var s_state = $("#s_state").val();
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var path ="<%=path%>Collar_CardServlet?action=enter_apply&applytime1="+time1+"&pplytime2="+time2+"&pplys_state="+s_state+"&currentPage=1";
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
			
			
			
			var s_state = $("#s_state").val();
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var path ="<%=path%>Collar_CardServlet?action=enter_apply&applytime1="+time1+"&pplytime2="+time2+"&pplys_state="+s_state+"&currentPage=${currentPages-1 }";
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
			var s_state = $("#s_state").val();
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var path ="<%=path%>Collar_CardServlet?action=enter_apply&applytime1="+time1+"&pplytime2="+time2+"&pplys_state="+s_state+"&currentPage=${currentPages+1}";
			$(location).prop('href', path);
			
			
			

			
		});
		
	});
	</script>
<script type="text/javascript">		
	$(function() {
		$("#end").on("click",function(){
			

			var s_state = $("#s_state").val();
			var time1 = $("#time1").val();
			var time2 = $("#time2").val();
			var path ="<%=path%>Collar_CardServlet?action=enter_apply&applytime1="+ time1
									+ "&pplytime2="
									+ time2
									+ "&pplys_state="
									+ s_state
									+ "&currentPage=${allpage}";
							$(location).prop('href', path);
						});
	});
</script>

</html>