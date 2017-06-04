package com.binli.agiledev.util;

public class Message {
public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
private String msg;
private String code;
public Message(String msg) {
	 
	this.msg = msg;
}

}
