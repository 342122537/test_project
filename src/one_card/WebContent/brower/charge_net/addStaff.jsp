
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
	function check() {

		var uname = document.getElementById("uname").value;

		var upwd = document.getElementById("upwd").value;
		var chickChar = document.getElementById("chickChar").value;
		var sexname = document.getElementById("sexname").value;
		if (uname == "") {
			document.getElementById("unameNone").innerHTML = "姓名不能为空";
			document.getElementById("upwdNone").innerHTML = "";
			document.getElementById("chickCode1").innerHTML = "";
			document.getElementById("sexnameNone").innerHTML = "";
			return;
		} else if (upwd == "") {
			document.getElementById("upwdNone").innerHTML = "密码不能为空";
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("chickCode1").innerHTML = "";
			document.getElementById("sexnameNone").innerHTML = "";
			return;
		} else if (chickChar == "") {
			document.getElementById("chickCode1").innerHTML = "确认密码不能为空";
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("upwdNone").innerHTML = "";
			document.getElementById("sexnameNone").innerHTML = "";
			return;
		} else if (chickChar != upwd) {
			document.getElementById("chickCode1").innerHTML = "两次密码不一致";
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("upwdNone").innerHTML = "";
			document.getElementById("sexnameNone").innerHTML = "";
			return;
		} else if (sexname == "") {
			document.getElementById("chickCode1").innerHTML = "";
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("upwdNone").innerHTML = "";
			document.getElementById("sexnameNone").innerHTML = "姓名不能为空";
			return;
		} else {

			document.forms[0].submit();

		}

	}
	</script>
<script type="text/javascript">
	$(function(){
		
	$("#uname").blur(function() {//blur表示失去焦点时触发

		//取用户名
		var uname = $("#uname").val();

		//调ajax
		$.ajax({
			url : "<%=path%>ManageServlet",
				data : {
					action : "CHICKNAME",
					name : uname
				},
				type : "POST",
				dataType : "TEXT",
				success : function(data) {
					// 					alert(data)
					if (data == 2) {
						$("#unameNone").html("该用户名已存在");
						$("#unameNone").css("color", "red");
						$("#uname").val("");
					} else {
						$("#unameNone").html("该用户名可用");
						$("#unameNone").css("color", "green");
					}
				}

			});

		});
		$("#uname").focus(function() {
			$("#unameNone").html("");
		});
		$("#upwd").focus(function() {
			$("#upwdNone").html("");
		});
		$("#chickChar").focus(function() {
			$("#chickCode1").html("");
		});
		$("#sexname").focus(function() {
			$("#sexnameNone").html("");
		});
	})
</script>
<body>
	<div id="addddd">
		<div id="line"></div>

		<div id="word">***新增人员***</div>


		<form action="<%=path%>ManageServlet?action=add" method="post">
			<div>
				账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:<input type="text"
					name="uname" id="uname" placeholder="账号" /> <span id="unameNone"></span>
			</div>
			<div>
				姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:<input type="text"
					name="sexname" id="sexname" placeholder="姓名" /> <span
					id="sexnameNone"></span>
			</div>
			<div>
				密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password"
					name="upwd" id="upwd" placeholder="密码" /> <span id="upwdNone"></span>
			</div>
			<div>
				确人密码:<input type="password" name="chickChar" id="chickChar"
					placeholder="确认密码" /><span id="chickCode1"></span>

			</div>
			<div>
				所属科室: <select name="DEPT" id="d_id" style="background: none">
					<c:forEach items="${keshi_prama}" var="f" varStatus="s">
						<option value="${f.d_id }">${f.d_name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				所属角色: <select name="JORE" id="role" style="background: none">
					<c:forEach items="${role_prama}" var="u" varStatus="s">
						<option value="${u.r_id }">${u.r_name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="button" name="sub1" id="sub1" value="确认"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'" onclick="check()" />
				<a href="<%=path%>ManageServlet?action=staffManage"><input
					type="button" name="sub1" id="sub1" value="返回"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'" /></a>
			</div>
		</form>
	</div>

</body>
<script type="text/javascript">	
$(function() {
	$("#d_ddid").on("click",function(){
	
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
	$("#roddle").on("click",function(){
	
		$.ajax({
				url:"<%=path%>ManageServlet",
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
