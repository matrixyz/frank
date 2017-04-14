package com.binli.agiledev.service.table;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.binli.agiledev.dao.mapper.TCoreColumnMapper;
import com.binli.agiledev.dao.mapper.TCoreDbMapper;
import com.binli.agiledev.dao.mapper.TCoreTableMapper;
import com.binli.agiledev.dao.model.TCoreColumn;
import com.binli.agiledev.model.vo.TCoreDbExt;
import com.binli.agiledev.model.vo.TCoreTableExt;

@Service("iCoreDbService") //这个参数要和对应的 消费者 controller 的autowared  组件的 变量名一致
public class ICoreDbServiceImpl implements ICoreDbService {
	 
	@Autowired
	private TCoreDbMapper tCoreDbMapper;
	 
	@Override
	public List<TCoreDbExt> get() {
		// TODO Auto-generated method stub
		
		  return tCoreDbMapper.selectList();
		 
		 
	}

}
