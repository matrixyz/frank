package com.binli.agiledev.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.binli.agiledev.dao.model.TCoreColumn;
import com.binli.agiledev.model.vo.TCoreDbExt;
import com.binli.agiledev.model.vo.TCoreTableExt;
import com.binli.agiledev.service.table.ICoreTableService;
import com.binli.agiledev.util.Message;
 
@Scope("prototype")//保证该类多例
@Controller
@RequestMapping("/coretablecolumn")
public class CoreTableColumnCtl extends BaseCtl{
	
	@Autowired
	public ICoreTableService iCoreTableService;
	
	/**
	 * 添加表属性信息和字段信息到数据库中
	 * @param tCoreTableExt
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public String add(@RequestBody TCoreTableExt tCoreTableExt) { 
		
		/*TCoreTableExt tCoreTableExt=new TCoreTableExt();
		tCoreTableExt.setComment("注释");
		tCoreTableExt.setCreTim(new Date());
		tCoreTableExt.setDbId("1");
		tCoreTableExt.setTabName("users");
		tCoreTableExt.settCoreColumn(requestBody );*/
		
		tCoreTableExt.setDbId(1);
		iCoreTableService.add(tCoreTableExt);
		
		printJsonObj(new Message("添加成功!"));
		System.out.println(iCoreTableService);
		System.out.println(tCoreTableExt);
		
		return null;
	}
	@ResponseBody
	@RequestMapping("/b")
	public String  b( HttpServletRequest req,HttpServletResponse res) { 
		
	
		setReqAndRes(req,res);
		List<TCoreDbExt>  t=iCoreTableService.get();
		printJsonArr(t);
		System.out.println("xxxxxx");
		 
		
		return null;
	}
	

}
