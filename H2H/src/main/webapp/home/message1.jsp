<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <title>消息</title>
	<link rel="stylesheet" href="../backSettings/css2/reset.css"/>
    <link rel="stylesheet" href="../backSettings/css2/public.css"/>
    <link rel="stylesheet" href="../backSettings/css2/index.css"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<a   href="javascript:history.back(-1)">
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
      
		<div class="indexMain_left_con">
            <div class="indexCon_msg">
                
                <c:forEach items="${map}" var="map" varStatus="loop">
                
                
                <div class="indexCon_msg_detail">
                    <a data-toggle="collapse" data-parent="#accordion" 
							href="#${map.key}" href="">
							
                        <div class="indexCon_msg_detail_tittle">
                            <span>点击查看详细</span>
                           <c:if test="${map.value!=0}" >
    							<p style="color:red;">新消息!!!</p>
									</c:if>
                        </div>
                    </a>
                    
					<div id="${map.key}" class="panel-collapse collapse">
					<div class="panel-body">
						您有${map.value}条未读消息!
					</div>
					</div>
					
                    <div>
                        <ul class="list-inline">
                            <li><span class="glyphicon glyphicon-user" style="color: rgb(0, 152, 193);"></span> ${map1[loop.count-1].name}</li>
							<li></li>
                            <li><span class="glyphicon glyphicon-time" style="color: rgb(0, 152, 193);"></span>${map1[loop.count-1].time}</li>
							<li></li>
							<li><span class="glyphicon glyphicon-pencil" style="color: rgb(0, 152, 193);"></span><a href="/home/initMessage?senderNum=${map1[loop.count-1].num}">查看</a></li>
							<li></li><li></li>
                    </div>
                </div>
                <div class="clear"></div>
                </c:forEach>
                
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