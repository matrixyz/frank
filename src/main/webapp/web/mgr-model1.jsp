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
				 
				$(function() {

					$("#ttx").propertygrid(
							{
								width : 'auto',
								height : 'auto',
								url:'/property-grid1.json',
								columns : [ [
										{
											field : 'name',
											title : 'Name',
											width : 100,
											sortable : true
										},
										{
											field : 'value',
											title : 'Value',
											width : 200
										} ] ],
								showGroup : true,
								scrollbarSize : 0
							});
					
					
					$.extend($.fn.propertygrid.defaults.columns[0][1], {
						formatter : function(value, rowData, rowIndex) {
							if (rowData.name == "Email") {// 如果是"性格属性"
								return value == "男" ? "男" : "女";
							} else {
								return value;
							}
						}
					});
				});
			</script>
</head>
<body class="easyui-layout" id="wrap">

	<table id="ttx"></table>
</body>
</html>
