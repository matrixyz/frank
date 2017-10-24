package com.binli.agiledev.model.json.tablestruct;

import java.util.List;

public interface IEasyuiPropertygridJsonResponseAdapter {
	  void init(Object o);
	void build();

	void buildEasyuiPropertygridJsonResponse();

	Editor buildEditor(String[] data,String editorType);

	Options buildOptions(String[] data);

	List<Data> buildData(String[] data);

	List<EasyuiPropertygridJsonResponse> get();

}