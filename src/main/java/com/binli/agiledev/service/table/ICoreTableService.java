package com.binli.agiledev.service.table;
 
import java.util.List;

import com.binli.agiledev.dao.model.VProDbTabTree;
import com.binli.agiledev.model.json.VProDbTabTreeJson;
import com.binli.agiledev.model.json.tablestruct.EasyuiPropertygridJsonResponse;
import com.binli.agiledev.model.vo.TCoreDbExt;
import com.binli.agiledev.model.vo.TCoreTableExt;


 
public interface ICoreTableService {
public int add( TCoreTableExt tCoreTable);
public List<TCoreDbExt> get();

public  VProDbTabTreeJson list();
public List<EasyuiPropertygridJsonResponse> get(int id);
}
