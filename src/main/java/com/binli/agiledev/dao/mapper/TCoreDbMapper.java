package com.binli.agiledev.dao.mapper;

import java.util.List;

import com.binli.agiledev.dao.model.TCoreDb;
import com.binli.agiledev.model.vo.TCoreDbExt;

public interface TCoreDbMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_core_db
     *
     * @mbggenerated Fri Apr 14 21:33:24 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_core_db
     *
     * @mbggenerated Fri Apr 14 21:33:24 CST 2017
     */
    int insert(TCoreDb record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_core_db
     *
     * @mbggenerated Fri Apr 14 21:33:24 CST 2017
     */
    int insertSelective(TCoreDb record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_core_db
     *
     * @mbggenerated Fri Apr 14 21:33:24 CST 2017
     */
    TCoreDb selectByPrimaryKey(Integer id);
    List<TCoreDbExt> selectList( );

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_core_db
     *
     * @mbggenerated Fri Apr 14 21:33:24 CST 2017
     */
    int updateByPrimaryKeySelective(TCoreDb record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_core_db
     *
     * @mbggenerated Fri Apr 14 21:33:24 CST 2017
     */
    int updateByPrimaryKey(TCoreDb record);
}