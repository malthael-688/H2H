<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
﻿<!doctype html>

<html class="no-js" lang="en"> 
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0">

  <title>TaskInformation</title>
  <meta name="description" content="TaskDetails">

  <!-- main css file -->
  <link rel="stylesheet" href="./backSettings/css2/style2.css">

  <!-- you can change css skin here -->
  <link rel="stylesheet" id="skin_css" href="./backSettings/css2/skins/default.css">

  <!-- contains styles not supported by IE 6, 7, 8 -->
  <!--[if gt IE 8]><!-->
  <!-- css3 hover effects -->
  <link rel="stylesheet" media="screen" href="./backSettings/css2/effects/all.css">
  <!-- for screens 768px or less in width -->
  <link rel="stylesheet" type="text/css" media="screen" href="./backSettings/css2/responsive.css" />
  <!-- iPhone specific -->
  <link rel="stylesheet" type="text/css" media="screen and (min-device-width : 320px) and (max-device-width: 480px)" href="./backSettings/css2/mobile.css" />
  <!-- <![endif]-->

  <!-- printing rules -->
  <link rel="stylesheet" media="print" href="./backSettings/css2/print.css">

  <!-- Fancybox Plugin -->
  <link rel="stylesheet" href="./backSettings/js2/libs/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen">

  <!--link rel="shortcut icon" href="favicon.gif" /-->

  <!-- Facebook picture -->

  <!-- modify this file to add any changes. This will make update process much easier -->
  <link rel="stylesheet" href="./backSettings/css2/user.css">
  <style type="text/css">
  .no-js body #container .wrap-header article .wrap-title h1 {
	font-family: Consolas, Andale Mono, Lucida Console, Lucida Sans Typewriter, Monaco, Courier New, monospace;
}
  </style>
  <script src="./backSettings/js2/libs/modernizr-2.0.6.min.js"></script>

</head>

<body>

<div id="container">

    <!-- header block -->

    <header class="wrap-header">
      <article>

        <div class="wrap-ribbons"> <a href="./home.jsp" class="ribbon ribbon2" ><em>返回</em></a>
          <a class="ribbon ribbon3" href="~" target="_blank"><em>接取</em></a>
        </div>

        <div class="wrap-title">
          <h1>任务标题：~~~~</h1>
        </div>

      </article>
    </header>

    <!-- information block -->

    <div class="row row-info">
      <article class="markup">

        <h2 class="section-title">Task描述</h2>

        <!-- add your content here -->

        <p>
          这里是任务的描述。
        </p>
      </article>
    </div>

   

    <div class="row row-contact" id="contact_row" style="display: block">
      <article class="markup">

        <h2 class="section-title">Task信息</h2>

        <p>下面是关于任务的一些要求与悬赏.</p>


		  
       <form id="information" class="contact-form" action="~~" method="post">
      		<div class="highlight-slider">
			  <div class="item">
					<a href="./otherPeople.jsp" class="icon">
					<img src="./backSettings/img/head.png" alt="publisher">
					<div class="overlay">发布人</div>
					</a> <!-- end .icon -->
			  </div> <!-- end .item -->
			  <br>
			  <div class="item">
					<a href="" class="icon">
					<img src="./backSettings/img/reward.png" alt="rewardPoints">
					<div class="overlay">悬赏</div>
					</a> <!-- end .icon -->
			  </div> <!-- end .item -->
			  <br>
			  <div class="item">
					<a href="" class="icon">
					<img src="./backSettings/img/type.png" alt="type">
					<div class="overlay">类型</div>
					</a> <!-- end .icon -->
			  </div> <!-- end .item -->
			  <br>			
			  <div class="item">
					<a href="" class="icon">
					<img src="./backSettings/img/time.png" alt="taskTime">
					<div class="overlay">任务时间</div>
					</a> <!-- end .icon -->
			  </div> <!-- end .item -->
			  
			  </div>
          </form>

      </article>
    </div>

    <div class="row row-skills">
      <article>

        <h2 class="section-title">评论</h2>

		<br>
		<br>  			
            <div class="comments">

    			<div class="comment-wrap">
       			<div class="photo">
            	<div class="avatar" style="background-image: url('./backSettings/img/4.jpg')"></div>
				</div>
        		<div class="comment-block">
            	<form action="#">
                <textarea name="" id="" cols="30" rows="3" placeholder="留下你的见解"></textarea>
          		</form>
        		</div>
  				</div>

			<form name="" id="" method="post">
			<c:forEach items="${comments}" var="comment" varStatus="Co">
				<div>
				<label>${comment.name}</label>
				</div>
 		    	<div class="comment-wrap">
        		<div class="photo">
            	<div class="avatar" style="background-image: url('./backSettings/img/1.jpg')"></div>
        		</div>
       			<div class="comment-block">
            	<p class="comment-text">${comment.}</p>
            	<div class="bottom-comment">
                <div class="comment-date">${comment.date}</div>
                <ul class="comment-actions">
                    <li class="complain">评论</li>
                    <li class="reply">回复</li>
                </ul>
            	</div>
       			</div>
  				</div>
			</c:forEach>
			</form>
		</div>

      </article>
    </div>

    <div class="row row-profile row-inversed"></div>
</div>
	
<div id="resize">Resize</div>

  <!-- jQuery 1.6.2 -->
  <script src="./backSettings/js/jq1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="./backSettings/js/libs/jquery-1.6.2.min.js"><\/script>')</script>

  <!-- jQuery Fancybox plugin === http://www.cssmoban.com/ -->
  <script src="./backSettings/js/libs/fancybox/jquery.fancybox-1.3.4.pack.js"></script>

  <script defer src="./backSettings/js/jq1/plugins.js"></script>
  <script defer src="./backSettings/js/jq1/script.js"></script>

  <script defer src="./backSettings/customize/customize.js"></script>




</body>
</html>
