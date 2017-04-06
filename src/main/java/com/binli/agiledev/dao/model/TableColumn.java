package com.binli.agiledev.dao.model;
/**
 * 纯属例子，业务成熟后要删除的内容
 * @author lenovo
 *
 */
public class TableColumn {
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getListprice() {
		return listprice;
	}
	public void setListprice(String listprice) {
		this.listprice = listprice;
	}
	public String getUnitcost() {
		return unitcost;
	}
	public void setUnitcost(String unitcost) {
		this.unitcost = unitcost;
	}
	public String getAttr1() {
		return attr1;
	}
	public void setAttr1(String attr1) {
		this.attr1 = attr1;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private String listprice;
	private int itemid;
	private String productid;
	private String unitcost;
	private String attr1;
	private String status;

}
