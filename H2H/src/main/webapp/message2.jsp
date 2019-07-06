<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en" >

<head>
<meta charset="UTF-8">
<title>聊天</title>
<link rel="stylesheet" href="css2/reset.css"/>
    <link rel="stylesheet" href="css2/public.css"/>
    <link rel="stylesheet" href="css2/index.css"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css2/style.css">

</head>

<body>
<nav class="navbar navbar-default " role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">HELP TO HELP</a>
    </div>
	
	<div class="navbar-form navbar-right">
	 <form class="navbar-form navbar-right" role="search">
	 <div class="dropdown">
    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
        <img src="image/user.jpeg" width="25" height="20">
    </button>
    <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation">
            <a role="menuitem" tabindex="-1" href="./editPage/test.jsp">
			<span class="glyphicon glyphicon-user">
			我的主页
			</span>
			</a>
        </li>
        
        <li role="presentation" class="divider"></li>
        <li role="presentation">
		 <a role="menuitem" tabindex="-1" href="login/Login.jsp">
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
	<a href="home.jsp">
	<span class="glyphicon glyphicon-home" style="color: rgb(0, 152, 193);"></span>首页
    </a>
	</li>
	<li>
	<a href="message1.jsp">
	<span class="glyphicon glyphicon-bell" style="color: rgb(0, 152, 193);"></span>消息
	<span> </span>
    <span class="badge">3</span>
    </a>
	</li>
	<li>
	<a href="message1.jsp">
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
  <div class="chat-container">
    <aside> 
      <div class="top-bar">
        <div class="menu-burger-container">
          <div class="menu-burger"></div>
        </div>
        <div class="new-conversation">联系人</div>
      </div>
      <div class="conversations">
        <div class="thread">
          <div class="details">
            <div class="user-name">张三</div>
            <div class="last-message">是的，演讲安排在明天，你能做吗？</div>
          </div>
          <div class="last">12:32</div>
        </div>
        <div class="thread active">
          <div class="details">
            <div class="user-name">李四</div>
            <div class="last-message">你：太棒了，谢谢。我期待着早上见到你。</div>
          </div>
          <div class="last">12:32</div>
        </div>
    </aside>
    <main>
      <div class="top-bar">
        <div class="user-info">
          <div class="name">张三</div>
        </div>
		<div class="buttons">
          <div class="call">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 viewBox="0 0 512.076 512.076" style="enable-background:new 0 0 512.076 512.076;" xml:space="preserve">
              <g>
                <path d="M499.639,396.039l-103.646-69.12c-13.153-8.701-30.784-5.838-40.508,6.579l-30.191,38.818
                         c-3.88,5.116-10.933,6.6-16.546,3.482l-5.743-3.166c-19.038-10.377-42.726-23.296-90.453-71.04s-60.672-71.45-71.049-90.453
                         l-3.149-5.743c-3.161-5.612-1.705-12.695,3.413-16.606l38.792-30.182c12.412-9.725,15.279-27.351,6.588-40.508l-69.12-103.646
                         C109.12,1.056,91.25-2.966,77.461,5.323L34.12,31.358C20.502,39.364,10.511,52.33,6.242,67.539
                         c-15.607,56.866-3.866,155.008,140.706,299.597c115.004,114.995,200.619,145.92,259.465,145.92
                         c13.543,0.058,27.033-1.704,40.107-5.239c15.212-4.264,28.18-14.256,36.181-27.878l26.061-43.315
                         C517.063,422.832,513.043,404.951,499.639,396.039z M494.058,427.868l-26.001,43.341c-5.745,9.832-15.072,17.061-26.027,20.173
                         c-52.497,14.413-144.213,2.475-283.008-136.32S8.29,124.559,22.703,72.054c3.116-10.968,10.354-20.307,20.198-26.061
                         l43.341-26.001c5.983-3.6,13.739-1.855,17.604,3.959l37.547,56.371l31.514,47.266c3.774,5.707,2.534,13.356-2.85,17.579
                         l-38.801,30.182c-11.808,9.029-15.18,25.366-7.91,38.332l3.081,5.598c10.906,20.002,24.465,44.885,73.967,94.379
                         c49.502,49.493,74.377,63.053,94.37,73.958l5.606,3.089c12.965,7.269,29.303,3.898,38.332-7.91l30.182-38.801
                         c4.224-5.381,11.87-6.62,17.579-2.85l103.637,69.12C495.918,414.126,497.663,421.886,494.058,427.868z"/>
                <path d="M291.161,86.39c80.081,0.089,144.977,64.986,145.067,145.067c0,4.713,3.82,8.533,8.533,8.533s8.533-3.82,8.533-8.533
                         c-0.099-89.503-72.63-162.035-162.133-162.133c-4.713,0-8.533,3.82-8.533,8.533S286.448,86.39,291.161,86.39z"/>
                <path d="M291.161,137.59c51.816,0.061,93.806,42.051,93.867,93.867c0,4.713,3.821,8.533,8.533,8.533
                         c4.713,0,8.533-3.82,8.533-8.533c-0.071-61.238-49.696-110.863-110.933-110.933c-4.713,0-8.533,3.82-8.533,8.533
                         S286.448,137.59,291.161,137.59z"/>
                <path d="M291.161,188.79c23.552,0.028,42.638,19.114,42.667,42.667c0,4.713,3.821,8.533,8.533,8.533s8.533-3.82,8.533-8.533
                         c-0.038-32.974-26.759-59.696-59.733-59.733c-4.713,0-8.533,3.82-8.533,8.533S286.448,188.79,291.161,188.79z"/>
              </g>
            </svg>
          </div>
        </div>
      </div>
      <div class="messages" id="messages">
        <div class="message">
          <div class="user-head">
            <span class="glyphicon glyphicon-user" style="color: rgb(255, 140, 60);">李四</span>
          </div>
          <div class="content">我已经更新了网站内容，菲奥娜，希望一切都好吗？请告诉我还有什么变化</div>
        </div>
        <div class="message fromme">
          <div class="user-head">
            <span class="glyphicon glyphicon-user" style="color: rgb(119, 162, 206);">我</span>
          </div>
          <div class="content">啊！太好了。我现在得走了，明天我会赶上你的。</div>
        </div>
      </div>
	  <div class="bottom-bar">
        <textarea class="msg-input" placeholder="发送信息"></textarea>
        <div class="send-button">
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

<script src="js/script.js"></script>

</body>
</html>