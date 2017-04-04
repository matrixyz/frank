<%@page pageEncoding="UTF-8"%>
    $('#efficient_query_cbxgrid_history').combogrid({
    panelWidth:450,
    value:'006',
    idField:'code',
    textField:'name',
    url:'/datagrid_data.json',
    columns:[[
    {field:'itemid',title:'查询名称',width:60},
    {field:'listprice',title:'查询日期',width:100},
    {field:'listprice',title:'查询热度',width:120},
    {field:'attr1',title:'查询结果数量',width:100},
    {field:'listprice',title:'结果预览',width:120} 
    ]],
    onSelect: function (rowIndex, rowData) {
    	alert(rowData.itemid);
    }
 });
    $('#efficient_query_cbxgrid_industry').combogrid({
    	panelWidth:450,
    	value:'006',
    	idField:'code',
    	textField:'name',
    	url:'/datagrid_data.json',
    	columns:[[
    	          {field:'itemid',title:'查询名称',width:60}, 
    	          {field:'listprice',title:'查询热度',width:120},
    	          {field:'attr1',title:'查询结果数量',width:100},
    	          {field:'action',title:'结果预览',width:120} 
    	          ]]
    });
    //控制域选择器窗口最大化
    $('#efficient_query_btn_industry').click(function(){
       parent.parentFn.max_agile_field_select();
       $("#efficient_query_industry_navi").dialog('open');
       $("#efficient_query_industry_navi").dialog('center');
       
  });    
    
  $('#test_btn').click(function(){
        parent.parentFn.setEditRowValue("asdfasdfasdf");
        parent.parentFn.close_agile_field_select(); 
        
   });    
    
	//提供给子窗体调用设置 Efficient_query_cbxgrid_industry的值
	parentFn.setEfficient_query_cbxgrid_industry=function(values){
			//设置combogrid的值
		  $('#efficient_query_cbxgrid_industry').combogrid("setValue", values); 
		  
		  //添加一行数据
		  $('#efficient_query_cbxgrid_industry').combogrid("grid").datagrid("insertRow",  {index:0,row: {
			  'itemid':324,'listprice':values,'attr1':'asdf','action':'asdfadfddddddddddd'
		  }}); 
		  $("#efficient_query_industry_navi").dialog('close');
	}
	/* 表字段显示的datagrid的数据操作和绑定   结束*/    
    
    
    
    
 
     
    