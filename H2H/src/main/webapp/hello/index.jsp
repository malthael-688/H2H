<html>
<body>
<h2>Hello World!</h2>
<form action ="/hello/testSave" method="post">
    <input type="text" name="name">
    <input type="text" name="id">
    <button type="submit" onclick="get()">submit</button>
</form>
<script>
function get(){
	var get;
	get=new XMLHttpRequest();
	if(get!=null)
		{alert(get.responseText);}
}
</script>
</body>
</html>
