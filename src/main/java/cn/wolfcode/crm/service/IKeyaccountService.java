package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.DataDictionaryItem;
import cn.wolfcode.crm.domain.Keyaccount;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IKeyaccountService {
    int deleteByPrimaryKey(Long id);

    int insert(Keyaccount entity);

    int saveOrUpdate(Keyaccount entity);

    Keyaccount selectByPrimaryKey(Long id);

//    List<Keyaccount> selectAll();

    List<Keyaccount> selectAll();

    int updateByPrimaryKey(Keyaccount entity);

    PageResults query(QueryObjects qo);

    List<DataDictionaryItem> selectDictionaryItemByDictionarySn(String sn);


    int signContract(Long id,boolean customerStatus);
}
