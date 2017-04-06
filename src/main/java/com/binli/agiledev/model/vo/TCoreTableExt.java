package com.binli.agiledev.model.vo;

import java.util.List;

import com.binli.agiledev.dao.model.TCoreColumn;
import com.binli.agiledev.dao.model.TCoreTable;
/**
 * 该类继承了表的属性并实现了表对应的列的属性信息
 * @author lenovo
 *
 */
public class TCoreTableExt extends TCoreTable{
	
	private List<TCoreColumn> tCoreColumn;
	
   

	public List<TCoreColumn> gettCoreColumn() {
		return tCoreColumn;
	}

	public void settCoreColumn(List<TCoreColumn> tCoreColumn) {
		this.tCoreColumn = tCoreColumn;
	}
}