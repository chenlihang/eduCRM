package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.DataDictionary;
import cn.wolfcode.crm.query.QueryObjects;

import java.util.List;

public interface DataDictionaryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DataDictionary entity);

    DataDictionary selectByPrimaryKey(Long id);

    List<DataDictionary> selectAll();

    int updateByPrimaryKey(DataDictionary entity);
    int queryCount(QueryObjects qo);

    List<?> queryList(QueryObjects qo);
}