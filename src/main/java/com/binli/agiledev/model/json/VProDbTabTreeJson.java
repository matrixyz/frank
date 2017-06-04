package com.binli.agiledev.model.json;

import java.util.List;

import com.binli.agiledev.dao.model.VProDbTabTree;

public class VProDbTabTreeJson {
	private int total;
	private List<VProDbTabTree> rows;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<VProDbTabTree> getRows() {
		return rows;
	}
	public void setRows(List<VProDbTabTree> rows) {
		this.rows = rows;
	}

	 

}
