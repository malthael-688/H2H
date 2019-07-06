<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="../css/buttons.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/backgroundShow.js"></script>
<script>
	      		function login(){
	      			
	      			var account=document.getElementById("useraccount").value;
	      			var pd=document.getElementById("userpassword").value;
	      			loginurl = "login?useraccount="+account+"&userpassword="+pd;
	      			if(account==""){
	      				alert("please input useraccount");
	      			}
	      			else{
	      				if(pd==""){
		      				alert("please input password");
	      				}
	      				else{
	    	      			document.getElementById("log").submit();
	    	      		}
	      			}			
	      		}
	      		
	      		function forgetpd(){
	      			var st=prompt("Please input your account to reset password by email");
	      			var urlsend="sendemail?account="+st;
	      			window.location.href=urlsend;
	      		}
		  </script>
<script>
function Check(){
	var usernum=document.getElementById("user.num").value;
	var userpassword=document.getElementById("user.password").value;
	if(username==""||username==null)
		{
		alert("用户名不能为空！");
		return false;
		}else if(userpassword==""||userpassword==null)
		{
		alert("密码不能为空！");
		return false;
		}else{
			return true;
		}
	
}
		  </script>

<style type="text/css">
.d1 {
	width: 100%;
	height: 100%;
	display: block;
	position: absolute;
	left: 0px;
	top: 0px;
}

.bg {
	width: 300px;
	height: 500px;
	background: inherit;
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	margin: auto;
}

.bg:after {
	content: "";
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	background: inherit;
	filter: blur(15px) opacity(97%);
	z-index: 11;
}

.mydiv {
	border-radius: 8px;
	background-color: rgba(200, 200, 200, 0.13);
	width: 300px;
	height: 500px;
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	margin: auto;
	z-index: 99;
}

.myinput {
	font-weight: bold;
	background-color: rgba(200, 200, 200, 0);
	border-style: solid;
	border-width: 2px;
	border-color: rgba(0, 0, 0, 0.8);
	border-radius: 4px;
	width: 210px;
	height: 25px;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.4) inset;
	position: relative;
	left: 40px;
}

.myp {
	color: #000000;
	line-height: 5px;
	font-size: 20px;
	font-weight: 800;
	position: relative;
	left: 40px;
}

.myh1 {
	font-weight: bold;
	font-family: Microsoft YaHei;
	position: relative;
	left: 40px;
	bottom: 20px;
}
</style>
</head>

<body>

	<!-- 登录窗口      -->
	<div class="mydiv">
		<img src="../images"
			style="width: 30%; height: 10%; position: relative; left: 200px; top: 5px;" />
		<div id="topbar"></div>
		<div id="middlecontainer">
			<div id="login">
				<form action="/admin/loginCheck" method="post" >
					<div id="container1">
						<br />
						<h1 class="myh1">管理员登录</h1>
					</div>

					<div id="container2">

						<div id="container2-1">
							<p class="myp">帐 号:</p>
						</div>
						<div id="container2-2">
							<input name="admin.adminNum" maxlength="14" type="text" class="myinput"
								id="user.num" required="required">
						</div>
						<div id="container2-3">
							<p class="myp" style="position: relative; top: 20px;">密 码:</p>
						</div>
						<div id="container2-4">
							<input name="admin.password" maxlength="16" type="password"
								class="myinput" style="position: relative; top: 20px;"
								id="user.password" required="required">
						</div>

					</div>
					<div id="container3"
						style="position: relative; left: 52px; top: 40px;">
						<button style="padding: 0.7em 2em;"
							class="button button--round-s button--wayra button--border-medium button--text-thick button--size-l"
							type="submit" ">登 录</button>
		
						</a> <a href="/admin/refindPassWord"
							style="position: relative; right: 110; top: 15px; height: 10px; font-weight: bold; font-size: 12px;"
							onclick="">忘记密码?</a>
					</div>
				</form>
			</div>
		</div>
		<div id="bottombar"></div>
	</div>

	<!--  背景     -->
	<div id="banner"
		style="width: 100%; height: 100%; margin: 0; padding: 0;">
		<div class="d1"
			style="background-image: url(../images/help1.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
		<div class="d1"
			style="background-image: url(../images/help2.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
		<div class="d1"
			style="background-image: url(../images/help3.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
		<div class="d1"
			style="background-image: url(../images/help4.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
		<div class="d1"
			style="background-image: url(../images/help5.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
		<div class="d1"
			style="background-image: url(../images/help6.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
	</div>
	<script type="text/javascript">banner()</script>
	<script>
	
	var error=${error};
	
	if(error=='1')
		{
		alert("账号不存在！");
		}
	if(error=='2')
		{
		alert("密码错误！");
		}

	if(error=='4')
		{
		alert("修改密码成功")
		}
	
	</script>
</body>
</html>
