package com.binli.agiledev.controller;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.binli.agiledev.dao.model.TableColumn;
 
@Scope("prototype")//保证该类多例
@Controller
@RequestMapping("/coretablecolumn")
public class CoreTableColumnCtl extends BaseCtl{
 
	@ResponseBody
	@RequestMapping("/aa")
	public String aa(@RequestBody List<TableColumn> requestBody) { 
		
		
		System.out.println(requestBody.size());
		
		return null;
	}

}
