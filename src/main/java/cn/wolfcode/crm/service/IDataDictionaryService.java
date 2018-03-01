package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.DataDictionary;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IDataDictionaryService {
    void saveOrUpdate(DataDictionary entity);

    void delete(Long id);

    DataDictionary get(Long id);

    List<DataDictionary> list();

    PageResults query(QueryObjects qo);
}