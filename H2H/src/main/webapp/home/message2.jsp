<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en" >

<head>
<meta charset="UTF-8">
<title>聊天</title>
<link rel="stylesheet" href="../backSettings/css2/reset.css"/>
    <link rel="stylesheet" href="../backSettings/css2/public.css"/>
    <link rel="stylesheet" href="../backSettings/css2/index.css"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../backSettings/css2/style.css">

</head>

<body>
<nav class="navbar navbar-default " role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="../home/index">HELP TO HELP</a>
    </div>
	
	<div class="navbar-form navbar-right">
	 <form class="navbar-form navbar-right" role="search">
	 <div class="dropdown">
    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
        <img src="../backSettings/image/user.jpeg" width="25" height="20">
    </button>
    <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation">
            <a role="menuitem" tabindex="-1" href="../editPage/index">
			<span class="glyphicon glyphicon-user">
			我的主页
			</span>
			</a>
        </li>
        
        <li role="presentation" class="divider"></li>
        <li role="presentation">
		 <a role="menuitem" tabindex="-1" href="/editPage/LogOut">
            <span class="glyphicon glyphicon-off">
			退出
			</span>
			</a>
        </li>
    </ul>
</div>
    </form>
	<ul class="nav navbar-nav">
	<li>
	<a href="../home/index">
	<span class="glyphicon glyphicon-home" style="color: rgb(0, 152, 193);"></span>首页
    </a>
	</li>

	<li>
	<a href="/home/showMessage">
	<span class="glyphicon glyphicon-share-alt" style="color: rgb(0, 152, 193);"></span>返回
    </a>
	</li>
	</ul>
	<li class="navbar-form navbar-right"></li>
	<li class="navbar-form navbar-right"></li>
	<li class="navbar-form navbar-right"></li>
	<li class="navbar-form navbar-right"></li>
	<li class="navbar-form navbar-right"></li>
	<li class="navbar-form navbar-right"></li>
	<li class="navbar-form navbar-right"></li>
	<li class="navbar-form navbar-right"></li>
	<li class="navbar-form navbar-right"></li>
</div>
    </div>
</nav>
  <div class="centerit" style="top:500px">
  <div class="chat-container" style="width: 800px">
    <main style="width: 100%">
      <div class="top-bar">
        <div class="user-info">
          <div class="name">${senderName}</div>
        </div>
      </div>
      <div class="messages" id="messages">
		  <c:forEach items="${messages}" var="msg">
			<c:if test="${msg.senderNum == senderNum}">
				<div>
        		<div class="message">
          			<div class="user-head">
            			<span class="glyphicon glyphicon-user" style="color: rgb(255, 140, 60);"> ${senderName}</span>
          			</div>
          			<div class="content">${msg.content}</div>
        		</div>
				</div>
			</c:if>
			<c:if test="${msg.senderNum == receiverNum}">
				<div>
        		<div class="message fromme">
          			<div class="user-head">
            			<span class="glyphicon glyphicon-user" style="color: rgb(119, 162, 206);"> 我</span>
          			</div>
          			<div class="content">${msg.content}</div>
        		</div>
      			</div>
			</c:if>
		  </c:forEach>
	  </div>
	  <div class="bottom-bar">
        <textarea class="msg-input" placeholder="发送信息" id="myMsg"></textarea>
        <div class="send-button" onclick="sendMessage('myMsg');">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
               viewBox="0 0 512.076 512.076" style="enable-background:new 0 0 512.076 512.076;" xml:space="preserve">
            <g>
              <path d="M509.532,34.999c-2.292-2.233-5.678-2.924-8.658-1.764L5.213,225.734c-2.946,1.144-4.967,3.883-5.192,7.034
                       c-0.225,3.151,1.386,6.149,4.138,7.7l102.719,57.875l35.651,174.259c0.222,1.232,0.723,2.379,1.442,3.364
                       c0.072,0.099,0.131,0.175,0.191,0.251c1.256,1.571,3.037,2.668,5.113,3c0.265,0.042,0.531,0.072,0.795,0.088
                       c0.171,0.011,0.341,0.016,0.511,0.016c1.559,0,3.036-0.445,4.295-1.228c0.426-0.264,0.831-0.569,1.207-0.915
                       c0.117-0.108,0.219-0.205,0.318-0.306l77.323-77.52c3.186-3.195,3.18-8.369-0.015-11.555c-3.198-3.188-8.368-3.18-11.555,0.015
                       l-60.739,60.894l13.124-112.394l185.495,101.814c1.868,1.02,3.944,1.239,5.846,0.78c0.209-0.051,0.4-0.105,0.589-0.166
                       c1.878-0.609,3.526-1.877,4.574-3.697c0.053-0.094,0.1-0.179,0.146-0.264c0.212-0.404,0.382-0.8,0.517-1.202L511.521,43.608
                       C512.6,40.596,511.824,37.23,509.532,34.999z M27.232,234.712L432.364,77.371l-318.521,206.14L27.232,234.712z M162.72,316.936
                       c-0.764,0.613-1.429,1.374-1.949,2.267c-0.068,0.117-0.132,0.235-0.194,0.354c-0.496,0.959-0.784,1.972-0.879,2.986L148.365,419.6
                       l-25.107-122.718l275.105-178.042L162.72,316.936z M359.507,419.195l-177.284-97.307L485.928,66.574L359.507,419.195z"/>
            </g>
          </svg>
        </div>
      </div>
    </main>
  </div>
</div>
<input type="hidden" id="senderNo" value="${senderNum}">
<input type="hidden" id="receiverNo" value="${receiverNum}">
<script src="../backSettings/js/script.js"></script>
<script>
window.onload = setScroll;
setInterval("getMessage()",1000);

function setScroll(){
	document.getElementById("messages").scrollTop=99999;
};

function getMessage() {
   var xmlhttp;
	var url = "/home/getMessage";
	var sender = document.getElementById("senderNo").value;
	var receiver = document.getElementById("receiverNo").value;
	url = url + "?senderNum=" + sender + "&receiverNum=" + receiver;
	
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        	var result = xmlhttp.responseText;
        	var json = eval("(" + result + ")");
        	for(var i = 0; i < json.length; i++){
        		var divTag = document.createElement("div");
        		divTag.innerHTML = "<div class=\"message\"><div class=\"user-head\"><span class=\"glyphicon glyphicon-user\" style=\"color: rgb(255, 140, 60);\">${senderName}</span></div><div class=\"content\">"+json[i].content+"</div></div>";
        		var mydiv = document.getElementById("messages");
        		mydiv.appendChild(divTag);
        		setScroll();
        	}
		}
	};
	xmlhttp.send(null);
};

function sendMessage(msgID){
	var xmlhttp;
	var url = "/home/sendMessage";
	var sender = document.getElementById("senderNo").value;
	var receiver = document.getElementById("receiverNo").value;
	var msg = document.getElementById(msgID).value;
	url = url + "?senderNum=" + sender + "&receiverNum=" + receiver + "&msg=" + msg;
	
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        	var result = xmlhttp.responseText;
        	if(result == "ok"){
        		var divTag = document.createElement("div");
        		divTag.innerHTML = "<div class=\"message fromme\"><div class=\"user-head\"><span class=\"glyphicon glyphicon-user\" style=\"color: rgb(119, 162, 206);\">我</span></div><div class=\"content\">"+msg+"</div></div>";
        		var mydiv = document.getElementById("messages");
        		mydiv.appendChild(divTag);
        	}else{
        		var pTag = document.createElement("p");
        		pTag.style.color = 'red';
        		pTag.innerHTML = "发送失败!";
        		var mydiv = document.getElementById("div1");
        		mydiv.appendChild(pTag);
        	}
        }
		
		document.getElementById(msgID).value = "";
		setScroll();
	}
	xmlhttp.send(null);
};
</script>
</body>
</html>