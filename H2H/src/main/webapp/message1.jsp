<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <title>消息</title>
	<link rel="stylesheet" href="./backSettings/css2/reset.css"/>
    <link rel="stylesheet" href="./backSettings/css2/public.css"/>
    <link rel="stylesheet" href="./backSettings/css2/index.css"/>
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
        <img src="./backSettings/image/user.jpeg" width="25" height="20">
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
		 <a role="menuitem" tabindex="-1" href="./login/Login.jsp">
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
	<a href="#">
	<span class="glyphicon glyphicon-bell" style="color: rgb(0, 152, 193);"></span>消息
	<span> </span>
    <span class="badge">3</span>
    </a>
	</li>
	<li>
	<a href="home.jsp">
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

 <div class="indexMain">
    <div class="indexMain">
        <div class="indexMain_left_btn">
            <ul>
                <li><a href="javascript:">已读消息</a></li>
				<li></li>
				<li><a href="javascript:">未读消息</a></li>
            </ul>
        </div>
		<div class="indexMain_left_con">
            <div class="indexCon_msg">
                
                <div class="indexCon_msg_detail">
                    <a data-toggle="collapse" data-parent="#accordion" 
							href="#collapseTwo" href="">
                        <div class="indexCon_msg_detail_tittle">
                            <span>点击查看详细</span>
                            <p>帮忙取个快递 不大 保管到开学找你拿orz</p>
                        </div>
                    </a>
					<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
				Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
				cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
				vice lomo.
					</div>
					</div>
                    <div>
                        <ul class="list-inline">
                            <li><span class="glyphicon glyphicon-user" style="color: rgb(0, 152, 193);"></span>花开花落</li>
							<li></li>
                            <li><span class="glyphicon glyphicon-time" style="color: rgb(0, 152, 193);"></span>2019-07-02 18:23</li>
							<li></li>
							<li><span class="glyphicon glyphicon-pencil" style="color: rgb(0, 152, 193);"></span><a href="message2.jsp">回复</a></li>
							<li></li><li></li>
							<li><span class="glyphicon glyphicon-trash" style="color: rgb(0, 152, 193);"></span>删除</li>
							
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="indexFooter">
            <div class="indexFooter_con">
                <a href="javascript:"><</a>
                <a href="" class="on">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="javascript:">></a>
            </div>
        </div>
    </div>

   </body>
</html>

<script src="js/jquery-1.8.3.min.js"></script>
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