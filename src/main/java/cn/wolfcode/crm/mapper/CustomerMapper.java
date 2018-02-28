package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Customer;
import cn.wolfcode.crm.query.QueryObjects;

import java.util.List;

/**
 * 客户Mapper借口类
 * @author cfm
 * @date 2018-02-28
 */
public interface CustomerMapper {
    /**
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Long id);

    int insert(Customer entity);

    Customer selectByPrimaryKey(Long id);

    List<Customer> selectAll();

    int updateByPrimaryKey(Customer entity);

    int queryCount(QueryObjects qo);

    List<Customer> queryList(QueryObjects qo);
}