<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>

<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'demo_1.jsp' starting page</title>
<script src="web/js/jquery.min.js" type="text/javascript" ></script>
<script >
	//加载
	/* $(document).ready(function() {

		$("p").click(function() {
			$(this).hide();
			alert($('#name').val());

		});
	}); */

// 	$(function() {
// 		$("form + input").css("border","1px red solid");
	
// 	});
	
</script>
<!-- 
JQ取对象的方法

 $("#name"), $("p"), $(".className"),$("*"),$(this)

 -->

</head>

<body onload="load()">
	<form class="form" action="#" method="post">
		<p>AAAA</p>
		<img src="web/img/3.jpg">
		<div class="form-item">
			<label for="name">Name:</label> <input name="name" type="text"
				class="form-text" id="name1" />
		</div>
	<input name="name" type="password" class="form-text" id="name2" />
		<input name="name" type="text" class="form-text" id="name2" />
	</form>
<input name="name" type="text" class="form-text" id="name2" />
	<input name="name" type="text" class="form-text" id="name2" />
</body>
</html>
<script type="text/javascript"  >
// function load(){
// 	$("form input").css("border","3px red solid");
// 	$("form > input").css("border","10px red solid");
// 	$("form input[type='password']").css("border","3px green solid");
// }

$(document).ready(
		function (){
		$("body input").css("border","1px orange solid");
	 	$("form input").css("border","5px red solid");
	 	$("form > input").css("border","15px red solid");
	 	$("form input[type='password']").css("border","3px green solid");
	 	
	 	
	 	$("form p").append("	<p>cccc</p>");
	 	$("form p").append("	<p>bbbb</p>");
	 	$("img").att
	}	
		);
</script>