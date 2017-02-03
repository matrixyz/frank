<%@ page  pageEncoding="UTF-8"%>  
<script type="text/javascript">
	//var parentFn = new Object();
	$(function() {
		/* 类管理开始 */
	    $('#code-mgr-class').treegrid({
	        url:'/file-tree.json',
	        idField:'id',
	        treeField:'file_nam',
	        columns:[[
	            {title:'名称',field:'file_nam',width:180},
	            {field:'package',title:'包名称',width:140,align:'left'},
	            {field:'type',title:'文件类型',width:60,align:'left'},
	           
	            {field:'operate',title:'操作',
	            formatter:function(value,rowData,rowIndex){
	            	
	            	if(rowData.state=='open'){
	            		return '<a href="#">创建文件</a>';
	            	}
	            	
	            	return '<a href="#"> 编辑</a>|<a href="#"> 删除</a>';
	            
	            },width:60,align:'right'},
	            {field:'obj_comment',title:'描述',width:160,align:'left'}
	        ]]
	    });
	});
</script>
<style type="text/css">
 
</style>
<div class="easyui-layout" data-options="fit:true"  >
	<div region="west" style="width: 20%;">
		<table title="文件" id="code-mgr-class" fit="true" border="0"></table>
	</div>
	<div region="center" style="padding-left: 5px;  ">
		<div  class="easyui-layout" data-options="fit:true">
			<div   region="north"   style="height:80%; " >
		    	     
			</div>
			<div  region="center" style="height:20%; "   >
		    	 
			</div>
		</div> 
	</div>
</div>