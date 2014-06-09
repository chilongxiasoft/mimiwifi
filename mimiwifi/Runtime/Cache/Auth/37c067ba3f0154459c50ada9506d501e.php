<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]> <html class="ie6 oldie"> <![endif]-->
<!--[if IE 7]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8]>    <html class="ie8 oldie"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>MIMIWIFI</title>
<!--<link href="/Public/Auth/css/boilerplate.css" rel="stylesheet" type="text/css">-->
<link href="/Public/Auth/css/style.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="/Public/default/assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
// 此函数为和路由器交互的函数
function login (token)
{

	$.ajax({
	async:false,
	type:"POST",
	url:'<?php  if (isset($_GET["gwaddr"])) { $gwaddr = $_GET["gwaddr"]; echo 'http://' . $gwaddr . '/api/login.cgi'; }else { echo 'http://192.168.118.1/api/login.cgi'; }?>',                    
	dataType: 'jsonp',
	jsonp: 'jsonpcallback',  
	data: { "token": token },		    
	timeout: 1000,

	success:function(msg)				    
	{ 
		if (msg.ret > 0)
		{
			$(".notecont h2").text("您已经成功登录!");
<!-- 			<?php
 if (isset($_GET["url"])) { $url = $_GET["url"]; echo "setTimeout(function(){window.location='http://". $url . "';},3000);"; }else { } ?> -->
			
		}else {
			$(".notecont h2").text("登录失败!");
		}
	},

	error:function()
	{	
		$(".notecont h2").text("与服务器通讯失败!");
	}
	});


}


// 此函数为和服务器交互,获取token的并自动和路由器交互的函数
function Submit()
{

	$.ajax({
	async:false,
	type:"GET",
	url:'<?php echo U("/index/token");?>',                    
	dataType: 'json',
	timeout: 1000,

	success:function(msg)
	{ 
		if (msg)
		{
				login(msg);
		}
	},

	error:function()
	{	
	}
	});

}


$(document).ready(function(){

	Submit();
});

</script>
</head>
<body>
<div id="status"></div>
<div class="gridContainer clearfix">
  <div id="div1" class="fluid wrapper test transition">
  	<h1 id="logo" class="test"><img class="lo_ico" src="/Public/Auth/images/successico.png"></h1>
  	<div class="notecont transition">
      <h2></h2>
  	</div>
    <div id="footer">
      <p>@MIMIWIFI，无线，无限可能</p>
    </div>
  </div>
</div>
</body>
</html>