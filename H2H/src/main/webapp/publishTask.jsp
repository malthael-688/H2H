<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>发布任务</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic" rel="stylesheet" type="text/css" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="./backSettings/js2/jquery.min.js"></script>
		<script src="./backSettings/js2/jquery.poptrox-2.2.js"></script>
		<script src="./backSettings/js2/skel.min.js"></script>
		<script src="./backSettings/js2/init.js"></script>

			<link rel="stylesheet" href="./backSettings/css2/skel-noscript.css" />
			<link rel="stylesheet" href="./backSettings/css2/style-ht.css" />

		
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link rel="stylesheet" type="text/css" href="./backSettings/css2/datedropper.css">
		<link rel="stylesheet" type="text/css" href="./backSettings/css2/timedropper.min.css">
		
		</head>
	<body>
		<td><a href="javascript:;" style="margin-right:200px;margin-left: 725px;margin-top: 0px" class="md-trigger button form" data-modal="modal">请点击</a></td>
		<div class="md-modal md-effect-8" id="modal">
		<div class="md-content">
			<article class="container box style3">
				<header>
						<a class="aui_close md-close btn-sm btn-primary" >x</a>
					<h2>任务发布</h2>
					<p>请填写要分布任务的细节。</p>
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
			</article>
			</div>
			</div>

		<!--点击发布按钮后进行的活动，post所有填写的数据(未完成)-->		
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
		
		
<script src="./backSettings/css2js/classie.js"></script>
<script src="./backSettings/css2js/modalEffects.js"></script>	
	

		
		
<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
<script src="./backSettings/css2js/datedropper.min.js"></script>
<script src="./backSettings/css2js/timedropper.min.js"></script>
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