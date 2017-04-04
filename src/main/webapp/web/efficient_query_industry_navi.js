<%@page pageEncoding="UTF-8"%>
 
$('#efficient_query_industry_navi_table').treegrid({
    url:'/web/efficient_query_industry_navi.json',
    idField:'id',
    treeField:'db_nam',
    columns:[[
        {title:'行业名称',field:'db_nam',width:180},
        
        {field:'obj_nam',title:'项目名称',width:60,align:'right'},
        {field:'obj_nam',title:'数据库名称',width:60,align:'right'},
        {field:'obj_nam',title:'表名称',width:60,align:'right'},
        {field:'obj_type',title:'创建新表',
        formatter:function(value,rowData,rowIndex){
        	
        	if(rowData.state=='open'){
        		//return '<a href="#">创建表</a>';
        	}
        	 
        	return '<a href="#" onclick="useThisField(\''+rowData.obj_nam+'\')">使用</a> ';
        
        },width:60,align:'right'},
        {field:'obj_comment',title:'描述', align:'right'}
    ]],
    
    toolbar: [{ text: '展开', iconCls: 'icon-add', handler: function () {// 添加列表的操作按钮添加，修改，删除等
                 
    
    } }, '-',
     { text: '收缩', iconCls: 'icon-remove', handler: function () {
         // 删除时先获取选择行
         var rows = datagrid_table.datagrid("getSelections");
         // 选择要删除的行
         if (rows.length > 0) {
             $.messager.confirm("提示", "你确定要删除吗?", function (r) {
            	 if (r) {
                     var ids = [];
                     for (var i = 0; i < rows.length; i++) {
                         ids.push(rows[i].ID);
                     }
                     // 将选择到的行存入数组并用,分隔转换成字符串，
                     // 本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
                     alert(ids.join(','));
                 }
             });
         }
         else {
             $.messager.alert("提示", "请选择要删除的行", "error");
         }
     }
     } , '-']
});