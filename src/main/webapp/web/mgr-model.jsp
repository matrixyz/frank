<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
	<title>like a man</title>
	<link rel="stylesheet" type="text/css"
		href="/testa/js/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/testa/js/easyui/themes/icon.css">
			<style type="text/css">
html, body {
	height: 100%;
	margin: 0 auto;
}
</style>
			<script type="text/javascript" src="/testa/js/easyui/jquery.min.js"></script>
			<script type="text/javascript" src="/testa/js/easyui/jquery.easyui.min.js"></script>
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
					//var products= {"TableTennis","Basketball","Swimming","Athletics"};
					 var editRow = undefined;
					  var Address = [{ "value": "1", "text": "CHINA" }, { "value": "2", "text": "USA" }, { "value": "3", "text": "Koren" }];
 					var datagrid=$("#tt");
					datagrid.datagrid({
						
						
						singleSelect:true,
						idField:'itemid',
						url:'/testa/datagrid_data.json',
						columns:[[
							{field:'itemid',title:'字段索引',width:60},
							{field:'productid',title:'字段名称',width:100},
							{field:'listprice',title:'类型',width:80,align:'right'},
							{field:'unitcost',title:'默认值',width:80,align:'right' },
							{field:'attr1',title:'允许空',width:150, editor: { type: 'combobox', options: { data: Address, valueField: "value", textField: "text" } }},
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
				        toolbar: [{ text: '添加', iconCls: 'icon-add', handler: function () {//添加列表的操作按钮添加，修改，删除等
					                    //添加时先判断是否有开启编辑的行，如果有则把开户编辑的那行结束编辑
					                    if (editRow != undefined) {
					                        datagrid.datagrid("endEdit", editRow);
					                    }
					                    //添加时如果没有正在编辑的行，则在datagrid的第一行插入一行
					                    if (editRow == undefined) {
					                        datagrid.datagrid("insertRow", {
					                            index: 0, // index start with 0
					                            row: {
					
					                            }
					                        });
					                        //将新插入的那一行开户编辑状态
					                        datagrid.datagrid("beginEdit", 0);
					                        //给当前编辑的行赋值
					                        editRow = 0;
					                    }
					
					                }
					                }, '-',
					                 { text: '删除', iconCls: 'icon-remove', handler: function () {
					                     //删除时先获取选择行
					                     var rows = datagrid.datagrid("getSelections");
					                     //选择要删除的行
					                     if (rows.length > 0) {
					                         $.messager.confirm("提示", "你确定要删除吗?", function (r) {
					                             if (r) {
					                                 var ids = [];
					                                 for (var i = 0; i < rows.length; i++) {
					                                     ids.push(rows[i].ID);
					                                 }
					                                 //将选择到的行存入数组并用,分隔转换成字符串，
					                                 //本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
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
					                     //修改时要获取选择到的行
					                     var rows = datagrid.datagrid("getSelections");
					                     //如果只选择了一行则可以进行修改，否则不操作
					                     if (rows.length == 1) {
					                         //修改之前先关闭已经开启的编辑行，当调用endEdit该方法时会触发onAfterEdit事件
					                         if (editRow != undefined) {
					                             datagrid.datagrid("endEdit", editRow);
					                         }
					                         //当无编辑行时
					                         if (editRow == undefined) {
					                             //获取到当前选择行的下标
					                             var index = datagrid.datagrid("getRowIndex", rows[0]);
					                             //开启编辑
					                             datagrid.datagrid("beginEdit", index);
					                             //把当前开启编辑的行赋值给全局变量editRow
					                             editRow = index;
					                             //当开启了当前选择行的编辑状态之后，
					                             //应该取消当前列表的所有选择行，要不然双击之后无法再选择其他行进行编辑
					                             datagrid.datagrid("unselectAll");
					                         }
					                     }
					                 }
					                 }, '-',
					                 { text: '保存', iconCls: 'icon-save', handler: function () {
					                     //保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
					                     datagrid.datagrid("endEdit", editRow);
					                 }
					                 }, '-',
					                 { text: '取消编辑', iconCls: 'icon-redo', handler: function () {
					                     //取消当前编辑行把当前编辑行罢undefined回滚改变的数据,取消选择的行
					                     editRow = undefined;
					                     datagrid.datagrid("rejectChanges");
					                     datagrid.datagrid("unselectAll");
					                 }
					                 }, '-'],
					});

					window.onload = function() {
					    $('#ttx').treegrid({
					        url:'/testa/test.json',
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
			iconCls="icon-cancel">管理类</a> <a href="#" class="easyui-linkbutton"
			plain="true" iconCls="icon-reload">管理表</a> <a href="#"
			class="easyui-linkbutton" plain="true" iconCls="icon-search">选择数据源</a>
		<a href="#" class="easyui-linkbutton" plain="true">text button</a> <a
			href="#" class="easyui-linkbutton" plain="true" iconCls="icon-print">Print</a>
		<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-help"></a>
		<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-save"></a>
		<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-back"></a>
	</div>

	<div id="tt_tabs" class="easyui-tabs"   fit="true">
		<div title="创建表"    style="padding: 10px;" >
			<div  class="easyui-layout" data-options="fit:true">
				<div  region="west" style="width:50%;" >
					    <table title="项目表"  id="ttx" fit="true" border="0"></table>  
				</div>
				<div  region="center"  style="padding-left:5px;border:0px;" >
					
					<div  class="easyui-layout" data-options="fit:true">
						<div  region="north"  style="height:30%;border:0px;">
					    	<table   class="easyui-propertygrid" fit="true"
					                url="/testa/property-grid.json"
					                showGroup="true" scrollbarSize="0"></table>
						</div>
						<div  region="center" style="height:70%;border:0px;"  >
					    	 <table id="tt" class="easyui-datagrid"   fit="true" ></table> 
						</div>
					</div>
				</div>
			</div>
		</div>
		<div title="Second Tab" closable="true" style="padding: 10px;">
			Second Tab</div>
		<div title="Third Tab" iconCls="icon-reload" closable="true"
			style="padding: 10px;">Third Tab</div>
	</div>
	
</body>
</html>
