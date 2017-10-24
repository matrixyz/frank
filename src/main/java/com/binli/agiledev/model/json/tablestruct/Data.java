package com.binli.agiledev.model.json.tablestruct;

import java.util.List;

import org.springframework.stereotype.Component;

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
@Component  
	public class  Data {
		private String value;
		
		private String text;
		public Data( ) {
			 
		}
		public Data(String value, String text) {
			super();
			this.value = value;
			this.text = text;
		}

		public void setValue(String value) {
			this.value = value;
		}
		
		public String getValue() {
			return this.value;
		}
		
		public void setText(String text) {
			this.text = text;
		}
		
		public String getText() {
			return this.text;
		}
		
	}

 


