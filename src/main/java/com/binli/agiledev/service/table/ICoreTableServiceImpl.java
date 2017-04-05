package com.binli.agiledev.service.table;

import org.springframework.beans.factory.annotation.Autowired;

import com.binli.agiledev.dao.mapper.TCoreColumnMapper;
import com.binli.agiledev.dao.mapper.TCoreTableMapper;
import com.binli.agiledev.dao.model.TCoreColumn;
import com.binli.agiledev.model.vo.TCoreTableExt;

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
