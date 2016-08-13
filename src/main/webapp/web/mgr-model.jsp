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

					/**     
					 * 刷新tab 
					 * @cfg  
					 *example: {tabTitle:'tabTitle',url:'refreshUrl'} 
					 *如果tabTitle为空，则默认刷新当前选中的tab 
					 *如果url为空，则默认以原来的url进行reload 
					 */
					function refreshTab(cfg) {
						var refresh_tab = cfg.tabTitle ? $('#mytabs').tabs(
								'getTab', cfg.tabTitle) : $('#mytabs').tabs(
								'getSelected');
						if (refresh_tab
								&& refresh_tab.find('iframe').length > 0) {
							var _refresh_ifram = refresh_tab.find('iframe')[0];
							var refresh_url = cfg.url ? cfg.url
									: _refresh_ifram.src;
							//_refresh_ifram.src = refresh_url;  
							_refresh_ifram.contentWindow.location.href = refresh_url;
						}
					}

					parentFn.addWindow = function(src) {
						$('#show_data').empty();

						$('#show_data')
								.append(
										"<iframe frameborder='0' src='"
												+ src
												+ "' width='100%' height='100%' border='0' ></iframe>");
						$('#show_data').window('open');

					}
					parentFn.closeImgWindow = function(src) {

						$('#show_data').window('close');

					}
					parentFn.clearCache = function() {

						$.ajax({
							type : "get",
							url : "/main/sys?cmd=init_stu_do_exam&rand=",
							dataType : "text",

							success : function(data) {
								if (data != null && data == "true") {
									alert("缓存清除成功!");
								} else {
									alert("缓存清除失败!");
								}

							},
							error : function(XMLHttpRequest, textStatus,
									errorThrown) {
								alert(errorThrown);
							}
						});
					}

					window.onload = function() {
					    $('#ttx').treegrid({
					        url:'/test.json',
					        idField:'id',
					        treeField:'db_nam',
					        columns:[[
					            {title:'数据库名称',field:'db_nam',width:180},
					            {field:'pro_nam',title:'项目名称',width:60,align:'right'},
					            {field:'obj_nam',title:'对象名称',width:60,align:'right'},
					            {field:'obj_type',title:'对象类型',width:60,align:'right'} 
					        ]]
					    });
					};
				});
			</script>
</head>
<body class="easyui-layout" id="wrap">
	<div
		style="padding: 5px; margin-top: 10px 10px;  background: #fafafa; width: 100%;">
		<a href="#" class="easyui-linkbutton" plain="true"
			iconCls="icon-cancel">创建表</a> <a href="#" class="easyui-linkbutton"
			plain="true" iconCls="icon-reload">管理表</a> <a href="#"
			class="easyui-linkbutton" plain="true" iconCls="icon-search">选择数据源</a>
		<a href="#" class="easyui-linkbutton" plain="true">text button</a> <a
			href="#" class="easyui-linkbutton" plain="true" iconCls="icon-print">Print</a>
		<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-help"></a>
		<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-save"></a>
		<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-back"></a>
	</div>

	<div id="tt_tabs" class="easyui-tabs"   fit="true">
		<div title="创建表" style="padding: 10px;">
			  <table title="项目表"  id="ttx" style="width:600px;height:400px"></table>


		</div>
		<div title="Second Tab" closable="true" style="padding: 10px;">
			Second Tab</div>
		<div title="Third Tab" iconCls="icon-reload" closable="true"
			style="padding: 10px;">Third Tab</div>
	</div>
</body>
</html>
