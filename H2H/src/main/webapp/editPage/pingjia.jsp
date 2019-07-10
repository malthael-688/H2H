<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<script>
	var xhttp;
	if (window.XMLHttpRequest) {
		xhttp = new XMLHttpRequest();
	} else {
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	function send(p) {
		xhttp.open("post","/editPage/pingjia?score="+p+"&taskId="+${taskId},false);
		xhttp.send();
		alert("评价成功");
		location.href="/editPage";
	}
</script>
<head>
	<meta charset="utf-8"> 
			<title>星级评价</title>
		<link rel="stylesheet" href="./backSettings/css/mytyle.css" />
		<style type="text/css">
			*{
				margin: 0;
			}
			.box{
				width: 80%;
				margin:20px auto;
			}
			.list{
				margin: 0 40px;
				width: 30%;
				float: left;
			}
			a{
				font-size: 40px;
				text-decoration: none;
				color:  rgb(0, 0, 0);;
			}
			span{
				font-size: 33px;
				padding-top: 30px;
				margin-left: 20px;
			}
			.c1{
				color: #FF0000;
			}
			.c2{
				color: #FF4500;
			}
			.c3{
				color: #FF6347;
			}
			.c4{
				color: #F08080;
			}
			.c5{
				color: #FF7F50;
			}
		</style>
		<script type="text/javascript" src="./backSettings/js/jquery-1.11.0.js" ></script>
		<script type="text/javascript" src="./backSettings/js/my.js" ></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	评价
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:800px;height:180px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					请您评价这次任务的满意度~谢谢
				</h4>
			</div>
			<div class="modal-body">
			<div class="box">
			<div class="list">
			<!--评价1，2，3，4，5-->
				<a href="javascript:void(0)" onclick="send(1)" class="star1">★</a>
				<a href="javascript:void(0)" onclick="send(2)" class="star2">★</a>
				<a href="javascript:void(0)" onclick="send(3)" class="star3">★</a>
				<a href="javascript:void(0)" onclick="send(4)" class="star4">★</a>
				<a href="javascript:void(0)" onclick="send(5)" class="star5">★</a>
			</div>
			<span class="remark"></span>
		</div>	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
</html>