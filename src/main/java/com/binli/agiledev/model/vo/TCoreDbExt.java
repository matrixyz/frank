package com.binli.agiledev.model.vo;

import com.binli.agiledev.dao.model.TCoreDb;

public class TCoreDbExt extends TCoreDb {
	private String proName;
	private int proId;

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	 
}
