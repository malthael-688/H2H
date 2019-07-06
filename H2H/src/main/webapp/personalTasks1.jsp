<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
		<link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/index.css"/>
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
        <img src="image/user.jpeg" width="25" height="20">
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
	<a href="#">
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
    <div class="row">
  <div class="col-md-12 ">
  <div class="col-md-3 col-md-offset-1" style = "top:-10px;">
 <div class="list-group" id="dengluqian">
  <button type="button" class="list-group-item">个 人 信 息</button>
  <button type="button" class="list-group-item">任 务 管 理</button>
<div class="btn-group" >
  <button type="button" class="btn btn-default btn-group-justified dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    我 接 受 的 任 务 <b class="caret"></b>
  </button>
  <ul class="dropdown-menu ">
    <li><a href="#">已 完 成 任 务</a></li>
    <li><a href="#">申 请 中 任 务</a></li>
    <li><a href="#">进 行 中 任 务</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>
<div class="btn-group" >
  <button type="button" class="btn btn-default btn-group-justified dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    我 发 布 的 任 务 <b class="caret"></b>
  </button>
  <ul class="dropdown-menu ">
    <li><a href="#">审 查 中 任 务</a></li>
    <li><a href="#">进 行 中 任 务</a></li>
    <li><a href="#">未 被 接 收 任 务</a></li>
    <li><a href="#"></a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>								
</div>
			</div>				   
<div class="col-md-6 " style = "top:-30px;">
		 <div class="indexMain">
    <div class="indexMain_left" >
        <div class="indexMain_left_btn">
            <ul>
                <li><a href="javascript:">任务管理</a></li>
            </ul>
        </div>
           
		<div class="indexMain_left_con">
            <!--无主题图循环结束-->
			 <div class="indexCon_msg">
                
                <div class="indexCon_msg_detail">
                    <a href="">
                        <div class="indexCon_msg_detail_tittle">
                            <span>跑腿</span>
                            <p>帮忙取个快递 不大 保管到开学找你拿orz</p>
                        </div>
                    </a>
                    <div>
                        <ul class="list-inline">
                            <li><span class="glyphicon glyphicon-user" style="color: rgb(0, 152, 193);"></span>花开花落</li>
							<li></li>
                            <li><span class="glyphicon glyphicon-play" style="color: rgb(0, 152, 193);"></span>2019-07-02 18:23</li>
							<li></li>
                            <li><span class="glyphicon glyphicon-pause" style="color: rgb(255, 0, 17);"></span>2019-07-02 20:45</li>
							<li></li>
							<li></li><li></li>
							<li></li><li></li>
							<li></li><li></li>
							<li><span class="glyphicon glyphicon-thumbs-up" style="color: rgb(0, 152, 193);"></span>28</li>
							<li></li><li></li>
							<li><span class="glyphicon glyphicon-comment" style="color: rgb(0, 152, 193);"></span>28</li>
							<li></li><li></li>
							<li>[已接受]</li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
			 <div class="indexCon_msg">
                
                <div class="indexCon_msg_detail">
                    <a href="">
                        <div class="indexCon_msg_detail_tittle">
                            <span>跑腿</span>
                            <p>帮忙取个快递 不大 保管到开学找你拿orz</p>
                        </div>
                    </a>
                    <div>
                        <ul class="list-inline">
                            <li><span class="glyphicon glyphicon-user" style="color: rgb(0, 152, 193);"></span>花开花落</li>
							<li></li>
                            <li><span class="glyphicon glyphicon-play" style="color: rgb(0, 152, 193);"></span>2019-07-02 18:23</li>
							<li></li>
                            <li><span class="glyphicon glyphicon-pause" style="color: rgb(255, 0, 17);"></span>2019-07-02 20:45</li>
							<li></li>
							<li></li><li></li>
							<li></li><li></li>
							<li></li><li></li>
							<li><span class="glyphicon glyphicon-thumbs-up" style="color: rgb(0, 152, 193);"></span>28</li>
							<li></li><li></li>
							<li><span class="glyphicon glyphicon-comment" style="color: rgb(0, 152, 193);"></span>28</li>
							<li></li><li></li>
							<li>[已接受]</li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
			 
        </div>
    </div>
    <div class="clear"></div>
</div>
			</div?> <!-- panel -->
	  </div>
	  </div>



						<hr width=90% align="right">



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

  </body>
</html>
<script>
    $(".indexMain_left_btn li a").click(function(){
        $(".indexMain_left_btn li a").removeClass("on");
        $(this).addClass("on");
    });
    window.onscroll=function(){
        var scrolls=document.body.scrollTop||document.documentElement.scrollTop;
        var slided=60;
        if(scrolls>=slided){
            $(".appear").hide();
            $(".navFix").show();
            $(".ltHead").addClass("navTop");
        }else{
            $(".appear").show();
            $(".navFix").hide();
            $(".ltHead").removeClass("navTop");
        }
    };
</script>