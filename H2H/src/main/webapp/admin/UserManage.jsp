<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false" %>
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
<title>User manage</title>
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
	<h1>用户管理</h1>
	<div style="z-index: 0">
	
	
	<form class="navbar-form navbar-left" role="search" action= "/admin/userSearch"  method = "post">
	<div id="demo4" style="height:50px;"></div>
	<div style="position: absolute;margin-top:20px;">
	
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search" name = "search">
        </div>
		<button type="submit" class="btn btn-default">搜索</button>
	</div>
		</form>
		
		
		
	</div>
<div class="table-responsive" style="position: absolute;margin-right: 350px;margin-top: 180px; z-index: 0">
	<table class="table">
		<thead>
			<tr>
				<th>学号</th>
				<th>用户</th>
				<th>电话号码</th>
				<th>邮箱</th>
				<th>积分</th>
				<th>状态</th>
				<th>封禁</th>
				<th>删除</th>
				<th>积分</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user" varStatus="st">
			<tr>
				<td><a href="/admin/showUser?num=${user.getStr("num")}">${user.getStr("num")}</a></td>
				<td><a >${user.getStr("name")}</a></td>
				<td><a >${user.getStr("phone")}</a></td>
				<td><a >${user.getStr("email")}</a></td>
				<td>${user.getStr("points")}</td>
				<td>${user.getStr("userState")}</td>
				
				<td>
					<a href="/admin/banUser?num=${user.getStr("num")}"> <input type="button" name="pass"  value="封禁" > </a>
				</td>
				<td>
					
				<a href="/admin/deleteUser?num=${user.getStr("num")}"><input type="submit" name="delete" value="删除"></a>
					
				</td>
				<td>
				<input type="button" id="${user.getStr("num")}" onClick="msgbox2(1,${user.getStr("num")},${user.getStr("points")})" value="修改"  name="${user.getStr("num")}">
				
				</td>
			</tr>
			
			</c:forEach>
		</tbody>
</table>
</div>
	<div id="inputbox" class="box" style="z-index: 999;background: #FFFFFF">
        <a class="x" href=""; onclick="msgbox(0); return false;">关闭</a>
		<form>
		<h2>封禁天数：</h2>
		<input type="text" id="time">
        <input type="submit" value="确定">
		</form>
     </div>
     
	<div id="inputbox2" class="box" style="z-index: 999;background: #FFFFFF">
        <a class="x" href=""; onclick="msgbox2(0); return false;">关闭</a>
		<form  action="/admin/changePoint"   method="post">
		<h2>用户积分：</h2>
		<input type="hidden" id="point1" name="num">
		<input type="text" id="point2" value="" name="point" >
        <input type="submit" value="确定">
		</form>
     </div>
     
</body>

<script type="text/javascript">

var error=${state} ;
if(error=='0')
{
alert("封禁成功！");
}else if(error=='1')
	{
	alert("该账号已经被封禁！");
	}else if(error=='2')
	{
	alert("该账号已被删除！");
	}else if(error=='3')
	{
	alert("删除成功！");
	} 
	


function msgbox(n){
	document.getElementById('inputbox').style.display=n?'block':'none';
}
function msgbox2(n,m,t){
	document.getElementById('inputbox2').style.display=n?'block':'none';
	
	document.getElementById('point1').setAttribute("value",m);
	document.getElementById('point2').setAttribute("value",t);
	
}
var data=[
    {
        "id": 1,
        "text": "大一"
    },
    {
        "id": 2,
        "text": "大二"
    },
    {
        "id": 3,
        "text": "大三"
    },
    {
        "id": 4,
        "text": "大四"
    }]
  $('#demo4').comboboxfilter({
        url: '',
		scope: 'FilterQuery3',
		multiple: true,
		data:data,
		onChange:function(newValue){
		$('#demo_value').val(newValue);
		}
    });
</script>
</html>
