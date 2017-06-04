<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ include file="../sys-top.jsp"%>
<script type="text/javascript">
	parentFn.allTitle = new Array();//用来存储所有选项卡的标题
	$(function() {
		// 表管理js开始
		<%@ include file="mgr-model-table.js"%>
			
		<%@ include file="mgr-model-class.js"%>
		
		window.onload = function() {
			 $("#agile_field_select").dialog('close');
		};
	});
</script>
</head>
<body class="easyui-layout" id="wrap">
	<div class="common-top-bar">
			<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">管理类</a> 
			<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-reload">管理表</a>
			<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search">类图</a>
			<a href="#" class="easyui-linkbutton" plain="true">text button</a> 
			<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-print">Print</a>
			<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-help"></a>
			<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-save"></a>
			<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-back"></a>
	</div>

	<div id="tt_tabs" class="easyui-tabs" fit="true">
		<!-- 类图开始 -->
		<div title="Third Tab" iconCls="icon-reload" closable="true">

			<iframe frameborder="0" style="width: 100%; height: 100%"
				src="/web/mgr-class-diagram.jsp"></iframe>
		</div>
		<!-- 类图结束 -->
		<!-- 代码管理器开始 -->

		<div title="CodeMgr" style="padding: 10px;" iconCls="icon-reload" >

			<%@include file="code-editor.jsp"%>
		</div>
		<!-- 代码管理器结束 -->


		<!-- 表管理开始 -->
		<div title="表管理" style="padding: 10px;" data-options="selected:true">
			<div class="easyui-layout" data-options="fit:true">
				<div region="west" style="width: 50%;">
					<table title="项目表" id="mgr_tables" fit="true" border="0"></table>
				</div>
				<div region="center" style="padding-left: 5px; border: 0px;">

					<div class="easyui-layout" data-options="fit:true">
						<div region="north" style="height: 50%; border: 0px;">

							<!-- 表的基本属性信息定义 -->
							<table id="table_struct" class="easyui-propertygrid" fit="true"></table>
						</div>
						<div region="center" style="height: 50%; border: 0px;">
							<!-- 表的字段信息定义 -->
							<table id="table_column_dg" class="easyui-datagrid" fit="true"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 表管理结束 -->
		<!-- 类管理开始 -->
		<div title="类管理" style="padding: 10px;">
			<div class="easyui-layout" data-options="fit:true">
				<div region="west" style="width: 50%;">
					<table title="项目类" id="pro-class" fit="true" border="0"></table>
				</div>
				<div region="center" style="padding-left: 5px; border: 0px;">

					<div class="easyui-layout" data-options="fit:true">
						<div region="north" style="height: 50%; border: 0px;">
							<table class="easyui-propertygrid" fit="true"
								url="/property-grid.json" showGroup="true" scrollbarSize="0"></table>

						</div>
						<div region="center" style="height: 50%; border: 0px;">
							<table id="class-property" class="easyui-datagrid" fit="true"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 类管理结束 -->

	</div>
	
		 
	 <!-- 字段选择器开始 -->
	<div id="agile_field_select" class="easyui-window" title="域选择" style=" width:800px;height:500px;">
		 <iframe    src="agile-field-select.jsp" style="width:100%;height:100%;border:0px;"  ></iframe>
	</div>
 	<!-- 字段选择器结束-->
</body>
</html>
