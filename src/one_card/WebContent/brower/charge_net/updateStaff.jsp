
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>工作人员登录页面</title>
<link href="<%=path%>/brower/charge_net/css/login.css" type="text/css"
	rel="stylesheet" />
<style type="text/css">
form div {
	width: 390px;
	margin-left: 100px;
	height: 40px;
	margin-top: 10px;
}
</style>
</head>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
<%%>
</script>
<body>
	<div id="upadte">
		<div id="line"></div>
		<div id="word">>>修改人员<<</div>


		<form action="<%=path%>ManageServlet?action=update" method="post">
			<div>
				人员账号:<input type="text" readonly="readonly" id="s_number"
					name="s_number" value="${s_number}" style="border:0px; width:50px; margin : 0px auto"/>
			</div>
			<div>
				人员姓名:<input type="text" readonly="readonly" id="s_name"
					name="s_name" value="${s_name}" style="border:0px; width:50px; margin : 0px auto" />
			</div>
			<div>
				所属科室: <select name="s_keshi" id="d_id" style="background: none">

					<c:forEach items="${keshi_prama}" var="f" varStatus="s">
						<option value="${f.d_id }">${f.d_name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				所属角色: <select name="r_id" id="role" style="background: none">

					<c:forEach items="${role_prama}" var="u" varStatus="s">
						<option value="${u.r_id }">${u.r_name}</option>
					</c:forEach></select>
			</div>


			<div>
				<input type="submit" name="sub1" id="sub1" value="确认修改"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'" /> <a
					href="<%=path%>ManageServlet?action=staffManage"><input
					type="button" name="sub1" id="sub1" value="返回"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'" /></a>
			</div>
		</form>
	</div>

</body>
<script type="text/javascript">	
$(function() {
	$("#dddd_id").on("click",function(){
	
		$.ajax({
				url:"<%=path%>ManageServlet",
						type : "post",
						data : {
							action : "DeptTable"
						},
						dataType : "json",
						success : function(json) {

							if (json == null) {
								alert("请求为空")
								return;
							}
							var cru = json.ke_list;
							$("#d_id").html("");
							$.each(cru, function(index, item) {
								
								var op;
								
								$("#d_id").append(
										"<option value="+item.d_id +">&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
												+ item.d_name+item.d_id + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>");

							});

						}
					});

				});

	});
</script>
<script type="text/javascript">	
$(function() {
	$("#rddole").on("click",function(){
	
		$.ajax({
				url:"<%=path%>
	ManageServlet",
										type : "post",
										data : {
											action : "RoleTable"
										},
										dataType : "json",
										success : function(json) {
											if (json == null) {
												alert("请求为空")
												return;
											}
											var cru = json.list;
											$("#role").html("");
											$
													.each(
															cru,
															function(index,
																	item) {
																var op;
																$("#role")
																		.append(
																				"<option value="+item.r_id +">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
																						+ item.r_name
																						+ item.r_id
																						+ "&nbsp;&nbsp;&nbsp;&nbsp;</option>");
															});
										}
									});
						});
	});
</script>
</html>
