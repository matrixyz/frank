package com.binli.agiledev.model.json.tablestruct;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.binli.agiledev.dao.model.TCoreTable;

/**
 * 本类负责将EasyuiPropertygridJsonResponse类 和 TCoreTable 进行组装，生成List<EasyuiPropertygridJsonResponse> 对象，
 * 供com.binli.agiledev.service.table.ICoreTableServiceImpl.get(int id) 方法使用
 */
@Component
public class IEasyuiPropertygridJsonResponseAdapterImpl implements IEasyuiPropertygridJsonResponseAdapter {
	private List<EasyuiPropertygridJsonResponse> res=null;
	private TCoreTable tCoreTable;
	public void init(Object o) {
		 
		this.tCoreTable = (TCoreTable)o;
	}
	 
	@Override
	public void build(){
		tCoreTable.getCharset();
	}
	 
	@Override
	public void buildEasyuiPropertygridJsonResponse(){
		EasyuiPropertygridJsonResponse jsr = new EasyuiPropertygridJsonResponse();
		jsr.setFieldName("tabName");
		jsr.setGroup("基本信息");
		jsr.setName("表名");
		jsr.setValue(tCoreTable.getTabName());
		jsr.setEditor(buildEditor(new String[]{},"text"));
		res.add(jsr);
		
		EasyuiPropertygridJsonResponse jsr1 = new EasyuiPropertygridJsonResponse();
		jsr1.setFieldName("charset");
		jsr1.setGroup("基本信息");
		jsr1.setName("字符集");
		jsr1.setValue(tCoreTable.getCharset());
		jsr1.setEditor(buildEditor(new String[]{"UTF-8","GBK","GB2312"},"combobox"));
		res.add(jsr1);
		
		EasyuiPropertygridJsonResponse jsr2 = new EasyuiPropertygridJsonResponse();
		jsr2.setFieldName("tabType");
		jsr2.setGroup("基本信息");
		jsr2.setName("类型");
		jsr2.setValue(tCoreTable.getTabType());
		jsr2.setEditor(buildEditor(new String[]{"InnoDB","MyISAM" },"combobox"));
		res.add(jsr2);
	}
	 
	@Override
	public Editor buildEditor(String[] data,String editorType){
		Editor ed = new Editor();
		ed.setOptions(buildOptions(data));
		ed.setType(editorType);
		
		return ed;
	}
	 
	@Override
	public Options buildOptions(String[] data){
		Options op = new Options();
		op.setData(buildData(data));
		return op;
	}
	 
	@Override
	public List<Data> buildData(String[] data){
		List<Data> da = new ArrayList<Data>();
		for (String string : data) {
			da.add(new Data(string,string));
		}
		return da;
	}
	 
	@Override
	public List<EasyuiPropertygridJsonResponse> get(){
		res=new ArrayList<EasyuiPropertygridJsonResponse>();
		
		
		return res;
	}

}


