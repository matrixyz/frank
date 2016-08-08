package com.binli.agiledev.util;

public class PageBean {
	private int pagesize=10;//每页显示的条数
	private int pagetotal;//总页数
	public int currentPage;//当前第p页
	private int count;//记录总条数
	private int beginCursor;//Mysql分页起始记录
	
	public int getBeginCursor() {
		beginCursor=(currentPage-1)*pagesize;
		return beginCursor;
	}
	public void setBeginCursor(int beginCursor) {
		this.beginCursor = beginCursor;
	}
	public PageBean(){
		pagesize=10;//默认每页显示10条记录
		
	}
	public int getCount() {
		return count;
	}
	 
	public int getCurrentPage() {
		return currentPage;
	}
	 
	public int getPagesize() {
		return pagesize;
	}
	public int getPagetotal() {
		return pagetotal;
	}
	public void setPagetotal(int pagetotal) {
		this.pagetotal=pagetotal;
	}
	//首先执行
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	//其次执行
	public void setCount(int count) {
		this.count = count;
		pagetotal=(int)(Math.ceil(count*1.0/pagesize));
	}
	//最后执行
	public void setCurrentPage(int up) {
		if(up<1)currentPage=1;
		else if(up>pagetotal&&pagetotal>0)currentPage=pagetotal;
		else currentPage=up;
	}
	//获取mysql limit 的第一个参数
	 public int getLimitOne(){
		 if(this.currentPage==0){
			 this.currentPage=1;
		 }
		 return this.pagesize*(this.currentPage-1);
	 }
}
