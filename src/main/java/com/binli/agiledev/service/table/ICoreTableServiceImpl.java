package com.binli.agiledev.service.table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.binli.agiledev.dao.mapper.TCoreColumnMapper;
import com.binli.agiledev.dao.mapper.TCoreTableMapper;
import com.binli.agiledev.dao.model.TCoreColumn;
import com.binli.agiledev.model.vo.TCoreTableExt;

@Service("iCoreTableService") //这个参数要和对应的 消费者 controller 的autowared  组件的 变量名一致
public class ICoreTableServiceImpl implements ICoreTableService {
	@Autowired
	private TCoreTableMapper tCoreTableMapper;
	@Autowired
	private TCoreColumnMapper tCoreColumnMapper;
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

}
