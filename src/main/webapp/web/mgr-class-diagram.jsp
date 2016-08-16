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
<script type="text/javascript" src="/js/jsplumb/jsPlumb-2.1.5.js"></script>



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
 });
	
	
   
</script>
</head>
<body class="easyui-layout" >
 
	<div  region="west"  split="true"  style="width:20%;border:0px;">
		 <table   id="class-struct" fit="true" border="0"></table>  
	</div>
	<div  region="center"  split="true"  style="width:80%;border:0px;" >
		   <div style="left: 492px; top: 219px; z-index: 20;" id="B0887C4B-4D1E-1417-5AFC-2DFD99B8D713" class="gradient_node component window " flowid="32" labeltitle="" stepSeq="1" parentid="CE6BBE65-DB5A-0379-CC70-BF45337D7029"> <div><p class="p_title" title="xxxxxx">xxxx</p><a class="flow_left_padding hide"><span class="view" title="查看" onclick="OpenFlowDetail(this)">&nbsp;</span><span class="delete" title="删除" onclick="DragFlow.DeleteItems('B0887C4B-4D1E-1417-5AFC-2DFD99B8D713')">&nbsp;</span></a></div><div class="ep" title="拖动连线"> </div></div>
		 
	</div>
 
</body>
</html>
