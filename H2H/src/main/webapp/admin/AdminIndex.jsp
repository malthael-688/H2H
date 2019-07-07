<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Blueprint: Multi-Level Menu</title>
	<meta name="description" content="Blueprint: A basic template for a responsive multi-level menu" />
	<meta name="keywords" content="blueprint, template, html, css, menu, responsive, mobile-friendly" />
	<meta name="author" content="Codrops" />
	<link rel="shortcut icon" href="../favicon.ico">
	<!-- food icons -->
	<link rel="stylesheet" type="text/css" href="../css/organicfoodicons.css" />
	<!-- demo styles -->
	<link rel="stylesheet" type="text/css" href="../css/demo.css" />
	<!-- menu styles -->
	<link rel="stylesheet" type="text/css" href="../css/component.css" />
	<script src="../js/modernizr-custom.js"></script>
	<script src="../js/dummydata.js"></script>
</head>

<body>
	<!-- Main container -->
	<div class="container">
		<!-- Blueprint header -->
		<header class="bp-header cf">
			<div class="dummy-logo">
				
				<div class="dummy-icon foodicon"><img src="" alt="logo"></div>
				<h2 class="dummy-heading">管理员界面</h2>
				<a href="Login.jsp"><img src="../img/back.jpg" style="width:50px;position: relative;bottom:100px;right:100px"></a>
			</div>
		</header>
		
		<button class="action action--open" aria-label="Open Menu"><span class="icon icon--menu"></span></button>
		<nav id="ml-menu" class="menu">
			<button class="action action--close" aria-label="Close Menu"><span class="icon icon--cross"></span></button>
			<div class="menu__wrap">
				<ul data-menu="main" class="menu__level">
				
				
					<li class="menu__item"><a  class="menu__link" href="" >任务管理</a></li>
				
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-2" href="#">系统管理</a></li>
					
					<li class="menu__item"><a class="menu__link"  href="">用户管理</a></li>
					
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-4" href="#">个人信息管理</a></li>
					
				</ul>
				<!-- Submenu 2 -->
				<ul data-menu="submenu-2" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">公告管理</a></li>
					<li class="menu__item"><a class="menu__link" href="#">各项参数设置</a></li>
				</ul>
				<!-- Submenu 4 -->
				<ul data-menu="submenu-4" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">修改密码</a></li>
					<li class="menu__item"><a class="menu__link" href="#">修改其他属性</a></li>
				</ul>
			</div>
		</nav>
		<div class="content">
			<p class="info">欢迎登录！</p>
			<!-- Ajax loaded content here -->
		</div>
	</div>
	<!-- /view -->
	<script src="../js/classie.js"></script>
	
	<script src="../js/main.js"></script>
	<script>
	(function() {
		var menuEl = document.getElementById('ml-menu'),
			mlmenu = new MLMenu(menuEl, {
				// breadcrumbsCtrl : true, // show breadcrumbs
				// initialBreadcrumb : 'all', // initial breadcrumb text
				backCtrl : false, // show back button
				// itemsDelayInterval : 60, // delay between each menu item sliding animation
				onItemClick: loadDummyData // callback: item that doesn´t have a submenu gets clicked - onItemClick([event], [inner HTML of the clicked item])
			});

		// mobile menu toggle
		var openMenuCtrl = document.querySelector('.action--open'),
			closeMenuCtrl = document.querySelector('.action--close');

		openMenuCtrl.addEventListener('click', openMenu);
		closeMenuCtrl.addEventListener('click', closeMenu);

		function openMenu() {
			classie.add(menuEl, 'menu--open');
		}

		function closeMenu() {
			classie.remove(menuEl, 'menu--open');
		}

		// simulate grid content loading
		var gridWrapper = document.querySelector('.content');

		function loadDummyData(ev, itemName) {
			ev.preventDefault();
			closeMenu();
			
			gridWrapper.innerHTML = '';
			classie.add(gridWrapper, 'content--loading');
			setTimeout(function() {
				classie.remove(gridWrapper, 'content--loading');
				gridWrapper.innerHTML = dummyData[itemName];
			}, 700);
		}
	})();
	</script>
</body>

</html>
