<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>		
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<script src="../backSettings/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="../backSettings/css/bootstrap.min.css">
<script src="../backSettings/js/bootstrap.min.js"></script>
	<script src="../backSettings/js/CJL.0.1.min.js"></script>
<title>notice manage</title>
</head>
<style>
.box{
	position: absolute;
    width:50%; margin-top:10%; margin:auto; padding:28px;
    height:350px; border:1px #111 solid;
    display:none;
}
.box.show{display:block;} 
.box .x{ font-size:18px; text-align:right; display:block;}
.box input{width:80%; font-size:18px; margin-top:18px;}
</style>
	
<body style="margin-left:100px;margin-top:50px">
	<h1>公告管理</h1>
	<div style="z-index: 0">
	<form class="navbar-form navbar-left" role="search" method="post" action="/admin/noticeSearch">
	<div style="position: absolute;margin-top:20px;">
	
        <div class="form-group">
            <input type="text" name = "search" class="form-control" placeholder="Search">
        </div>
		<button type="submit"   class="btn btn-default">搜索</button>
	</div>
		</form>
		<div style="position: absolute;margin-left: 300px;margin-top: 30px">
			<button type="button" class="btn btn-default btn-sm" onClick="msgbox2(1)">
          <span class="glyphicon glyphicon-plus"></span>发布公告
        </button>
		</div>
	</div>
<div class="table-responsive" style="position: absolute;margin-right: 350px;margin-top: 80px; z-index: 0">
	<table class="table">
		<thead>
			<tr>
				<th>标题</th>
				<th>日期</th>
				<th>修改</th>
				<th>删除</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${notices}" var="notice" varStatus="st">
			<tr>
				<td><a onClick="window.location.href='#'">${notice.getStr("title")}</a></td>
				<td>${notice.getStr("time")}</td>
				<td>
					<input type="button" onClick="msgbox(1)" value="修改">
				</td>
				<td>
					<form action="" method="post">
						<input type="submit" name="delete" value="删除">
					</form>
				</td>
			</tr>
			
			</c:forEach>
		</tbody>
</table>
</div>
	<div id="inputbox" class="box" style="z-index: 999;background: #FFFFFF">
        <a class="x" href="" onclick="msgbox(0); return false;">关闭</a>
		<form>
		<h2>标题：</h2>
		<input type="text" id="title">
		<h2>内容：</h2>
		<textarea id="content" style="width:414px"></textarea>
        <input type="submit" value="提交">
		</form>
     </div>
	<div id='inputbox2' class="box" style="z-index: 999;background: #FFFFFF">
        <a class='x' href=''; onclick="msgbox2(0); return false;">关闭</a>
		<form>
		<h2>标题：</h2>
		<input type="text" id="title2">
		<h2>内容：</h2>
		<textarea id="content2" style="width:414px"></textarea>
        <input type="submit" value="提交">
		</form>
     </div>
</body>
<script type="text/javascript">
function msgbox(n){
	document.getElementById('inputbox').style.display=n?'block':'none';
}
function msgbox2(n){
	document.getElementById('inputbox2').style.display=n?'block':'none';
}
</script>
</html>
