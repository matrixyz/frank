package com.binli.agiledev.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 
import com.binli.agiledev.dao.model.User;
import com.binli.agiledev.dao.mapper.*;
import com.binli.agiledev.util.PageBean;
 
@Scope("prototype")//保证该类多例
@Controller
@RequestMapping("/user")
public class UserCtl extends BaseCtl{


	 
	@Autowired
	private UserMapper userMapper;//注入dao
	@RequestMapping("/login")
	public String login() {
		User user=(User)param(User.class);
		user.setId(0);
		if (cusRegValidata(user)) {
			  
			User userLog =userMapper.userLogin(user.getName(),user.getPwd());
			if (userLog!=null&&userLog.getId()>0) {
				getSess().setAttribute("User", userLog);
				return "user-center";
			} else {
				setMsg("用户名或密码错误");
				return "index";
			}
		}

		return "index";
	}
	public boolean cusRegValidata(User cus) {

		if (strUtl.isBlank(cus.getName())) {
			setMsg("用户名不能为空!");
			return false;
		}
		if (strUtl.isBlank(cus.getPwd())) {
			setMsg("密码不能为空!");
			return false;
		}

		return true;
	}
	 
	
	 
	@RequestMapping("/loginOut")
	public String loginOut() {

		getSess().invalidate();

		return "cus-login";
	}
	@RequestMapping("/query")
	public String query() {
		PageBean pageBean=(PageBean)param(PageBean.class);
		if(pageBean.getCurrentPage()==0){
			setParam("currentPage",1);
			
		} 
		
		User cus = null;
		cus = (User) param(User.class);
		 
		float start, end;
		if (getParam("staccount") == null || getParam("staccount").equals("")) {
			start = 0;
		} else {

			start = Float.parseFloat(getParam("staccount"));
		}
		if (getParam("endaccount")  == null || getParam("endaccount").equals("")) {

			end = 0;
		} else {

			end = Float.parseFloat(getParam("endaccount"));
		}
		pageBean.setPagesize(10);
		pageBean.setCount(userMapper.queryPageTotal(cus));
		
		System.out.println(pageBean.getCount());
		
		List<User>  cusLs=userMapper.queryPage(cus,pageBean);
		setParam("pb",pageBean);
		setParam("cusLs",cusLs);
		return "mgr-cus-query";
	}

	@RequestMapping("/aa")
	public String aa() {//这个方法查询的结果集是一个list<map>类型的结果
		List<Map<String ,Object>> ls=userMapper.selectAll();
		printJsonArr(ls);
		
		return null;
	}

}
