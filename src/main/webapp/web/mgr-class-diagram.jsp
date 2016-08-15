<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
	<title>like a man</title>
	<link rel="stylesheet" type="text/css"
		href="/js/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/js/easyui/themes/icon.css">
			<style type="text/css">
html, body {
	height: 100%;
	margin: 0 auto;
	background:#ccc;
}
</style>
<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jtopo-0.4.6-min.js"></script>
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
	    $('#class-struct').treegrid({
	        url:'/test.json',
	        idField:'id',
	        treeField:'db_nam',
	        columns:[[
	            {title:'数据库名称',field:'db_nam',width:60},
	            {field:'pro_nam',title:'项目名称',width:60,align:'right'},
	            {field:'obj_nam',title:'对象名称',width:60,align:'right'},
	           
	            {field:'obj_type',title:'创建新表',
	            formatter:function(value,rowData,rowIndex){
	            	
	            	if(rowData.state=='open'){
	            		return '<a href="#">创建表</a>';
	            	}
	            	
	            	return '<a href="#"> 编辑</a>|<a href="#"> 删除</a>';
	            
	            },width:60,align:'right'},
	            {field:'obj_comment',title:'描述',width:160,align:'right'}
	        ]]
	    });
	    
	    
		
	    var canvas = document.getElementById('canvas'); 
	    var stage = new JTopo.Stage(canvas); // 创建一个舞台对象
	    var scene = new JTopo.Scene(stage); // 创建一个场景对象
	    
	    var node = new JTopo.Node("Hello");    // 创建一个节点
	    node.setLocation(300,200);    // 设置节点坐标                    
	    scene.add(node); // 放入到场景中
		
	    
	    
	    
	    
	});
	

	
	
	
	
</script>
</head>
<body class="easyui-layout" >
 
	<div  region="west"  split="true"  style="width:20%;border:0px;">
		 <table   id="class-struct" fit="true" border="0"></table>  
	</div>
	<div  region="center"  split="true"  style="width:80%;border:0px;" >
		<canvas width="800"height="500"id="canvas"style=" background-color:#EEEEEE; border:1px solid #444;">
</canvas>
	</div>
 
</body>
</html>
