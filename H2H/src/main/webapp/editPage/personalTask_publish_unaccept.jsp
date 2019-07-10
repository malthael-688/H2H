<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
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
            <a role="menuitem" tabindex="-1" href="../home/index">
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
	<a href="../home/showMessage">
	<span class="glyphicon glyphicon-bell" style="color: rgb(0, 152, 193);"></span>消息
	<span> </span>
   <span class="badge">${messageNum}</span>
    </a>
	</li>

	</ul>


</div>
    </div>
</nav>
    <div class="row">
  <div class="col-md-12 ">
	  	    <div class="col-md-8 col-md-offset-1">
  <div class="col-md-3 col-md-offset-1" style = "top:-10px;">
 	<div class="list-group">
  <button type="button" class="list-group-item" onclick="javascript:window.location.href='/editPage'">个 人 信 息</button>
  <button type="button" class="list-group-item" onclick="javascript:window.location.href='/editPage/personalTasks_page'">任 务 管 理</button>
<!-- Single button -->
<div class="btn-group" >
  <button type="button" class="btn btn-default btn-group-justified dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    我 接 受 的 任 务 <span class="caret "></span>
  </button>
    <ul class="dropdown-menu ">
        <li><a href="/editPage/recieve_finished_page">已 完 成 任 务</a></li>
        <li><a href="/editPage/recieve_applying_page">申 请 中 任 务</a></li>
        <li><a href="/editPage/recieve_nowDoing_page">进 行 中 任 务</a></li>
    </ul>
</div>
        <div class="btn-group" >
            <button type="button" class="btn btn-default btn-group-justified dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                我 发 布 的 任 务 <span class="caret "></span>
            </button>
            <ul class="dropdown-menu ">
                <li><a href="/editPage/publish_examine_page">审 查 中 任 务</a></li>
                <li><a href="/editPage/publish_nowDoing_page">进 行 中 任 务</a></li>
                <li><a href="/editPage/publish_unaccept_page">未 被 接 收 任 务</a></li>
                <li><a href="/editPage/publish_finished_page">已 完 成 任 务</a></li>
                <li><a href="#"></a></li>
            </ul>
</div>								
</div>
			</div>					   
<div class="col-md-6 " style = "top:-30px;">
		 <div class="indexMain">
    <div class="indexMain_left" >
        <div class="indexMain_left_btn">
            <ul>
                <li><a href="javascript:">任务管理 / 我发布的任务 / 未被接收任务</a></li>
            </ul>
        </div>
           
		<div class="indexMain_left_con">
            <!--无主题图循环结束-->
            <c:forEach items="${scs}" var="sc" varStatus="loop">
                <div class="indexCon_msg">

                    <div class="indexCon_msg_detail">
                        <a href="/editPage/taskInfo_publish_unStart?taskId=${sc.task.taskID}">
                            <div class="indexCon_msg_detail_tittle">
                                <span>${sc.task.title}</span>
                                <p>${sc.task.description}</p>
                            </div>
                        </a>
                        <div>
                            <ul class="list-inline">
                                <li><span class="glyphicon glyphicon-user" style="color: rgb(0, 152, 193);"></span>${sc.task.publisherNum}</li>
                                <li></li>
                                <li><span class="glyphicon glyphicon-play" style="color: rgb(0, 152, 193);"></span>${sc.task.startTime}</li>
                                <li></li>
                                <li><span class="glyphicon glyphicon-pause" style="color: rgb(255, 0, 17);"></span>${sc.task.deadLine}</li>
                                <li></li>
                                <li></li><li></li>
                                <li></li><li></li>
                                <li></li><li></li>
                                <li><span class="glyphicon glyphicon-thumbs-up" style="color: rgb(0, 152, 193);"></span>${task.heatValue}</li>
                                <li></li><li></li>
                                <li><span class="glyphicon glyphicon-comment" style="color: rgb(0, 152, 193);"></span>评价</li>
                                <li></li><li></li>
                               
                            </ul>
                        </div>
                        
                        					<div>
					申请人列表：
						<c:forEach items="${sc.users}" var="applicant" varStatus="st"> 
							<ul class="list-inline">
                            <li><span class="glyphicon glyphicon-user" style="color: rgb(0, 152, 193);"></span><a>${applicant.name}:</a></li>
							<li></li>
							<li></li>
							<li></li><li></li>
							<li></li><li></li>
							<li></li><li></li>
							<li><span>已完成任务数： </span>${applicant.finishedTaskNum}</li>
							<li></li><li></li>
							<li><span>信誉值： </span>${applicant.creditScore}</li>
							<li></li><li></li>
                        </ul>
						</c:forEach>		
					</div>
                    </div>
                    <div class="clear"></div>
                </div>
            </c:forEach>

			
			 
        </div>
    </div>
    <div class="clear"></div>
</div>
			</div?> <!-- panel -->
	  </div>
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