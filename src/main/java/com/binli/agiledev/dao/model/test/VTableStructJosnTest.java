package com.binli.agiledev.dao.model.test;

import java.util.ArrayList;
import java.util.List;

import com.binli.agiledev.model.json.tablestruct.Data;
import com.binli.agiledev.model.json.tablestruct.EasyuiPropertygridJsonResponse;
import com.binli.agiledev.model.json.tablestruct.Editor;
import com.binli.agiledev.model.json.tablestruct.Options;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class VTableStructJosnTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EasyuiPropertygridJsonResponse vt=new EasyuiPropertygridJsonResponse();
		vt.setFieldName("tabName");  
		vt.setName("表名");
		vt.setGroup("基本信息");
		vt.setValue("Bill Smith");
		Options op = new Options();
		List<Data> data=new ArrayList<Data>();
		Data da = new Data();   
		da.setText("金融");
		da.setValue("金融");
		Data da1 = new Data();   
		da.setText("医疗");
		da.setValue("医疗");
		data.add(da1);
		data.add(da);
		op.setData(data);
		Editor ed=new Editor();
		ed.setOptions(op);
		ed.setType("combobox");
		vt.setEditor(ed );
		
		
		List<EasyuiPropertygridJsonResponse> ls=new ArrayList<EasyuiPropertygridJsonResponse>();
		ls.add(vt);
		ls.add(vt);
		
		
		 //JSONObject jsObject = JSONObject.fromObject( ls);
		 JSONArray jsArray = JSONArray.fromObject(ls);
		 System.out.println(jsArray.toString());
	}

}
