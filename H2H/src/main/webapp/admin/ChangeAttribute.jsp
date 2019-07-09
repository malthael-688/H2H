<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"  %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<script src="../backSettings/js/jquery-1.8.3.min.js"></script>
<link href="../backSettings/filter/Fliter.css" rel="stylesheet" />
<link rel="stylesheet" href="../backSettings/css/bootstrap.min.css">
<script src="../backSettings/filter/Filter.js"></script>
<script src="../backSettings/js/bootstrap.min.js"></script>
	<script src="../backSettings/js/CJL.0.1.min.js"></script>
<title>无标题文档</title>
</head>
	
<body style="margin-left:100px;margin-top:50px">
	<h1>修改其他属性</h1>
	<div style="margin-top: 50px">
	<div>
		<p>邮箱</p>
		<form action="/admin/changeEmail"  method="post">
			<input type="email" class="form-control" style="width:200px" placeholder="${email}" name="email" >
			<input type="submit" class="btn btn-default" value="修改" style="position:relative;bottom:34px;left:210px">
		</form>
	</div>
	<div>
		<p>名字</p>
		<form action="/admin/changeName"  method="post">
			<input type="text" class="form-control" style="width:200px" placeholder="${name}" name="name">
			<input type="submit" class="btn btn-default" value="修改" style="position:relative;bottom:34px;left:210px">
		</form>
	</div>
		</div>
</body>
</html>
