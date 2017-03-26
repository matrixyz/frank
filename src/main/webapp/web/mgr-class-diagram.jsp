<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
 
	<title>like a man</title>
	<link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css"/>
	 <link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css"/>

			<style type="text/css">
html, body {
	height: 100%;
	margin: 0 auto;
 
}
.line{
position:absolute;
left:0px;
top:100px;
 
border:1px solid #f90;
}
</style>
			<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
			<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
		 



			<script type="text/javascript">
				var parentFn = new Object();
				parentFn.allTitle = new Array();//用来存储所有选项卡的标题
				function MathRand() {//该函数为了防止IE缓存页面，造成 datagrid 刷新无反应
					var Num = "";
					for (var i = 0; i < 8; i++) {
						Num += Math.floor(Math.random() * 10);
					}
					return Num;
				}

				$(function() {
					 $('<canvas id=\"canvasx\" width=\"100\" height=\"100\"  class=\"line\"></canvas>').appendTo($( "#xx" ));
					 $( "#canvas" ).draggable();
				});
				window.onload=function(){
					var canvas=document.getElementById("canvas");
	
					var context=canvas.getContext("2d");
					
					context.moveTo(0,0);
	
					context.lineTo(200,200);
	 
					context.lineWidth=1	;
					context.strokeStyle="#f90";
					context.stroke()
					var canvas=document.getElementById("canvasx");
	
					var context=canvas.getContext("2d");
					
					context.moveTo(0,0);
	
					context.lineTo(100,100);
	 
					context.lineWidth=2	;
					context.strokeStyle="#c3c3c3";
					context.stroke()
				
				}
				
				
				
				
			</script>
</head>
<body  id="root">
<canvas id="canvas" width="200" height="200"  class="line"></canvas>
	 <div id="xx" style="border:1px solid #ccc;width:300px;height:300px"></div>
	 

</body>
</html>
