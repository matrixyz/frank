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
    ]]
 });
    //控制域选择器窗口最大化
    $('#efficient_query_btn_industry').click(function(){
       parent.parentFn.max_agile_field_select();
       $("#efficient_query_industry_navi").dialog('open');
       $("#efficient_query_industry_navi").dialog('center');
       
  });    
    
 
     
    