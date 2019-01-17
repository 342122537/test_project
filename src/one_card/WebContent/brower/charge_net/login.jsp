
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
		document.getElementById("unameNone").innerHTML = "*姓名不能为空";
		document.getElementById("upwdNone").innerHTML = "";
		document.getElementById("chickCode").innerHTML = "";
		return ;
		}else if(upwd==""){
			document.getElementById("upwdNone").innerHTML = "*密码不能为空";
			document.getElementById("unameNone").innerHTML = "";
			document.getElementById("chickCode").innerHTML = "";
			return ;
		}else if(chickChar==""){
			document.getElementById("chickCode").innerHTML = "*验证码不能为空";
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
	<div id="login">
		<div id="line"></div>
		<div id="word">智能一卡通系统</div>


		<form action="<%=path%>LoginServlet" method="post">
			<div>
				<span>用户名:</span><input type="text" name="uname" id="uname" /> <span
					id="unameNone"></span>
			</div>
			<div>
				<span>密&nbsp;&nbsp;&nbsp;&nbsp;码:</span><input type="password"
					name="upwd" id="upwd" /> <span id="upwdNone"></span>
			</div>
			<div>
				<span>验证码:</span><input type="text" name="chickChar" id="chickChar" />
				<span id="chickCode"></span> <br /> <img src="<%=path%>ImgServlet"
					onclick="changeCode()" />

			</div>
			<div>
				<input type="button" name="sub" id="sub" value="登录"
					onMouseOut="this.style.backgroundColor='' "
					onMouseOver="this.style.backgroundColor='#efefef'"
					onclick="check()" />
			</div>
		</form>
	</div>

</body>
</html>
