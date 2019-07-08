<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>Bootstrap 实例 - 模态框（Modal）插件</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<h2>创建模态框（Modal）</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	开始演示模态框
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
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
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</div>
</body>
</html>