<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style/register-login.css">
	
	<title>Find Password</title>
<link rel="stylesheet" type="text/css" href="../css/buttons.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/backgroundShow.js"></script>


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
<div class="cent-box">
		<!-- 登录窗口      -->
	<div class="mydiv">
		<img src="../images"
			style="width: 30%; height: 10%; position: relative; left: 200px; top: 5px;" />
		<div id="topbar"></div>
		<div id="middlecontainer">
			<div id="login">
				<div id="container1">
					<br />
					<h1 class="myh1">找 回 密 码</h1>
				</div>
				<form action="/login/findPassWord" method="post" id="log">
				<div id="container2">
						<div id="container2-1">
							<p class="myp">学  号:</p>
						</div>
						<div id="container2-2" style="position: relative; top: 10px;">
							<input id="useraccount" name="useraccount" maxlength="20"
								type="text" class="myinput" required>
						</div>
																		<div id="container2-3" >
							<p class="myp" style="position: relative; top: 40px;">电 子 邮 箱:</p>
						</div>
					 	
						
												<div id="container2-4">
							<input id="email" name="email" maxlength="20"
								type="text" class="myinput"
								style="position: relative; top: 52px;" required>
					<p></p>
							<p class="myp" style="position: relative; top: 77px;">验 证 码:</p>
							<input id="mailbox" name="mailbox" maxlength="14"
								type="text" class="myinput"
								style="position: relative; top: 89px;" required>
						</div>

				</div>
				<div id="container3"
					style="position: relative; left: 52px; top: 90px;">
                        <button style="padding: 0.7em 2em;"
						class="button button--round-s button--wayra button--border-medium button--text-thick button--size-l"
                               type="submit" onClick=>下 一 步</button>
				</div>
							<a
						style="color : #2F4F4F; position: relative; right: 40px; top: 77px; font-weight: bold; font-size: 12px;"
						onclick="forgetpd()" ><button type="button" id="btn" style="padding:0.1em 0.1em; top:-160px;right:-170px;" class="button button--round-s button--wayra button--border-medium button--text-thick button--size-l"
						>发送邮件</button></a>
				</form>

			</div>
		</div>
		<div id="bottombar"></div>
	</div>
</div>

<div class="footer">
	<p>Help To Help</p>
	<p>Designed By H2H team  2019</p>
</div>

<script src='../js/particles.js' type="text/javascript"></script>
<script src='../js/background.js' type="text/javascript"></script>
<script src='../js/jquery.min.js' type="text/javascript"></script>
<script src='../js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>
<script>
	$('.imgcode').hover(function(){
		layer.tips("看不清？点击更换", '.verify', {
        		time: 1000,
        		tips: [2, "#3c3c3c"]
    		})
	},function(){
		layer.closeAll('tips');
	}).click(function(){
		$(this).attr('src','http://www.cnhww.com/demo5/GetCode.asp' + Math.random());
	});
	$("#remember-me").click(function(){
		var n = document.getElementById("remember-me").checked;
		if(n){
			$(".zt").show();
		}else{
			$(".zt").hide();
		}
	});
</script>
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
					var xhttp;
					if (window.XMLHttpRequest) {
						xhttp = new XMLHttpRequest();
					} else {
						xhttp = new ActiveXObject("Microsoft.XMLHTTP");
					}
					var st=document.getElementById("email").value;
					xhttp.open("post","/login/getMailCode?account="+st,false);
					xhttp.send();
					
				}
		  </script>
		  	<script>
$(function() {
 
	var btn = $("#btn");
	$(function() {
		btn.click(settime);
	})
	var countdown = 60;//倒计时总时间，为了演示效果，设为5秒，一般都是60s
	function settime() {
		if (countdown == 0) {
			btn.attr("disabled", false);
			btn.html("发送邮件");
			btn.removeClass("disabled");
			countdown = 60;
			return;
		} else {
			btn.addClass("disabled");
			btn.attr("disabled", true);
			btn.html("重新发送(" + countdown + ")");
			countdown--;
		}
		setTimeout(settime, 1000);
	}
 
})
</script>
<script>
var error=${error};
if(error=='7')
	{
	alert("用户名不存在!");
	}
if(error=='8')
{
alert("验证码错误!");
}
</script>
</body>
</html>