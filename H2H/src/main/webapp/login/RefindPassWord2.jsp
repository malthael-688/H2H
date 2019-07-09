<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../backSettings/style/register-login.css">
	
	<title>Findpassword</title>
<link rel="stylesheet" type="text/css" href="../backSettings/css/buttons.css" />
<script type="text/javascript" src="../backSettings/js/jquery.js"></script>
<script type="text/javascript" src="../backSettings/js/backgroundShow.js"></script>
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
	height: 450px;
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
	height: 450px;
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
<div id="box"></div>
<!-- 登录窗口      -->
	<div class="mydiv">
		<img src="../backSettings/images"
			style="width: 30%; height: 10%; position: relative; left: 200px; top: 5px;" />
		<div id="topbar"></div>
		<div id="middlecontainer">
			<div id="login">
				<form action="/login/setPassWord?account=${param.account}" method="post" id="log">
				<div id="container1">
					<br />
					<h1 class="myh1">重 设 密 码</h1>
				</div>

				<div id="container2">
					<div id="container2-1">
							<p class="" style="position: relative; top: 2px; left:40px; font-size: 15px; color:#2F4F4F">请${param.account} 在下方
								</p>
						<p class="" style="position: relative; top: 2px; left:40px; font-size:15px; color:#2F4F4F">重设您的密码
								</p>
						</div>
						<div id="container2-3">
							<p class="myp" style="position: relative; top: 20px;">密   码:</p>
						</div>
						<div id="container2-4">
							<input id="userpassword" name="userpassword" maxlength="14"
								type="password" class="myinput"
								style="position: relative; top: 32px;" required onkeyup="validate()" >
						</div>
						<div id="container2-3">
							<p class="myp" style="position: relative; top: 50px;">重 复 密 码:</p>
						</div>
						<div id="container2-4">
							<input id="userpassword2" name="userpassword2" maxlength="14"
								type="password" class="myinput"
								style="position: relative; top: 62px;" required onkeyup="validate()">
						<div id="container2-5" >
						<p class="myp" style="position: relative; top: 70px; right:50px;" id="jianyan"></p>
						
						</div>
						
						</div>

				</div>
				<div id="container3"
					style="position: relative; left: 10px; top: 70px;">
					<button style="padding: 0.1em 1em;" id="button"
						class="button button--round-s button--wayra button--border-medium button--text-thick button--size-l"
						type="submit" onClick="">完   成</button>
				</div>
				</form>
			</div>
		</div>
		<div id="bottombar"></div>
	</div>

<div class="footer">
	<p>Help To Help</p>
	<p>Designed By H2H team  2019</p>
</div>
	<script>
          function validate() {
              var pwd1 = document.getElementById("userpassword").value;
              var pwd2 = document.getElementById("userpassword2").value;
              if(pwd1 == pwd2) {
                  document.getElementById("jianyan").innerHTML="<font color='green' font size=2px >两次密码相同</font>";
                  document.getElementById("button").disabled = false;
              }
              else {
                  document.getElementById("jianyan").innerHTML="<font color='red' font size=2px >两次密码不同</font>";
                document.getElementById("button").disabled = true;
              }
          }
 </script>
<script src='../backSettings/js/particles.js' type="text/javascript"></script>
<script src='../backSettings/js/background.js' type="text/javascript"></script>
<script src='../backSettings/js/jquery.min.js' type="text/javascript"></script>
<script src='../backSettings/js/layer/layer.js' type="text/javascript"></script>
<script src='../backSettings/js/index.js' type="text/javascript"></script>

</body>
</html>