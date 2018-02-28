package cn.wolfcode.crm.service;

import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

public interface ICustomerTransferService {
/*    int deleteByPrimaryKey(Long id);

    int insert(CustomerTransfer entity);

    void saveOrUpdate(CustomerTransfer entity);

    CustomerTransfer selectByPrimaryKey(Long id);

    List<CustomerTransfer> selectAll();

    int updateByPrimaryKey(CustomerTransfer entity);*/

    PageResults query(QueryObjects qo);

}
