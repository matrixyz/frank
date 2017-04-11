package com.binli.agiledev.dao.mapper;


import com.binli.agiledev.dao.model.TCoreColumn;

public interface TCoreDBMapper {
     
    TCoreColumn selectByPrimaryKey(Integer colId);
 
}