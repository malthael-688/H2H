<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
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
	<h1>修改密码</h1>
	<div style="margin-top: 50px">
		<form action="/admin/modifyPassword" method="post">
	<div>
		<p>管理员账户</p>
		<input type="text" class="form-control" style="width:200px" placeholder="${adminNum}" value="${adminNum}" name="adminNum" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="16">
	</div>
	<div>
		<p>旧密码</p>
		<input type="text" class="form-control" style="width:200px" name="oldPassword">
	</div>
	<div>
		<p>新密码</p>
		<input type="text" class="form-control" style="width:200px" name ="newPassword" >
		<input type="submit" class="btn btn-default" value="修改" style="position:relative;bottom:34px;left:210px">
	</div>
		</form>
	</div>
</body>
<script>
	var error=${error};
	if(error=='0')
	{
	alert("修改成功！");
	}
	if(error=='1')
		{
		alert("修改失败！");
		}

	
	</script>
</html>
