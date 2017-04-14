package com.binli.agiledev.controller;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.binli.agiledev.util.JSONUtils;

 

public class BaseCtl {
	static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	static SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	static StringUtils strUtl = new StringUtils();
	private String msg;


	public static final String ERROR="error";
	 @Autowired
	protected HttpServletRequest request; 
	 @Autowired
    protected HttpServletResponse response; 
    protected HttpSession session; 
     
    @ModelAttribute 
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){ 
        this.request = request; 
        this.response = response; 
        this.session = request.getSession(); 
    } 
	
	public ModelAndView mav(String path){
		return new ModelAndView(path);
	}
	Map<String ,Object> resParm=new HashMap<String ,Object>();
	public HttpServletRequest request() {
		return this.request;
	}
	public Timestamp getCretim(){
		return new Timestamp(new Date().getTime());
	}
	public String getParam(String param){
		return request().getParameter(param);
	}
	public void setParam(String param,Object obj){
		 request().setAttribute(param, obj);
	}
	
	public HttpServletResponse response() {
		return this.response;
	}

	public HttpSession getSess() {
		return request().getSession();
	}
	public String pObj(Object str ){
		 
		printJsonObj(str);
		 
		return null;
	}
	public void printJsonObj(Object str ){
		try {
			JSONUtils.printObject(str, response());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void printJsonArr(List list ){
		try {
			JSONUtils.printArray(list, response());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		setParam("msg",msg );
	}

	public boolean isMoney(String str)

	{

		if (str == null) {
			return false;
		}
		java.util.regex.Pattern pattern = java.util.regex.Pattern
				.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$"); // 判断小数点后2位的数字的正则表达式
		java.util.regex.Matcher match = pattern.matcher(str);
		if (match.matches() == false) {
			return false;
		} else {
			return true;
		}

	}

	public boolean isTimestamp(String str) {
		boolean res = false;
		try {
			new Timestamp(dfs.parse(str).getTime());
			res = true;
		} catch (Exception e) {

		}
		return res;
	}
	public static boolean isDate(String str) {
		boolean res = false;
		try {
			df.parse(str);
			res = true;
		} catch (Exception e) {

		}
		return res;
	}
	public Object param(Class cls) {
		Object res = null;
		if (cls != null) {
			try {
				res = cls.newInstance();
				 Field[] fieldlist = cls.getDeclaredFields();
				StringBuffer sb = null;
				String methodName;
				for (int i = 0; i < fieldlist.length; i++) {
					Field fld = fieldlist[i];
					//System.out.println(fld.getName()+"---"+fld.getType().getName());
					sb = new StringBuffer(fld.getName());
					sb.setCharAt(0, Character.toUpperCase(sb.charAt(0)));
					methodName = new StringBuffer("set").append(sb).toString();
					Method test = 
							cls.getDeclaredMethod(methodName,fld.getType());
					Object tt=fieldConvert(fld.getType().toString(),getParam(fld.getName()));
					test.invoke(res,new Object[]{tt});

				}
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return res;
	}

	 

	public Object fieldConvert(String type, String target) {
		Object x = null;
		if (type.endsWith("String")) {
			if(target!=null&&target.trim().equals(""))
			return null;
			else
			return target==null?null:target.trim();	
			
		}
		if (type.endsWith("Integer") || type.endsWith("int")) {
			if (target==null|| !StringUtils.isNumeric(target)) {
				return new Integer("0");
			}
			x= new Integer(target);
		}
		if (type.endsWith("Float") || type.endsWith("float")) {
			if (target==null || !isMoney(target)) {
				return new Float("0");
			}
			return new Float(target);
		}
		if (type.endsWith("Double") || type.endsWith("double")) {
			if (target==null || !isMoney(target)) {
				return new Double("0");
			}
			return new Double(target);
		}
		if (type.endsWith("Timestamp")) {
			if (target==null || !isTimestamp(target)) {
				return new Timestamp(new Date().getTime());
			}
			try {
				return new Timestamp(dfs.parse(target).getTime());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (type.endsWith("Date")) {
			if (target==null || !isDate(target)) {
				return new    Date() ;
			}
			try {
				return df.parse(target);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return x;
	}

}
