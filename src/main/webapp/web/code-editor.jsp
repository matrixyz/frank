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
.line{width:100%;height:30px;background:#eff;}
.line-no{width:30px;background:#eee;text-align:center;}
.line-height{height:30px;line-height:30px;}
.float-all{float:left;}
.ele-code{ font-size:16px;border:0px solid #f90;text-align:left;padding:0px 5px;height:28px;line-height:28px;float:left;}
.border1{border:1px solid #f90;}
.ele-op{width:15px;height:15px;background:#8a8af3;float:left;}
.ele-op-par{width:30px;height:30px; float:left;}
.color-red{background:#f58181;}
.auto-tip-box{width:200px;background:#e0ecff;float:left; }
</style>
<div class="easyui-layout" data-options="fit:true"  >
	<div region="west" style="width: 20%;">
		<table title="文件" id="code-mgr-class" fit="true" border="0"></table>
	</div>
	<div region="center" style="padding-left: 5px;  ">
		<div  class="easyui-layout" data-options="fit:true">
			<div   region="north"   style="height:80%; " >
		    	<div class="line">
		    	<span class="line-no float-all line-height">1</span>
		    	<span class="ele-code">package</span>
		    	<span class="ele-op-par">
			    	<span class="ele-op color-red"></span>
			    	<span class="ele-op"></span>
			    	<span class="ele-op"></span>
			    	<span class="ele-op color-red"></span>
		    	</span>
		    	<span class="ele-code">com.controller.UserCtl</span>
		    	<span class="ele-op-par">
			    	<span class="ele-op color-red"></span>
			    	<span class="ele-op"></span>
			    	<span class="ele-op"></span>
			    	<span class="ele-op color-red"></span>
		    	</span>
		    	<span class="ele-code">;</span>
		    	</div>     
		    	<div class="line">
		    	<span class="line-no float-all line-height">1</span>
		    	<span class="ele-code">import</span>
		    	<span class="ele-op-par">
			    	<span class="ele-op color-red"></span>
			    	<span class="ele-op"></span>
			    	<span class="ele-op"></span>
			    	<span class="ele-op color-red"></span>
		    	</span>
		    	<span class="ele-code">org.springframework.beans.factory.annotation.Autowired</span>
		    	<span class="ele-op-par">
			    	<span class="ele-op color-red"></span>
			    	<span class="ele-op"></span>
			    	<span class="ele-op"></span>
			    	<span class="ele-op color-red"></span>
		    	</span>
		    	<span class="ele-code">;</span>
		    	</div>     
		    	
		    	<div class="auto-tip-box">
		    	 <span class="ele-code border1">java-key</span>
		    	 <span class="ele-code border1">busi</span>
		    	 <span class="ele-code border1">遍历集合</span>
		    	 <span class="ele-code border1">if-true</span>
		    	 </div>
		    	
			</div>
			<div  region="center" style="height:20%; ">
		    	 
			</div>
		</div> 
	</div>
</div>