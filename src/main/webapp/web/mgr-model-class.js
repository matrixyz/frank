<%@page pageEncoding="UTF-8"%>

/** ************************************************************************** */
/* 类管理开始 */
$('#pro-class').treegrid({
    url:'/file-tree.json',
    idField:'id',
    treeField:'file_nam',
    columns:[[
        {title:'名称',field:'file_nam',width:180},
        {field:'package',title:'包名称',width:140,align:'left'},
        {field:'type',title:'文件类型',width:60,align:'left'},
       
        {field:'operate',title:'操作',
        formatter:function(value,rowData,rowIndex){
        	
        	if(rowData.state=='open'){
        		return '<a href="#">创建文件</a>';
        	}
        	
        	return '<a href="#"> 编辑</a>|<a href="#"> 删除</a>';
        
        },width:60,align:'right'},
        {field:'obj_comment',title:'描述',width:160,align:'left'}
    ]]
});
var datagrid=$("#class-property");
datagrid.datagrid({
	
	
	singleSelect:true,
	idField:'itemid',
	url:'/datagrid_data.json',
	columns:[[
		{field:'itemid',title:'字段索引',width:60},
		{field:'productid',title:'字段名称',width:100},
		{field:'listprice',title:'类型',width:80,align:'right'},
		{field:'unitcost',title:'默认值',width:80,align:'right' },
		{field:'attr1',title:'允许空',width:150 },
		{field:'action',title:'描述',width:70,align:'center',editor:{type:'validatebox',options: {required: true,missingMessage:'请输入题目'}} }
	]],
	onAfterEdit: function (rowIndex, rowData, changes) {
        editRow = undefined;				
    },				
    onDblClickRow: function (rowIndex, rowData) {				
        if (editRow != undefined) {
			datagrid.datagrid('endEdit', editRow);				
        }				
        if (editRow == undefined) {				
           datagrid.datagrid('beginEdit', rowIndex);				
            editRow = rowIndex;				
        }				
    },				
    onClickRow: function (rowIndex, rowData) {				
        if (editRow != undefined) {				
           datagrid.datagrid('endEdit', editRow);
		}				
    },
    toolbar: [{ text: '添加', iconCls: 'icon-add', handler: function () {// 添加列表的操作按钮添加，修改，删除等
                    // 添加时先判断是否有开启编辑的行，如果有则把开户编辑的那行结束编辑
                    if (editRow != undefined) {
                        datagrid.datagrid("endEdit", editRow);
                    }
                    // 添加时如果没有正在编辑的行，则在datagrid的第一行插入一行
                    if (editRow == undefined) {
                        datagrid.datagrid("insertRow", {
                            index: 0, // index start with 0
                            row: {

                            }
                        });
                        // 将新插入的那一行开户编辑状态
                        datagrid.datagrid("beginEdit", 0);
                        // 给当前编辑的行赋值
                        editRow = 0;
                    }

                }
                }, '-',
                 { text: '删除', iconCls: 'icon-remove', handler: function () {
                     // 删除时先获取选择行
                     var rows = datagrid.datagrid("getSelections");
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
                 }, '-',
                 { text: '修改', iconCls: 'icon-edit', handler: function () {
                     // 修改时要获取选择到的行
                     var rows = datagrid.datagrid("getSelections");
                     // 如果只选择了一行则可以进行修改，否则不操作
                     if (rows.length == 1) {
                         // 修改之前先关闭已经开启的编辑行，当调用endEdit该方法时会触发onAfterEdit事件
                         if (editRow != undefined) {
                             datagrid.datagrid("endEdit", editRow);
                         }
                         // 当无编辑行时
                         if (editRow == undefined) {
                             // 获取到当前选择行的下标
                             var index = datagrid.datagrid("getRowIndex", rows[0]);
                             // 开启编辑
                             datagrid.datagrid("beginEdit", index);
                             // 把当前开启编辑的行赋值给全局变量editRow
                             editRow = index;
                             // 当开启了当前选择行的编辑状态之后，
                             // 应该取消当前列表的所有选择行，要不然双击之后无法再选择其他行进行编辑
                             datagrid.datagrid("unselectAll");
                         }
                     }
                 }
                 }, '-',
                 { text: '保存', iconCls: 'icon-save', handler: function () {
                     // 保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
                     datagrid.datagrid("endEdit", editRow);
                 }
                 }, '-',
                 { text: '取消编辑', iconCls: 'icon-redo', handler: function () {
                     // 取消当前编辑行把当前编辑行罢undefined回滚改变的数据,取消选择的行
                     editRow = undefined;
                     datagrid.datagrid("rejectChanges");
                     datagrid.datagrid("unselectAll");
                 }
                 }, '-'],
});





/* 类管理结束 */
/** ************************************************************************** */
