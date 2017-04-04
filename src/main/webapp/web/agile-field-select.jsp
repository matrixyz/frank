<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ include file="../sys-top.jsp"%>
<script type="text/javascript">
	 
	$(function() {
		<%@ include file="agile-field-select.js"%>
		 
		
		window.onload = function() {
			$("#efficient_query_industry_navi").dialog('close');
		};
		 
		
	});
</script>
	 
		 <table id="table_agile_field_select" class="easyui-datagrid"   style="width:100%;height:100%; " border="0"
		data-options=" singleSelect:true,toolbar:'#table_agile_field_select_toolbar',rownumbers:true,autoRowHeight:false,
pagination:true,
pageSize:10,pageList:[10]">
			<thead>
			<tr>
				<th data-options="field:'qid',width:100">类型(库-表-字段-业务名)</th>
				<th data-options="field:'qid',width:100">名称</th>
				<th data-options="field:'que',width:120">所属表</th>
				<th data-options="field:'tnam',width:100">所属库</th>
				<th data-options="field:'realName',width:100">数据类型</th>
				<th data-options="field:'creTime',width:100">注释</th>
				<th data-options="field:'edit',width:100 ">克隆使用</th> 
				<th data-options="field:'del',width:100 ">只用名</th>
				<th data-options="field:'del',width:100 ">名+数据类型</th>
				 
			</tr>
			</thead>

		</table>
		<!-- 工具栏开始 -->
		<div id="table_agile_field_select_toolbar" style="padding:5px;height:auto"> 
			<div> 
			最近查询: <input id="efficient_query_cbxgrid_history"   value="01">
			行业分类查询: <input id="efficient_query_cbxgrid_industry"  >
			<a id="efficient_query_btn_industry" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">导航查询</a> 
			  
			</div>
			<div> 
			库表字段查询: <input id="efficient_query_cbxgrid_relation"   value="01">
			业务分类查询: <input id="efficient_query_cbxgrid_business"   value="01">
	 		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">直接查询</a> 
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">导航查询</a> 
			</div>
			<div>
			  
			时间查询: <input id="efficient_query_cbxgrid_time"   value="01">
			数据类型分类查询: <input id="efficient_query_cbxgrid_datatype"   value="01">
			</div> 
		</div>			
		<!-- 工具栏结束-->
		
		
	    <!-- 行业类型导航窗体开始 -->
		<div id="efficient_query_industry_navi" class="easyui-window" title="行业选择" style=" width:800px;height:500px;">
			 <iframe    src="efficient_query_industry_navi.jsp" style="width:100%;height:100%;border:0px;"  ></iframe>
		</div>
	 	<!-- 行业类型导航窗体  结束-->
		
		
		
		
		
		
		
