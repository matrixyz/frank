package com.binli.agiledev.controller;
import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.binli.agiledev.service.table.ICoreTableService;


/**
 * @author  
 * 2015-4-7
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"classpath*:/applicationContext.xml","classpath*:/springmvc-servlet.xml"})
public class TestCoreTableCtl {
	// 模拟request,response  
    private MockHttpServletRequest request;  
    private MockHttpServletResponse response;   
      
    // 注入CoreTableCtl  
    @Autowired  
    private CoreTableCtl coreTableCtl ;  
    
    //@Autowired
	public ICoreTableService iCoreTableService;
    // 执行测试方法之前初始化模拟request,response  
    @Before    
    public void setUp(){    
        request = new MockHttpServletRequest();      
        request.setCharacterEncoding("UTF-8");      
        response = new MockHttpServletResponse();      
    }         
    /** 
     *  
     * @Title：testList
     * @Description: 测试获取视图  v_pro_db_tab_tree 中的数据
     */  
    @Test  
    public void testList() {   
        try {  
        	 
          // assertEquals("v_pro_db_tab_tree",coreTableCtl.list(request,response )) ;  
           assertEquals("hello",coreTableCtl.get( 2)) ;  
        	System.out.println(iCoreTableService);
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
}
