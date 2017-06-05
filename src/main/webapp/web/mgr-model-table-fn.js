<%@page pageEncoding="UTF-8"%>
parentFn.edit_table=function(ab){
	parentFn.set_table_property(ab);
};
//设置表的属性信息，也就是右上角的布局的表格的信息
parentFn.set_table_property=function(a){
	var arr=$("#table_struct").propertygrid("getData");
    var value=arr.rows[0].value; 
    
    var editors = $("#table_struct").propertygrid('getEditors' , 1);   
     
    var priceEditor = editors[1];    
    
    $(priceEditor).textbox('setValue',a);
};
//设置表格的列信息，参数都是上一个函数传递过来的集合
parentFn.set_table_columns=function(columns){
	 
};