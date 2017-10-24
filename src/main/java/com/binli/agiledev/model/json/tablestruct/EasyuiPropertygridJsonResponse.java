package com.binli.agiledev.model.json.tablestruct;

import java.util.List;

import com.binli.agiledev.dao.model.TCoreTable;

/**
 * 包装表结构的vo类，将表结构信息封装为 easyui propertygrid 可以识别的数据，然后输出到前端的easyui propertygrid组件
 * 具体包赚的结构如下面json数据所示 [ {"name":"表名","value":"Bill
	[
		{"name":"表名","value":"Bill Smith","fieldName":"tabName","group":"基本信息","editor":"text"},
		{"name":"类型","value":"MyISAM","fieldName":"tabType","group":"基本信息","editor":{
			"type":"combobox",
			"options":{ "data": [{"value":"MyISAM", "text": "MyISAM" },{ "value":"InnoDB", "text": "InnoDB"}], "panelHeight": "auto"
			}
		}},
		{"name":"字符集","value":"UTF-8","fieldName":"charset","group":"基本信息","editor":{
			"type":"combobox",
			"options":{ "data": [{"value":"UTF-8", "text": "UTF-8" },{ "value":"GBK", "text": "GBK"},{ "value":"GB2312", "text": "GB2312"}], "panelHeight": "auto"
			}
		}},
		{"name":"创建日期","value":"2016-09-09","fieldName":"creTim","group":"基本信息","editor":"datebox"},
		{"name":"备注", "group":"基本信息","fieldName":"comment","editor":"text"},
		 
		{"name":"所属行业","value":"金融","fieldName":"industry","group":"索引","editor":{
			"type":"combobox",
			"options":{ "data": 
			[	{"value":"金融", "text": "金融" },
				{ "value":"医疗", "text": "医疗"},
				{ "value":"保险", "text": "保险"}], "panelHeight": "auto"
			}
		}},
		{"name":"所属业务","value":"会员管理","fieldName":"belongBuss","group":"索引","editor":{
			"type":"combobox",
			"options":{ "data": 
			[	{"value":"会员管理", "text": "会员管理" },
				{ "value":"用户注册", "text": "用户注册"},
				{ "value":"用户权限", "text": "用户权限"}], "panelHeight": "auto"
			}
		}}
	]
 */
public class EasyuiPropertygridJsonResponse {
	 
	public EasyuiPropertygridJsonResponse( ){
		
	}
	private String name;

	private String value;

	private String fieldName;

	private String group;

	private Editor editor;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldName() {
		return this.fieldName;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getGroup() {
		return this.group;
	}

	public void setEditor(Editor editor) {
		this.editor = editor;
	}

	public Editor getEditor() {
		return this.editor;
	}
	 

}


