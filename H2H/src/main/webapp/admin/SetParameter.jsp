<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<script src="/js/jquery-1.8.3.min.js"></script>
<link href="/filter/Fliter.css" rel="stylesheet" />
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script src="/filter/Filter.js"></script>
<script src="/js/bootstrap.min.js"></script>
	<script src="/js/CJL.0.1.min.js"></script>
<title>无标题文档</title>
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
	<h1>系统参数设置</h1>
	
	<form class="navbar-form navbar-left" role="change"  action="/admin/modifyParameter" method="post" >
	<div style="position: absolute;margin-top:20px;">
	
        <div class="form-group">
			<p>每日签到积分</p>
            <input type="text" class="form-control" placeholder="${point}"  name = "param">
        </div>
		<input type="submit" class="btn btn-default" value="修改" style="position:relative;top:15px">
	</div>
		</form>


	
</body>
</html>
