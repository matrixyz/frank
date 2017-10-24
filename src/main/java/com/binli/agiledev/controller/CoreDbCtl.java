package com.binli.agiledev.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

 
import com.binli.agiledev.model.vo.TCoreDbExt;
import com.binli.agiledev.model.vo.TCoreTableExt;
import com.binli.agiledev.service.table.ICoreDbService;
 
 
@Scope("prototype")//保证该类多例
@Controller
@RequestMapping("/coredb")
public class CoreDbCtl extends BaseCtl{
	
	@Autowired
	public ICoreDbService iCoreDbService;
	
	@ResponseBody
	@RequestMapping("/add")
	public String add(@RequestBody TCoreTableExt tCoreTableExt) {  
		Map a=new HashMap();
		return null;
	}
	@ResponseBody
	@RequestMapping("/select")
	public String  select( ) { 
	  
		List<TCoreDbExt>  t=iCoreDbService.get();
		printJsonArr(t); 
		
		return null;
	}

}
