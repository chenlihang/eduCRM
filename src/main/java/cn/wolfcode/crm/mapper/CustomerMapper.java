package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Customer;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Customer entity);

    Customer selectByPrimaryKey(Long id);

    List<Customer> selectAll();

    int updateByPrimaryKey(Customer entity);
}