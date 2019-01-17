
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

</head>
<script src="<%=path%>brower/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
function check(){
	
	var uname = document.getElementById("uname").value;
	
	var upwd = document.getElementById("upwd").value;
	var chickChar= document.getElementById("chickChar").value;
	if(uname==""){
		document.getElementById("unameNone").innerHTML = "姓名不能为空";
		document.getElementById("upwdNone").innerHTML = "";
		document.getElementById("chickCode1").innerHTML = "";
		return ;
		}else if(upwd==""){
			document.getElementById("upwdNone").innerHTML = "密码不能为空";
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("chickCode1").innerHTML = "";
			return ;
		}else if(chickChar==""){
			document.getElementById("chickCode1").innerHTML = "确认密码不能为空";
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("upwdNone").innerHTML = "";
			return ;
		}else if(chickChar!=upwd){
			document.getElementById("chickCode1").innerHTML = "两次密码不一致";
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("upwdNone").innerHTML = "";
			return ;
		}else{
			
		
			document.forms[0].submit();
			
		}
	
	}
	
function changeCode() {
    var img=document.getElementsByTagName("img")[0];
    img.src="<%=path%>ImgServlet?" + new Date().getTime();
	}
</script>
<body>
	<div id="upadtepwd">
		<div id="line"></div>
		<div id="word">>>密码修改<<</div>


		<form action="<%=path%>UpdateServlet" method="post">
			<div>
			账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号<input type="text" name="s_number"id="ue" readonly="readonly" value="${s_number}" /> <span
					id="unameNone"></span>
			</div>
			<div>
			姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名<input type="text" name="uname" id="uname" readonly="readonly" value="${s_name}" /> <span
					id="unameNone"></span>
			</div>
			<div>
			密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码	<input type="password" name="upwd" id="upwd" placeholder="密码" /> <span
					id="upwdNone"></span>
			</div>
			<div>
			确认密码<input type="password" name="chickChar" id="chickChar"
					placeholder="确认密码" /><span
					id="chickCode1"></span>

			</div>
			<div>
				<input type="button" name="sub1" id="sub1" value="确认修改"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'"
					onclick="check()" />
					<a href="<%=path%>ManageServlet?action=staffManage"><input type="button" name="sub1" id="sub1" value="返回主页"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='red'"
					 /></a>
				
					
			</div>
		</form>
	</div>

</body>
</html>
