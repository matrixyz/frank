<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css" />
<style type="text/css">
html, body {
	height: 100%;
	margin: 0 auto;
}
.common-top-bar{
padding: 5px; margin-top: 10px 10px; background: #fafafa; width: 100%;
}
 
</style>
<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	var parentFn = new Object();
	
	function MathRand() {//该函数为了防止IE缓存页面，造成 datagrid 刷新无反应
		var Num = "";
		for (var i = 0; i < 8; i++) {
			Num += Math.floor(Math.random() * 10);
		}
		return Num;
	}

	
</script>