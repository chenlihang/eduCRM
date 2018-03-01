package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.DataDictionaryItem;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IDataDictionaryItemService {
    void saveOrUpdate(DataDictionaryItem entity);

    void delete(Long id);

    DataDictionaryItem get(Long id);

    List<DataDictionaryItem> list();

    List<DataDictionaryItem> selectItemByParentSn(String var1);

    PageResults query(QueryObjects qo);
}