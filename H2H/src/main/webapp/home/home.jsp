<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <title>首页</title>
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic" rel="stylesheet" type="text/css" />
		<script src="../backSettings/js2/jquery.min.js"></script>
		<script src="../backSettings/js2/jquery.poptrox-2.2.js"></script>
		<script src="../backSettings/js2/skel.min.js"></script>
		<script src="../backSettings/js2/init.js"></script>
        <link rel="stylesheet" href="../backSettings/css2/skel-noscript.css" />
	 	<link rel="stylesheet" href="../backSettings/css2/style-ht.css" />
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="../backSettings/css2/datedropper.css">
		<link rel="stylesheet" type="text/css" href="../backSettings/css2/timedropper.min.css">
		
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	
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
        <a class="navbar-brand" href="/home">HELP TO HELP</a>
    </div>
	
	<div class="navbar-form navbar-right">
	 <form class="navbar-form navbar-right" role="search">
	 <div class="dropdown">
    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
        <img src="../backSettings/img/user.jpeg" width="25" height="20">
    </button>
    <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation">
            <a role="menuitem" tabindex="-1" href="/editPage">
			<span class="glyphicon glyphicon-user">
			我的主页
			</span>
			</a>
        </li>
        
        <li role="presentation" class="divider"></li>
        <li role="presentation">
		 <a role="menuitem" tabindex="-1" href="/home/LogOut">
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
	<span class="glyphicon glyphicon-home" style="color: rgb(0, 152, 193);"></span>首页
    </a>
	</li>
	<li>
	<a href="/home/showMessage">
	<span class="glyphicon glyphicon-bell" style="color: rgb(0, 152, 193);"></span>消息
	<span> </span>
    <span class="badge">${messageNum}</span>
    </a>
	</li>
<!--  
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
-->
	
	</ul>
	<form method="post" action="/home/index" class="navbar-form navbar-right" role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search" id="searchKey">
        </div>
        <button type="submit" class="btn btn-default">关键词搜索任务</button>
    </form>

</div>
    </div>
</nav>

 <div class="indexMain">
    <div class="indexMain_left">
        <div class="indexMain_left_btn">
            <ul>
            	<li><a href="/home">全部类别</a></li>
				<li></li>
            	<c:forEach items="${taskTypes}" var="taskType" varStatus="ty">
                <li><a href="/home?filterType=${taskType.getStr("type")}">${taskType.getStr("type") }</a></li>
				<li></li>
				</c:forEach>
            </ul>
        </div>
        <c:forEach items="${tasks}" var="task" varStatus="tk">
		<div class="indexMain_left_con">
            <!--有主题图循环结束-->
            <!--无主题图循环开始-->
            <div class="indexCon_msg">
                
	                <div class="indexCon_msg_detail">
	                    <a data-toggle="collapse" data-parent="#accordion" 
								href="#${task.taskID }" href="">
	                        <div class="indexCon_msg_detail_tittle">
	                            <span>${task.getStr("type") }</span>
	                            <p>${task.getStr("title") }</p>
	                        </div>
	                    </a>
						<div id="${task.taskID }" class="panel-collapse collapse">
						<div class="panel-body">${task.getStr("description") }</div>
						</div>
	                    <div>
	                        <ul class="list-inline">
	                            <li><span class="glyphicon glyphicon-user" style="color: rgb(0, 152, 193);"></span>${publisherName[tk.count-1] }</li>
								<li></li>
	                            <li><span class="glyphicon glyphicon-play" style="color: rgb(0, 152, 193);"></span>${task.getStr("startTime") }</li>
								<li></li>
	                            <li><span class="glyphicon glyphicon-pause" style="color: rgb(255, 0, 17);"></span>${task.getStr("deadLine") }</li>
								<li></li>
								<li></li><li></li>
								<li><a href="/home/showTaskDetail?taskID=${task.getStr("taskID")}"><span class="glyphicon glyphicon-check" style="color: rgb(0, 152, 193);">查看</span></a></li>
								<li></li><li></li>
								<li><span class="glyphicon glyphicon-comment" style="color: rgb(0, 152, 193);"></span>${task.getStr("heatValue") }</li>
								<li></li>
								<li><span class="glyphicon glyphicon-usd" style="color: rgb(255, 235, 118);"></span>${task.getStr("rewardPoints") }</li>
	                        </ul>
	                    </div>
	                </div>
                <div class="clear"></div>
            </div>
        </div>
        </c:forEach>
        <!-- 
        <div class="indexFooter">
            <div class="indexFooter_con">
                <a href="javascript:"><</a>
                <a href="" class="on">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="javascript:">></a>
            </div>
        </div>
         -->
    </div>
    <div class="indexMain_right">
        <div class="indexMain_rightCon">
            <a href="javascript:;" data-toggle="modal" data-target="#myModal" class="md-trigger newMsg">发任务</a>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:1000px;height:618px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<header>
					<h2 align="center">任务发布</h2>
					<p align="center">请填写要分布任务的细节。</p>
				</header>
				<form method="post" action="/home/publishTask" id="publish">
					<div class="row half">
						<div class="6u"><input type="text" class="text" id="task.title" name="task.title" placeholder="标题"  required/></div>
						<div class="6u"><input type="text" class="text" id="task.rewardPoints" name="task.rewardPoints" placeholder="悬赏积分" onkeypress="checkPoint()" onkeyup ="value=value.replace(/[^\d]/g,'')" required/></div>
					</div>
					
					
						<p class="myp" style="position: relative; top:0px; right:-520px;" id="account_wrong"></p>
						
						
						
					<div class="row half">
						<div class="6u">
							<select name="type" id="task.type" placeholder="任务类型" >
								<c:forEach items="${taskTypes}" var="taskType" varStatus="ty">
								<option value="${taskType.getStr("type") }" selected="selected">${taskType.getStr("type") }</option>
								</c:forEach>
							</select>
						</div>
						<div class="6u" style="width:160px;float:left;display:inline">
							<label type="text" class="text">截止时间</label>
						</div><div style="width:168px;float:left;display:inline">	
							<input type="text" class="input" id="task.startTime" name="task.startTime" placeholder="年月日" required/>
						</div><div style="width:140px;float:left;display:inline">
							<input type="text" class="time" id="task.deadLine" name="task.deadLine" placeholder="时间" required />
						
						</div>
						

					</div>
				  	<div class="row half">
						<div class="12u">
							<textarea name="task.description" id="task.description" placeholder="任务描述" required></textarea>
						</div>
					</div>
					<div class="row">
						<div class="12u">
							<ul class="actions">
								<li>
															<button style="padding: 0.7em 2em;"
							class="button button--round-s button--wayra button--border-medium button--text-thick button--size-l"
							type="submit" onmouseover="checkYear()" id="btn" >提交</button>									
								</li>
							</ul>
						</div>
					</div>
				</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</div>
            <div class="pwfb">
                <div class="pwfbHead">
                近期公告
                </div>
				<div class="indexPublic_con">
				<div class="pwfbCon">
                    <ul>
                    	<c:forEach items="${notices}" var="notice" varStatus="nt">
                        <li><a href="javascript:;" data-toggle="modal" data-target="#${notice.content}"><h5>${notice.getStr("title") }</h5> <span class="glyphicon glyphicon-time" style="color: rgb(0, 152, 193);"></span>${notice.getStr("time") }</li>
						
						<div class="modal fade" id="${notice.content}" tabindex="-1" role="dialog" aria-labelledby="${notice.co}" aria-hidden="true">
						<div class="modal-dialog" style="width:800px;height:800px;">
						<div class="modal-content">
						<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal2" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
						${notice.getStr("title") }
						</h4>
						</div>
						<div class="modal-body">
						${notice.getStr("content") }
						</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal2">关闭
						</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</a>
					</c:forEach>
                    </ul> 
				</div>
                </div>
                <div class="pwfbCon">
				</div>
               
            </div>
            
            <div class="indexPublic">
                <div class="pwfbHead">
                    任务热度榜
                </div>
                <div class="indexPublic_con">
                	<c:forEach items="${hotTasks}" var="hotTask" varStatus="ht">
                    <ul class="weekHot">
                        <li><a href="/home/showTaskDetail?taskID=${hotTask.taskID}">${hotTask.title}</a><span>${hotTask.heatValue }</span></li>
                    </ul>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
			

    <div class="clear"></div>
</div>
<footer class="publicFooter">
    <p>Copyright &copy; 2019 PaiWang 校园帮帮忙项目组版权所有 陕ICP备16032224号-2</p>
</footer>

<!-- 
	<script>
		function publishTask(){

		var title=document.getElementById("title").value;
		var rewardPoints=document.getElementById("rewardPoints").value;
		var type=document.getElementById("type").value;
		var date=document.getElementById("pickdate").value;
		var time=document.getElementById("picktime").value;
	
		if(title=="" || rewardPoints==""||type==""||date==""||time==""){
			alert("请正确输入任务信息");
		}
		else{
			document.getElementById("publish").submit();
		}
		}
		</script>
-->
		
		
<script src="../backSettings/js/classie.js"></script>
<script src="../backSettings/js/modalEffects.js"></script>	
	

		
		
<script type="text/javascript" src="../backSettings/js2/jquery-1.12.3.min.js"></script>
<script src="../backSettings/js2/datedropper.min.js"></script>
<script src="../backSettings/js2/timedropper.min.js"></script>
<script>
$("#task\\.startTime").dateDropper({
	animate: false,
	format: 'Y-m-d',
	minYear: '2019'
});
$("#task\\.deadLine").timeDropper({
	meridians: false,
	format: 'HH:mm',
});
</script>
<script>
function checkTime(){
	var date = document.getElementById("task.startTime").value;
	var time = document.getElementById("task.deadLine").value;
	if(date=null){
		alert("请输入日期！");
	}else {
		var deadTime = new Date(date+" "+time);
		var now = new Date().Format("yyyy-MM-dd HH:mm");
		if(deadLine<=now){
			alert("截止时间不能小于当前时间！");
		}
		alert("提交成功过！");
	}
	
}

</script>]]



<script>
function checkYear()
{
	
	var time2=document.getElementById("task.startTime").value;
	var time1=document.getElementById("task.deadLine").value;
	var time=time2+" "+time1;
	var date=new Date().Format("yyyy-MM-dd HH:mm");
	if(time.getTime()>=date.getTime())
		{
		alert("大于");
		}else{
			alert("小于");
		}
	
}
</script>
<script>
function checkPoint()
{
	var point=document.getElementById("task.rewardPoints").value;
	var code=${User.points};
	if(point>code)
		{
		document.getElementById("account_wrong").innerHTML="<font color='red' font size=2px >积分不足</font>";
        document.getElementById("btn").disabled = true;
		}else{
			document.getElementById("account_wrong").innerHTML="<font color='green' font size=2px >积分充足</font>";
	        document.getElementById("btn").disabled = false;
		}
}
</script>

<div style="text-align:center;clear:both;margin-top:160px">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
   </body>
</html>
<script src="../backSettings/js2/jquery-1.8.3.min.js"></script>
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