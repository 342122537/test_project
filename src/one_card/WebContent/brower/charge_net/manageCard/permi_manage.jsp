<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$("#firstpane1 p.menu_head").click(function()
    {
		$(this).css({backgroundImage:"url(<%=path%>brower/js/down.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
       	$(this).siblings().css({backgroundImage:"url(<%=path%>brower/js/left.png)"});
	});
	$("#firstpane3 p.menu_head").click(function()
    {
		$(this).css({backgroundImage:"url(<%=path%>brower/js/down.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
       	$(this).siblings().css({backgroundImage:"url(<%=path%>brower/js/left.png)"});
	});
	//slides the element with class "menu_body" when mouse is over the paragraph
	$("#secondpane p.menu_head").mouseover(function()
    {
	     $(this).css({backgroundImage:"url(<%=path%>brower/js/down.png)"}).next("div.menu_body1").slideDown(500).siblings("div.menu_body").slideUp("slow");
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

#distributed {
	width: 40%;
	height: 100%;
	border-top: 1px gray solid;
	border-right: 1px gray solid;
	float: left;
}

#operation {
	width: 10%;
	height: 100%;
	border-top: 1px gray solid;
	border-right: 1px gray solid;
	float: left;
}

#undistributed {
	width: 29%;
	height: 100%;
	border-top: 1px gray solid;
	float: left;
}

.menu_list {
	width: 150px;
	border: 1px gray solid;
	margin: 20px auto;
	/* 	border-right: 1px gray solid; */
}

.menu_head {
	padding: 15px 20px;
	cursor: pointer;
	position: relative;
	margin: 1px;
	font-weight: bold;
	background: #F9F url(<%=path%>brower/js/left.png) center right no-repeat;
}

.menu_body {
	display: none;
}

#permission {
	width: 80%;
	height: 500px;
	border: 1px gray solid;
	margin: 20px auto;
	background-color: #F9F;
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

.menu_body1 a:hover {
	color: #000000;
	text-decoration: underline;
}

.menu_body2 a:hover {
	color: blue;
	text-decoration: underline;
}

table {
	width: 600px;
	hight: 350px;
	border: 1px gray solid;
}

.hight {
	width: 200px;
	hight: 350px;
	border: 1px gray solid;
}

#role {
	width: 20%;
	height: 100%;
	border-top: 1px gray solid;
	border-right: 1px gray solid;
	float: left;
}

#select {
	height: 80%;
}

h3 {
	color: white
}

button {
	width: 50px;
	margin: 30px 20px;
}
</style>
<body>
	<div id="permission">
		<div id="role">
			<div id="select">
				<div class="menu_list" id="firstpane">
					<!--Code for menu starts here-->
					<p class="menu_head">角色</p>
					<div class="menu_body" id="firstmenu">
						<c:forEach items="${role_list}" var="r" varStatus="s">
							<a
								href="<%=path %>Permi_ManageServlet?action=${r.r_id}&current_id=${r.r_id}">${r.r_name}</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<div>
				<c:if test="${role_name ne null}">

					<h3>
						当前选中角色:<br /> &nbsp;&nbsp;&nbsp;&nbsp;${role_name}
					</h3>

				</c:if>
			</div>

		</div>

		<div id="distributed">
			<div class="menu_list" id="firstpane1">
				<p class="menu_head">已分配菜单</p>
				<div class="menu_body" id="firstmenu">
					<p class="menu_head">&nbsp;&nbsp;业务端</p>
					<div class="menu_body" id="firstmenu">
						<c:forEach items="${father_list}" var="f" varStatus="s">
							<p class="menu_head">&nbsp;&nbsp;&nbsp;&nbsp;${f.m_name}</p>

							<div class="menu_body" id="firstmenu">
								<c:forEach items="${f.m_name}" var="o" varStatus="k">
									<c:if test="${o.m_name ne '卡片管理'}">
										<c:if test="${o.mt_state eq '启用'}">
											<a><input type="checkbox" name="${f.m_id}"
												value="${o.m_id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${o.m_name}<br />
											</a>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
						</c:forEach>

					</div>
				</div>
				<p class="menu_head">&nbsp;&nbsp;管理端</p>
				<div class="menu_body" id="firstmenu">
					<c:forEach items="${father_list}" var="f" varStatus="s">
						<p class="menu_head">&nbsp;&nbsp;&nbsp;&nbsp;${f.m_name}</p>
						<div class="menu_body" id="firstmenu">
							<c:forEach items="${f.m_name}" var="o" varStatus="k">
								<c:if test="${o.m_name eq '卡片管理'}">
									<c:if test="${o.mt_state eq '启用'}">
										<a><input type="checkbox" name="${f.m_id}"
											value="${o.m_id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${o.m_name}<br />
										</a>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<div id="operation">
		<div>
			<button id="addAll">&lt;&lt;</button>
		</div>
		<div>
			<button id="addSelected">&lt;</button>
		</div>
		<div>
			<button id="removeAll">&gt;&gt;</button>
		</div>
		<div>
			<button id="removeSelected">&gt;</button>
		</div>
	</div>
	<div id="undistributed">

		<div class="menu_list" id="firstpane3">
			<p class="menu_head">已分配菜单</p>
			<div class="menu_body" id="firstmenu">
				<p class="menu_head">&nbsp;&nbsp;业务端</p>
				<div class="menu_body" id="firstmenu">
					<c:forEach items="${father_list}" var="f" varStatus="s">
						<p class="menu_head">&nbsp;&nbsp;&nbsp;&nbsp;${f.m_name}</p>

						<div class="menu_body" id="firstmenu">
							<c:forEach items="${f.m_name}" var="o" varStatus="k">
								<c:if test="${o.m_name ne '卡片管理'}">
									<c:if test="${o.mt_state eq '禁用'}">
										<a><input type="checkbox" name="${f.m_id}"
											value="${o.m_id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${o.m_name}<br />
										</a>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>

				</div>
			</div>
			<p class="menu_head">&nbsp;&nbsp;管理端</p>
			<div class="menu_body" id="firstmenu">
				<c:forEach items="${father_list}" var="f" varStatus="s">
					<p class="menu_head">&nbsp;&nbsp;&nbsp;&nbsp;${f.m_name}</p>
					<div class="menu_body" id="firstmenu">
						<c:forEach items="${f.m_name}" var="o" varStatus="k">
							<c:if test="${o.m_name eq '卡片管理'}">
								<c:if test="${o.mt_state eq '禁用'}">
									<a><input type="checkbox" name="${f.m_id}"
										value="${o.m_id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${o.m_name}<br />
									</a>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
		$("#addAll").click(function(){
			
			var rid = ${current_id};
			alert("rid"+rid);
			if (rid == "001"){
				alert("超级管理员,拥有所有权限,无需分配")
				return;
			}
			
			var path ="<%=path%>Permi_ManageServlet?action=addAll&current_id=${current_id}";
			alert(path);
// 			$(location).prop('href', path);
			window.location.href =path;
			});
			


		
		$("#removeAll").click(function(){
			var rid = ${current_id};
			if (rid == "001"){
				alert("超级管理员,拥有所有权限,无需分配")
				return;
			}
			
			var path ="<%=path%>Permi_ManageServlet?action=removeAll&current_id=${current_id}";
// 			$(location).prop('href', path);
			window.location.href =path;
			});
			

	
		
		$("#addSelected").click(function(){
			var rid = ${current_id}
			if (rid == "001"){
				alert("超级管理员,拥有所有权限,无需分配")
				return;
			}
			var selected_oprat =[];//定义一个数组  
		$('input[name="removeCard"]:checked').each(function() {
			selected_oprat.push($(this).val());//将选中的值添加到数组chk_value中    
	        });
			var selectedsys =[];//定义一个数组  
		$('input[name="removeSystem"]:checked').each(function() {
			selectedsys.push($(this).val());//将选中的值添加到数组chk_value中    
	        });

			var path ="<%=path%>Permi_ManageServlet?action=addSelected&current_id=${current_id}"+"&selected_oprat="+selected_oprat+"&selectedsys="+selectedsys;
			
	     
// 							$(location).prop('href', path);
			window.location.href =path;
			});
	
		
		$("#removeSelected").click(function(){
			var rid = ${current_id}
			if (rid == "001"){
				alert("超级管理员,拥有所有权限,无需分配")
				return;
			}
			var selected_oprat =[];//定义一个数组  
			$('input[name="card"]:checked').each(function() {
				selected_oprat.push($(this).val());//将选中的值添加到数组chk_value中    
		        });
				var selectedsys =[];//定义一个数组  
			$('input[name="sys"]:checked').each(function() {
				selectedsys.push($(this).val());//将选中的值添加到数组chk_value中    
		        });
			alert(selectedsys);
		var path = "<%=path%>Permi_ManageServlet?action=removeSelected&current_id=${current_id}"+"&selected_oprat="+selected_oprat+"&selectedsys="+selectedsys;
// 							$(location).prop('href', path);
			window.location.href =path;
			});

	});
</script>
<script type="text/javascript">
	$(function() {
		$("#sssss").click(function(){
			var rid = ${current_id}
			if (rid == "001"){
				alert("超级管理员,拥有所有权限,无需分配")
				return;
			}
			var selected_oprat = $("input:checkbox[name='message']:checked").map(function(index,elem) {
	            return $(elem).val();
	        }).get().join(',');
	        alert("选中的checkbox的值为："+selected_oprat);
			var path ="<%=path%>
	?action=ssss&currtent_id=" + rid;
					$(location).prop('href', path);

				});

	});
</script>
</html>