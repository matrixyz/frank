package com.binli.agiledev.model.vo;

import java.util.List;

import com.binli.agiledev.dao.model.TCoreColumn;
import com.binli.agiledev.dao.model.TCoreTable;

public class TCoreTableExt extends TCoreTable{
	
	private List<TCoreColumn> tCoreColumn;
	
   

	public List<TCoreColumn> gettCoreColumn() {
		return tCoreColumn;
	}

	public void settCoreColumn(List<TCoreColumn> tCoreColumn) {
		this.tCoreColumn = tCoreColumn;
	}
}