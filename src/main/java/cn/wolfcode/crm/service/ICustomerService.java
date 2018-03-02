package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Customer;
import cn.wolfcode.crm.domain.DataDictionary;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface ICustomerService {
    int deleteByPrimaryKey(Long id);

    int insert(Customer entity);

    int saveOrUpdate(Customer entity);

    Customer selectByPrimaryKey(Long id);

    List<Customer> selectAll();

    int updateByPrimaryKey(Customer entity);

    PageResults query(QueryObjects qo);

    List<DataDictionary> getDataDictionaryItemList1();

}
