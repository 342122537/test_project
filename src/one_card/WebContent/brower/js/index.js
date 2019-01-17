function check(){
		var acc = document.getElementById("acc").value;
		var pwd = document.getElementById("pwd").value;
		if(acc!=""&&acc!=null&&pwd!=""&&pwd!=null){
			
			return true;
		}else{
		
			document.getElementById("hint").innerHTML = "提示：账户或密码都不能为空！";
			return false;
		}
	}