package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.DataDictionaryItem;
import cn.wolfcode.crm.query.QueryObjects;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DataDictionaryItemMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DataDictionaryItem entity);

    DataDictionaryItem selectByPrimaryKey(Long id);

    List<DataDictionaryItem> selectAll();

    int updateByPrimaryKey(DataDictionaryItem entity);
    int queryCount(QueryObjects qo);

    List<?> queryList(QueryObjects qo);

    List<DataDictionaryItem> selectItemByParentSn(String var1);

    void deleteByParentId(Long var1);

    DataDictionaryItem getItemByParentSnAndItemName(@Param("sn") String var1, @Param("name") String var2);
}