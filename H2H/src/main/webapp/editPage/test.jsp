<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<script src="../js/bootstrap.min.js"></script>
    <!-- Bootstrap core CSS -->

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
	  		<link rel="stylesheet" href="../backSettings/css/reset.css"/>
    <link rel="stylesheet" href="../backSettings/css/public.css"/>
    <link rel="stylesheet" href="../backSettings/css/index.css"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  
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
        <img src="../backSettings/image/user.jpeg" width="25" height="20">
    </button>
    <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation">
            <a role="menuitem" tabindex="-1" href="#">
			<span class="glyphicon glyphicon-user">
			我的主页
			</span>
			</a>
        </li>
        
        <li role="presentation" class="divider"></li>
        <li role="presentation">
		 <a role="menuitem" tabindex="-1" href="#">
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
	<a href="../home.jsp">
	<span class="glyphicon glyphicon-home" style="color: rgb(0, 152, 193);"></span>首页
    </a>
</li>
	<li>
	<a href="../message1.jsp">
	<span class="glyphicon glyphicon-bell" style="color: rgb(0, 152, 193);"></span>消息
	<span> </span>
    <span class="badge">3</span>
    </a>
	</li>
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        任务类型 <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
		<li><a href="#">代取快递</a></li>
        <li><a href="#">代排队伍</a></li>
		<li class="divider"></li>
		<li><a href="#">课程辅导</a></li>
        <li><a href="#">多人拼车</a></li>
		<li><a href="#">二手物品</a></li>
      </ul>
    </li>
	
	</ul>
	<form class="navbar-form navbar-right" role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">提交</button>
    </form>

</div>
    </div>
</nav>
<br>
    <main role="main" class="container">
      <div class="row">
  <div class="col-md-12 ">
			  			   <div class="col-md-3 col-md-offset-1">
	<div class="list-group">
  <button type="button" class="list-group-item" onclick="javascript:window.location.href='test.jsp'">个 人 信 息</button>
  <button type="button" class="list-group-item">任 务 管 理</button>
<!-- Single button -->
<div class="btn-group" >
  <button type="button" class="btn btn-default btn-group-justified dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    我 接 受 的 任 务 <span class="caret "></span>
  </button>
  <ul class="dropdown-menu ">
    <li><a href="./personalTask_recieve_finished.jsp">已 完 成 任 务</a></li>
    <li><a href="./personalTask_recieve_applying.jsp">申 请 中 任 务</a></li>
    <li><a href="./personalTask_recieve_nowdoing.jsp">进 行 中 任 务</a></li>
  </ul>
</div>
<div class="btn-group" >
  <button type="button" class="btn btn-default btn-group-justified dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    我 发 布 的 任 务 <span class="caret "></span>
  </button>
  <ul class="dropdown-menu ">
    <li><a href="./personalTask_publish_examine.jsp">审 查 中 任 务</a></li>
    <li><a href="./personalTask_publish_finished.jsp">进 行 中 任 务</a></li>
    <li><a href="./personalTask_publish_unaccept.jsp">未 被 接 收 任 务</a></li>
    <li><a href="./personalTask_publish_finished.jsp">已 完 成 任 务</a></li>
    <li><a href="#"></a></li>
  </ul>
</div>								
</div>
			</div>				   

			  			   <div class="col-md-7 ">
							   <div class="panel panel-default" class="col-md-2">
				
  <div class="panel-heading" class="col-md-2 col-md-offset-1"><h3 style="">个人中心</h3></div>
  <div class="panel-body">
	  
   <h4 class = "text-black ">个人信息</h4> 
	  <p3 style = "color:#CDC9C9;">进行个人信息的浏览等操作。</p3>
	  <hr >
        <div class="col-md-12 ">
						        
			        <div class="col-md-10 col-md-offset-1" >
			<h style = "font-size:16px;">账 号：</h>
						<br>
				<h style = "font-size:15px; color:#8B8989; position:relative; top: 5px;">${zhanghao}</h>
			<hr style = "position:relative; top: -5px;">
			<h style = "font-size:16px; position:relative; top: -15px;">昵 称：</h>
									<br>
				<h style = "font-size:15px; color:#8B8989; position:relative; top: -10px;">${nicheng}</h>
			<hr style = "position:relative; top: -20px;">
			<h style = "font-size:16px; position:relative; top: -35px;">邮 箱：</h>
									<br>
				<h style = "font-size:15px; color:#8B8989; position:relative; top: -30px;">${youxiang}</h>
			<hr style = "position:relative; top: -40px;">
			<h style = "font-size:16px; position:relative; top: -50px;">联 系 方 式：</h>
									<br>
				<h style = "font-size:15px; color:#8B8989; position:relative; top: -45px;">${phone}</h>
			<hr style = "position:relative; top: -55px;">
			<h style = "font-size:16px; position:relative; top: -65px;">积 分：</h>
									<br>
				<h style = "font-size:15px; color:#8B8989; position:relative; top: -60px;">${jifen}</h>
			<hr style = "position:relative; top: -70px;">
			<h style = "font-size:16px; position:relative; top: -80px;">信 誉 值：</h>
									<br>
				<h style = "font-size:15px; color:#8B8989; position:relative; top: -75px;">${xinyuzhi}</h>
			<hr style = "position:relative; top: -80px;">
				<h style = "font-size:16px; position:relative; top: -90px;">已 完 成 任 务：</h>
									<br>
				<h style = "font-size:15px; color:#8B8989; position:relative; top: -85px;">${yiwanchengrenwu}</h>
			<hr style = "position:relative; top: -80px;">
			</div>
			<div class = "col-md-6 col-md-offset-3" style = "font-size:15px; color:#8B8989; position:relative; top: -50px;">
			  <button type="button"  class="btn btn-group-justified btn-warning" onclick="javascript:window.location.href='edit_Personal_Information.jsp'">修 改 个 人 信 息</button>
			</div>
        </div> 
	  <div class="row mb-2 col-md-offset-1">

        <div class="col-md-6">
         
        </div>
      </div>
		  </div> <!-- panel -->
			</div?> <!-- panel -->
	  </div>
			</div>				   
		  <div class="row">
			          <div class="col-md-12 ">
			  </div>
			   <div class="col-md-8 col-md-offset-1">
			
			  
			  					</div>

      </div><!-- /.row -->
      </div><!-- /.daban -->

    </main><!-- /.container -->
						<hr width=90% align="right">



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

  </body>
</html>
