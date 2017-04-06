package com.binli.agiledev.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.binli.agiledev.dao.model.TCoreColumn;
import com.binli.agiledev.model.vo.TCoreTableExt;
import com.binli.agiledev.service.table.ICoreTableService;
 
@Scope("prototype")//保证该类多例
@Controller
@RequestMapping("/coretablecolumn")
public class CoreTableColumnCtl extends BaseCtl{
	
	@Autowired
	public ICoreTableService iCoreTableService;
	
	@ResponseBody
	@RequestMapping("/aa")
	public String aa(@RequestBody List<TCoreColumn> requestBody) { 
		
		TCoreTableExt tCoreTableExt=new TCoreTableExt();
		tCoreTableExt.setComment("注释");
		tCoreTableExt.setCreTim(new Date());
		tCoreTableExt.setDbId("1");
		tCoreTableExt.setTabName("users");
		tCoreTableExt.settCoreColumn(requestBody );
		
		
		iCoreTableService.add(tCoreTableExt);
		
		
		System.out.println(iCoreTableService);
		System.out.println(requestBody.size());
		
		return null;
	}

}
