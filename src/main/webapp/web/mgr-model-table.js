<%@page pageEncoding="UTF-8"%>

					/* 表属性propertygrid开始 */

					$("#table_struct").propertygrid(
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
					/* 表属性propertygrid结束 */
					/** ************************************************************************** */
					
					
					/** ************************************************************************** */
					/* 表管理开始 */
					
					
					/* 表字段显示的datagrid的数据操作和绑定 */
					var editRow = undefined;
					var editRow_table = undefined;
					
					var fieldType = [{ "value": "int", "text": "int" }, { "value": "double", "text": "double" }, { "value": "nvarchar", "text": "nvarchar" }];
 					var datagrid_table=$("#table_column_dg");// 表字段的描述
 					datagrid_table.datagrid({
						
						
						singleSelect:true,
						idField:'itemid',
						url:'/datagrid_data.json',
						columns:[[
							{field:'itemid',title:'字段索引',width:60},
							{field:'productid',title:'字段名称',width:100,editor:{type:'validatebox',options: {required: true,missingMessage:'请输入字段名称'}}},
							{field:'listprice',title:'类型',width:80,align:'right',editor: { type: 'combobox', options: { data: fieldType, valueField: "value", textField: "text" } }},
							{field:'unitcost',title:'默认值',width:80,align:'right',editor:{type:'validatebox',options: {required: true,missingMessage:'请输入默认值'}} },
							{field:'attr1',title:'允许空1',width:50, 
								formatter:function (value, row, index) {
							 
									var s = '<input name="isShow" type="checkbox" onclick="clk()"/> '; 
				                    return s;  
			                	}
							},
							{field:'action',title:'描述', align:'center',editor:{type:'validatebox',options: {required: true,missingMessage:'请输入题目'}} }
						]],
						onAfterEdit: function (rowIndex, rowData, changes) {
				            editRow_table = undefined;			
				            $("#agile_field_select").dialog('close');		
				        },				
				        onDblClickRow: function (rowIndex, rowData) {				
				            if (editRow_table != undefined) {
				            	datagrid_table.datagrid('endEdit', editRow_table);		
				            	console.log(123);
				            	 
				            }				
				            if (editRow_table == undefined) {				
				            	datagrid_table.datagrid('beginEdit', rowIndex);				
				                editRow_table = rowIndex;				
				                console.log(rowData);
				                
				                var ed = $(this).datagrid('getEditor', {index:rowIndex,field:'productid'});
				                var p=$(ed.target).closest('td[field]');//编辑器容器
				                //p.html('<div id="p" class="easyui-panel"  style="width:500px;height:150px;padding:10px;background:#fafafa;" >  </div>');//删除原来的编辑器
				                      
				                $("#agile_field_select").dialog('open');		
				                
				                
				                
				            }			 
				        },				
				        onClickRow: function (rowIndex, rowData) {				
				            if (editRow_table != undefined) {				
				            	datagrid_table.datagrid('endEdit', editRow_table);
							}				
				        },
				        toolbar: [{ text: '添加', iconCls: 'icon-add', handler: function () {// 添加列表的操作按钮添加，修改，删除等
					                    // 添加时先判断是否有开启编辑的行，如果有则把开户编辑的那行结束编辑
					                    if (editRow_table != undefined) {
					                    	datagrid_table.datagrid("endEdit", editRow_table);
					                    }
					                    // 添加时如果没有正在编辑的行，则在datagrid的第一行插入一行
					                    if (editRow_table == undefined) {
					                    	datagrid_table.datagrid("insertRow", {
					                            index: 0, // index start with
															// 0
					                            row: {
					
					                            }
					                        });
					                        // 将新插入的那一行开户编辑状态
					                        datagrid_table.datagrid("beginEdit", 0);
					                        // 给当前编辑的行赋值
					                        editRow_table = 0;
					                    }
					
					                }
					                }, '-',
					                 { text: '删除', iconCls: 'icon-remove', handler: function () {
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
					                 }, '-',
					                 { text: '修改', iconCls: 'icon-edit', handler: function () {
					                     // 修改时要获取选择到的行
					                     var rows = datagrid_table.datagrid("getSelections");
					                     // 如果只选择了一行则可以进行修改，否则不操作
					                     if (rows.length == 1) {
					                         // 修改之前先关闭已经开启的编辑行，当调用endEdit该方法时会触发onAfterEdit事件
					                         if (editRow_table != undefined) {
					                        	 datagrid_table.datagrid("endEdit", editRow_table);
					                         }
					                         // 当无编辑行时
					                         if (editRow_table == undefined) {
					                             // 获取到当前选择行的下标
					                             var index = datagrid_table.datagrid("getRowIndex", rows[0]);
					                             // 开启编辑
					                             datagrid_table.datagrid("beginEdit", index);
					                             // 把当前开启编辑的行赋值给全局变量editRow_table
					                             editRow_table = index;
					                             // 当开启了当前选择行的编辑状态之后，
					                             // 应该取消当前列表的所有选择行，要不然双击之后无法再选择其他行进行编辑
					                             datagrid_table.datagrid("unselectAll");
					                         }
					                     }
					                 }
					                 }, '-',
					                 { text: '保存', iconCls: 'icon-save', handler: function () {
					                     // 保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
					                     datagrid_table.datagrid("endEdit", editRow_table);
					                     var arr=$("#table_struct").propertygrid("getData");
					                     var value=arr.rows[0].value; 
					                     alert(value);
					                     
					                 }
					                 }, '-',
					                 { text: '取消编辑', iconCls: 'icon-redo', handler: function () {
					                     // 取消当前编辑行把当前编辑行罢undefined回滚改变的数据,取消选择的行
					                     editRow_table = undefined;
					                     datagrid_table.datagrid("rejeadfctChanges");
					                     datagrid_table.datagrid("unselectAll");
					                 }
					                 }, '-']
					});
					
				    $('#mgr_table').treegrid({
				        url:'/test.json',
				        idField:'id',
				        treeField:'db_nam',
				        columns:[[
				            {title:'数据库名称',field:'db_nam',width:180},
				            {field:'pro_nam',title:'项目名称',width:60,align:'right'},
				            {field:'obj_nam',title:'对象名称',width:60,align:'right'},
				           
				            {field:'obj_type',title:'创建新表',
				            formatter:function(value,rowData,rowIndex){
				            	
				            	if(rowData.state=='open'){
				            		return '<a href="#">创建表</a>';
				            	}
				            	
				            	return '<a href="#"> 编辑</a>|<a href="#"> 删除</a>';
				            
				            },width:60,align:'right'},
				            {field:'obj_comment',title:'描述',width:160,align:'right'}
				        ]],
				        
				        toolbar: [{ text: '添加1', iconCls: 'icon-add', handler: function () {// 添加列表的操作按钮添加，修改，删除等
					                   // alert(12);
				        
				        			var a=[{
				        	            "itemid":25,
				        	            "productid":"112",
				        	            "listprice":"int",
				        	            "unitcost":"user",
				        	            "attr1":"这个东西怎么样",
				        	             "status":"1",
				        	            "action":"www.ddddd"
				        	        },
				        	                {
				        	            "itemid":26,
				        	            "productid":"113",
				        	            "listprice":"int",
				        	            "unitcost":"user",
				        	            "attr1":"我们好好说",
				        	             "status":"1",
				        	            "action":"www.dddd.com"
				        	        },
				        	                {
				        	            "itemid":27,
				        	            "productid":"151",
				        	            "listprice":"int",
				        	            "unitcost":"user",
				        	            "attr1":"考虑看到了dddd等级",
				        	             "status":"1",
				        	            "action":"www.dd.com"
				        	        }];
				        
				        
				         
				        
				        
				        
					                    $('#table_column_dg').datagrid('loadData', a);
					                }
					                }, '-',
					                 { text: '删除', iconCls: 'icon-remove', handler: function () {
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
					
					
					
					/* 表管理结束 */
					/** ************************************************************************** */
				    /* 域选择器窗口最大最小化控制开始 */
				    parentFn.max_agile_field_select=function(){
				    	  
				    	 $('#agile_field_select').dialog('maximize');	 
				    }
				    
				    
				    
				    /* 域选择器窗口最大最小化控制结束 */
				    
				   
				    
				    
				    
				    
				    
				    
				    