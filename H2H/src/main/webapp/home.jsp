<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <title>首页</title>
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic" rel="stylesheet" type="text/css" />
		<script src="./backSettings/js2/jquery.min.js"></script>
		<script src="./backSettings/js2/jquery.poptrox-2.2.js"></script>
		<script src="./backSettings/js2/skel.min.js"></script>
		<script src="./backSettings/js2/init.js"></script>
        <link rel="stylesheet" href="./backSettings/css2/skel-noscript.css" />
	 	<link rel="stylesheet" href="./backSettings/css2/style-ht.css" />
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="./backSettings/css2/datedropper.css">
		<link rel="stylesheet" type="text/css" href="./backSettings/css2/timedropper.min.css">
		
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	
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
        <a class="navbar-brand" href="test.html">HELP TO HELP</a>
    </div>
	
	<div class="navbar-form navbar-right">
	 <form class="navbar-form navbar-right" role="search">
	 <div class="dropdown">
    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
        <img src="./backSettings/img/user.jpeg" width="25" height="20">
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

 <div class="indexMain">
    <div class="indexMain_left">
        <div class="indexMain_left_btn">
            <ul>
                <li><a href="javascript:">跑腿</a></li>
				<li></li>
				<li><a href="javascript:">跑腿</a></li>
				<li></li>
				<li><a href="javascript:">跑腿</a></li>
				<li></li>
				<li><a href="javascript:">跑腿</a></li>
				<li></li> 
            </ul>
        </div>
		<div class="indexMain_left_con">
            <!--有主题图循环结束-->
            <!--无主题图循环开始-->
            <div class="indexCon_msg">
                
                <div class="indexCon_msg_detail">
                    <a data-toggle="collapse" data-parent="#accordion" 
							href="#collapseTwo" href="">
                        <div class="indexCon_msg_detail_tittle">
                            <span>跑腿</span>
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
                            <li><span class="glyphicon glyphicon-play" style="color: rgb(0, 152, 193);"></span>2019-07-02 18:23</li>
							<li></li>
                            <li><span class="glyphicon glyphicon-pause" style="color: rgb(255, 0, 17);"></span>2019-07-02 20:45</li>
							<li></li>
							<li></li><li></li>
							<li><a href="taskInformation.jsp"><span class="glyphicon glyphicon-check" style="color: rgb(0, 152, 193);"></span>查看</a></li>
							<li></li><li></li>
							<li><span class="glyphicon glyphicon-thumbs-up" style="color: rgb(0, 152, 193);"></span>28</li>
							<li></li><li></li>
							<li><span class="glyphicon glyphicon-comment" style="color: rgb(0, 152, 193);"></span>28</li>
							<li></li>
							<li><span class="glyphicon glyphicon-usd" style="color: rgb(255, 235, 118);"></span>287</li>
                        </ul>
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
				<form method="post" action="#" id="publish">
					<div class="row half">
						<div class="6u"><input type="text" class="text" id="title" name="title" placeholder="标题" /></div>
						<div class="6u"><input type="text" class="text" id="rewardPoints" name="rewardPoints" placeholder="悬赏积分" /></div>
					</div>
					<div class="row half">
						<div class="6u">
							<select name="type" id="type">
									<option selected="selected1">选择类型</option>
									<option>找人</option>
									<option>找东西</option>
									<option>考试</option>
									<option>问路</option>
									<option>生活</option>
									<option>脱单</option>
									<option>其他</option>
							</select>
						</div>
						<div class="6u" style="width:160px;float:left;display:inline">
							<label type="text" class="text">截止时间</label>
						</div><div style="width:168px;float:left;display:inline">	
							<input type="text" class="input" id="pickdate" name="time1" placeholder="年月日"/>
						</div><div style="width:140px;float:left;display:inline">
							<input type="text" class="time" id="picktime" name="time2" placeholder="时间" />
						
						</div>
						

					</div>
				  	<div class="row half">
						<div class="12u">
							<textarea name="description" id="description" placeholder="任务描述"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="12u">
							<ul class="actions">
								<li>
									<ul class="actions">
										<li><a href="#" class="button form" onClick="publishTask()">发布</a></li>
									</ul>									
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
                    公告发布
                </div>
                <div class="pwfbCon"></div>
                <div class="pwfbFooter"></div>
            </div>
            <div class="indexPublic">
                <div class="indexPublic_head">
                    任务热度榜
                </div>
                <div class="indexPublic_con">
                    <ul class="weekHot">
                        <li><a href="">找一个这学期工科数学分析这门课程的学生</a><span>29</span></li>
                        <li><a href="">帮忙取个快递 不大 保管到开学找你拿orz </a><span>29</span></li>
                        <li><a href="">急 老校区求购一个小行李箱 酬劳私聊 </a><span>29</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
			

    <div class="clear"></div>
</div>
<footer class="publicFooter">
    <p>Copyrigh &copy; 2019 PaiWang 校园帮帮忙项目组版权所有 陕ICP备16032224号-2</p>
</footer>

	<script>
		function publishTask(){

		var title=document.getElementById("title").value;
		var rewardPoints=document.getElementById("rewardPoints").value;
		var type=document.getElementById("type").value;
		var date=document.getElementById("pickdate").value;
		var time=document.getElementById("picktime").value;
	
		if(title=="" || rewardPoints==""||type==""||date==""||time==""){
			alert("请正确输入任务信息")；
		}
		else{
			document.getElementById("publish").submit();
		}
		}
		</script>
		
		
<script src="./backSettings/js/classie.js"></script>
<script src="./backSettings/js/modalEffects.js"></script>	
	

		
		
<script type="text/javascript" src="./backSettings/js2/jquery-1.12.3.min.js"></script>
<script src="./backSettings/js2/datedropper.min.js"></script>
<script src="./backSettings/js2/timedropper.min.js"></script>
<script>
$("#pickdate").dateDropper({
	animate: false,
	format: 'Y-m-d',
	maxYear: '2020'
});
$("#picktime").timeDropper({
	meridians: false,
	format: 'HH:mm',
});
</script>

<div style="text-align:center;clear:both;margin-top:160px">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
   </body>
</html>
<script src="./backSettings/js2/jquery-1.8.3.min.js"></script>
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