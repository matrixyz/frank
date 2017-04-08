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
left:500px;
top:500px;
 width:200px;
 height:200px;
border:1px solid #f90;
}
.linex{
 
 
border:1px solid #f90;
}
</style>
			<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
			<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
		 



			<script type="text/javascript">
				var parentFn = new Object();
				 

				$(function() {
					 //$('<canvas id=\"canvasx\" width=\"100\" height=\"100\"  class=\"line\"></canvas>').appendTo($( "#xx" ));
					  $( "#canvas" ).draggable();
					 
					 
					/*  $("#canvas").on({
						    mousedown: function(e){
						                var el=$(this);
						                var os = el.offset(); 
						                dx = e.pageX-os.left;
						                dy = e.pageY-os.top;
						                $(document).on('mousemove.drag', function(e){ 
						                	el.offset({top: e.pageY-dy, left: e.pageX-dx});  
						                	$( "#position" ).html(dx+"-"+dy);
						                });
						               
						            },
						 
						   mouseup: function(e){ $(document).off('mousemove.drag'); }}); */
					 
					 $('<canvas id=\"canvasx\" width=\"200\" height=\"200\"  ></canvas>').appendTo($( "#xx" ));
							 
					 $('#canvas').mousemove(function(e){  
						 
						 var x = $('#canvas').offset().left;

						 var y = $('#canvas').offset().top;
						 
					 
						   var leftxx_right_top_x=300;
						 var leftxx_right_top_y= 300;  
						 
						 
						 
						 var xx_width=x-leftxx_right_top_x;
						 var xx_height=y-leftxx_right_top_y; 
						 
						 $('#xx').css("top",leftxx_right_top_y );
						  $('#xx').css("left",leftxx_right_top_x);
						  $('#xx').css("width", xx_width);
						  $('#xx').css("height", xx_height);
						 
						 
						  parentFn.drawLines(xx_width,xx_height);
						 
					  });  
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
				});
				
				
				
				
				
				
				
				
				
				
				window.onload=function(){
					 
					
					
					 var canvasx=document.getElementById("canvasx");
	
					var contextx=canvasx.getContext("2d");
					 
					
					parentFn.drawLines=function(x,y){
						  
						  canvasx.width=x;
						  canvasx.height=y;
						contextx.moveTo(0,0); 
						contextx.lineTo(x,y);
		 
						contextx.lineWidth=1	;
						contextx.strokeStyle="#f90";
						contextx.stroke()  ;
					}
					
					
					
					
					
				
				}
				
				
				
				
			</script>
</head>
<body  id="root">
<div id="canvas"    class="line"></div>
	 <div id="xx" style="border:1px solid #ccc;width:200px;height:200px;top:300px;left:300px;position:absolute"> </div>
	 <div id="leftxx" style="border:1px solid #ccc;width:300px;height:300px">leftxx</div>
	 

</body>
</html>
