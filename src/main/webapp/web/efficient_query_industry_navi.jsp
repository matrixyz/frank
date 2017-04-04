<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ include file="../sys-top.jsp"%>
<script type="text/javascript">
	 
	function useThisField(value){
		parent.parentFn.setEfficient_query_cbxgrid_industry(value);
	}
	$(function() {
		<%@ include file="efficient_query_industry_navi.js"%>
		 
		
		window.onload = function() {

		};
	});
</script>
	 
 <table  id="efficient_query_industry_navi_table" fit="true" border="0"></table>
