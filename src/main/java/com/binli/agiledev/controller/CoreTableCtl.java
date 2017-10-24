package com.binli.agiledev.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

 
import com.binli.agiledev.model.json.VProDbTabTreeJson;
import com.binli.agiledev.model.json.tablestruct.EasyuiPropertygridJsonResponse;
import com.binli.agiledev.service.table.ICoreTableService;
 
@Scope("prototype")//保证该类多例
@Controller
@RequestMapping("/coretable")
public class CoreTableCtl extends BaseCtl{
	
	@Autowired
	public ICoreTableService iCoreTableService;
	
	
	/**
	 * 查询出对应的从项目到数据库到表的包含父子级关系的数据到集合中，
	 * 获取easyui  的treegrid需要的相应 的数据
	 */
	@ResponseBody
	@RequestMapping("/list")
	public String  list( HttpServletRequest req,HttpServletResponse res) { 
		
		
		setReqAndRes(req,res);
		VProDbTabTreeJson t=iCoreTableService.list();
		printJsonObj(t);
		System.out.println("xxxxxx");
		
		
		return null;
	}
	@ResponseBody
	@RequestMapping(value="/get/{id}",method=RequestMethod.GET)
	public List<EasyuiPropertygridJsonResponse> get(@PathVariable("id") int id){
		
		List<EasyuiPropertygridJsonResponse> res=iCoreTableService.get(id); 
		 
		return res;
	}

}
