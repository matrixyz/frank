package com.binli.agiledev.service.table;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.binli.agiledev.dao.mapper.TCoreColumnMapper;
import com.binli.agiledev.dao.mapper.TCoreDbMapper;
import com.binli.agiledev.dao.mapper.TCoreTableMapper;
import com.binli.agiledev.dao.mapper.VProDbTabTreeMapper;
import com.binli.agiledev.dao.model.TCoreColumn;
import com.binli.agiledev.dao.model.TCoreTable;
import com.binli.agiledev.dao.model.VProDbTabTree;
import com.binli.agiledev.model.json.VProDbTabTreeJson;
import com.binli.agiledev.model.json.tablestruct.EasyuiPropertygridJsonResponse;
import com.binli.agiledev.model.json.tablestruct.IEasyuiPropertygridJsonResponseAdapter;
import com.binli.agiledev.model.json.tablestruct.IEasyuiPropertygridJsonResponseAdapterImpl;
import com.binli.agiledev.model.vo.TCoreDbExt;
import com.binli.agiledev.model.vo.TCoreTableExt;

@Service("iCoreTableService") //这个参数要和对应的 消费者 controller 的autowared  组件的 变量名一致
public class ICoreTableServiceImpl implements ICoreTableService {
	@Autowired
	private TCoreTableMapper tCoreTableMapper;
	@Autowired
	private TCoreColumnMapper tCoreColumnMapper;
	@Autowired
	private TCoreDbMapper tCoreDbMapper;
	@Autowired
	private VProDbTabTreeMapper vProDbTabTreeMapper;
	
	@Override
	public int add(TCoreTableExt tCoreTableExt) {
		// TODO Auto-generated method stub
		tCoreTableMapper.insert(tCoreTableExt);	
		int tab_id=tCoreTableExt.getTabId();
		for(TCoreColumn t:tCoreTableExt.gettCoreColumn()){
			t.setTabId(tab_id);
		}
		tCoreColumnMapper.insertByBatch(tCoreTableExt.gettCoreColumn() );
		
		
		
		
		
		return 1;
	}
	@Override
	public List<TCoreDbExt> get() {
		// TODO Auto-generated method stub
		
		  return tCoreDbMapper.selectList();
		 
		 
	}
	/**
	 * 查询出对应的从项目到数据库到表的包含父子级关系的数据到集合中，
	 * 获取easyui  的treegrid需要的相应 的数据
	 */
	public  VProDbTabTreeJson  list() {
		// 查询出对应的从项目到数据库到表的包含父子级关系的数据到集合中
		List<VProDbTabTree> res= vProDbTabTreeMapper.selectList();
		for(VProDbTabTree v: res){
			if("pro".equals(v.getObjType())){
				 //这样做是为了让easyui  的treegrid   顶级  节点的  _parentId 的值在json中输出位 "" 否则会 造成 treegrid不显示数据
				v.set_parentId(""); 
			}else{
				v.set_parentId(v.getPid());
			}
			
			v.setState("closed");
		}
		//封装res 到  vp对象 是为了输出相应格式的JSON数据
		VProDbTabTreeJson vp=new VProDbTabTreeJson();
		vp.setRows(res);
		vp.setTotal(res.size());
		return vp;
	}
	@Autowired
	private IEasyuiPropertygridJsonResponseAdapter easy;
	@Override
	public List<EasyuiPropertygridJsonResponse> get(int id) {
		// TODO Auto-generated method stub
		TCoreTable tCoreTable =tCoreTableMapper.selectByPrimaryKey(id);
		easy.init(tCoreTable);
		
		
		return easy.get();
	}

}
