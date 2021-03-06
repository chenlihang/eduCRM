package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.DataDictionaryItem;
import cn.wolfcode.crm.domain.Keyaccount;
import cn.wolfcode.crm.query.QueryObjects;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KeyaccountMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Keyaccount record);

    Keyaccount selectByPrimaryKey(Long id);

    List<Keyaccount> selectAll();

    int updateByPrimaryKey(Keyaccount record);

    int queryCount(QueryObjects qo);

    List<Keyaccount> queryList(QueryObjects qo);

    List<DataDictionaryItem> selectItemByDictionarySn(String sn);

    List<DataDictionaryItem> selectDictionaryItemByDictionarySn(String sn);

    int updateCustomerStatus(@Param("id") Long id,@Param("customerStatus")boolean customerStatus);
}