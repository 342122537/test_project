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
			<h2>人员管理>>人员查询</h2>
		</div>
		<form id="quary" action="" method="post">
			<div>
				人员姓名: <input type="text" id="s_name" name="s_name"
					value="${quaryname}"> 所属科室: <select name="sex" id="d_id"
					style="background: none">
					<option selected="selected" value="${quarykeshi.d_id}">${quarykeshi.d_name}
					</option>
					<option value=""></option>

					<c:forEach items="${keshi_prama}" var="f" varStatus="s">
						<option value="${f.d_id }">${f.d_name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				所属角色: <select name="role1" id="role" style="background: none">
					<option value="${RoleTable.r_id}">${quaryr_id.r_name}
					</option>

					<c:forEach items="${role_prama}" var="u" varStatus="s">
						<option value="${u.r_id }">${u.r_name}</option>
					</c:forEach>
				</select> 状态: <select name="s_state" id="s_state" style="background: none">
					<option >${quarys_state}</option>

					<option>启用</option>
					<option>禁用</option>
				</select> <input type="button" id="quary_cid" name="quary_cid" value=查询
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'"> <input
					type="button" id="addStaff" name="addStaff" value=新增人员
					onclick="javascript:location.href='<%=path%>brower/charge_net/addStaff.jsp'"
					onMouseOut="this.style.backgroundColor=''"
					onMouseOver="this.style.backgroundColor='#efefef'">
			</div>
		</form>
		<div style="width: 800px;">
			<form action="" method="post" name="account" id="account">
				<table width="100%" border="1">
					<tr>
						<td style="width: 50px;">序号</td>
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

									<td style="width: 50px;">${(s.index+1)+(currentPage-1)*5}<span
										style="display: none; background-color: Blue"></span>

									</td>
									<td>${u.S_NAME}</td>
									<td>${u.D_NAME}</td>
									<td>${u.R_NAME}</td>
									<td>${u.s_state}</td>
									<td width="200px"><a
										href="<%=path%>ManageServlet?action=deleteStaff&s_id=${u.s_number}&s_name=${u. S_NAME}&s_state=${u. s_state}">删除</a>
										<a
										href="<%=path %>ManageServlet?
										action=updateStaff&
										s_name=${u. S_NAME}&
										s_number=${u.s_number}&
										d_name=${u.D_NAME}&
										r_name=${u.r_NAME}">修改</a>
										<a
										href="<%=path%>ManageServlet?action=banStaff&s_id=${u.s_number}&s_name=${u. S_NAME}&s_state=${u. s_state}">
											<c:if test="${u.s_state ne '启用'}">启用</c:if> <c:if
												test="${u.s_state eq '启用'}">禁用</c:if>

									</a> <a
										href="<%=path%>ManageServlet?action=updatePwd&s_id=${u.s_number}&s_name=${u.s_name}">重置密码</a></td>

								</tr>
							</c:if>
							<c:if test="${s.index % 2 != 0}">
								<tr style="background-color: red">

									<td style="width: 25px;">${(s.index+1)+(currentPage-1)*5}<span
										style="display: none; background-color: Blue">11</span></td>
									<td>${u.S_NAME}</td>
									<td>${u.D_NAME}</td>
									<td>${u. R_NAME}</td>
									<td>${u. s_state}</td>
									<td width="200px"><a
										href="<%=path%>ManageServlet?action=deleteStaff&s_id=${u.s_number}&s_name=${u. S_NAME}&s_state=${u. s_state}}">删除</a>
										<a
										href="<%=path %>ManageServlet?
										action=updateStaff&
										s_name=${u. S_NAME}&
										s_number=${u.s_number}&
										d_name=${u.D_NAME}&
										r_name=${u.r_NAME}">修改</a>
										<a
										href="<%=path%>ManageServlet?action=banStaff&s_id=${u.s_number}&s_name=${u. S_NAME}&s_state=${u. s_state}">
											<c:if test="${u.s_state ne '启用'}">启用</c:if> <c:if
												test="${u.s_state eq '启用'}">禁用</c:if>

									</a> <a
										href="<%=path%>ManageServlet?action=updatePwd&s_id=${u.s_number}&s_name=${u.s_name}">重置密码</a></td>

								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<p>
					第 ${currentPage } 页/共 ${toalePage} 页 <a id="first">首页</a> <a
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
	$(function() {
		
		$("#quary_cid").on("click",function(){
			
			var s_name = $("#s_name").val();
			var r_id = $("#role").val();
			var d_id = $("#d_id").val();
			var s_state = $("#s_state").val();
			
			var path ="<%=path%>ManageServlet?action=quary_req&s_name="+s_name+"&s_keshi="+d_id+"&r_id="+r_id+"&s_state="+s_state+"&currentPage=${currentPage-1 }";
			$(location).prop('href', path);
			
			});
			
	});
</script>
<script type="text/javascript">
		$(function() {
			
		$("#first").on("click",function(){
			
			var s_name = $("#s_name").val();
			var r_id = $("#role").val();
			var d_id = $("#d_id").val();
			var s_state = $("#s_state").val();
// 			alert("name"+s_name);
// 			alert("state"+s_state);alert("jues"+r_id);alert("科室"+d_id);
			
			var path ="<%=path%>ManageServlet?action=first&s_name="+s_name+"&s_keshi="+d_id+"&r_id="+r_id+"&s_state="+s_state;
			$(location).prop('href', path);
			
			

			
		});
		});
		</script>
<script type="text/javascript">
		$(function() {
		$("#last").on("click",function(){
			var current = ${currentPage }
			
			if(current==1){
				alert("已经是首页了")
				return;
			}
			
			
			
			var s_name = $("#s_name").val();
			var r_id = $("#role").val();
			var d_id = $("#d_id").val();
			var s_state = $("#s_state").val();
// 			alert("name"+s_name);
// 			alert("state"+s_state);alert("jues"+r_id);alert("科室"+d_id);
			var path ="<%=path%>ManageServlet?action=last/nextPage&s_name="+s_name+"&s_keshi="+d_id+"&r_id="+r_id+"&s_state="+s_state+"&currentPage=${currentPage-1 }";
			$(location).prop('href', path);
			
			

			
		});
	});
	</script>
<script type="text/javascript">		
	$(function() {
		$("#next").on("click",function(){
			var current = ${currentPage };
			var total =  ${toalePage};
			
			if(current==total||total==0){
				alert("已经是尾页了")
				return;
			}
			var s_name = $("#s_name").val();
			var r_id = $("#role").val();
			var d_id = $("#d_id").val();
			var s_state = $("#s_state").val();
// 			alert("name"+s_name);
// 			alert("state"+s_state);alert("jues"+r_id);alert("科室"+d_id);
			var path ="<%=path%>ManageServlet?action=last/nextPage&s_name="+s_name+"&s_keshi="+d_id+"&r_id="+r_id+"&s_state="+s_state+"&currentPage=${currentPage+1 }";
			$(location).prop('href', path);
			
			

			
		});
		
	});
	</script>
<script type="text/javascript">		
	$(function() {
		$("#end").on("click",function(){
			
			var s_name = $("#s_name").val();
			var r_id = $("#role").val();
			var d_id = $("#d_id").val();
			var s_state = $("#s_state").val();
// 			alert("name"+s_name);
// 			alert("state"+s_state);alert("jues"+r_id);alert("科室"+d_id);
			var path ="<%=path%>ManageServlet?action=endPage&s_name="
							+ s_name + "&s_keshi=" + d_id + "&r_id=" + r_id
							+ "&s_state=" + s_state
							+ "&currentPage=${toalePage}";
					$(location).prop('href', path);

				});
	});
</script>



</html>