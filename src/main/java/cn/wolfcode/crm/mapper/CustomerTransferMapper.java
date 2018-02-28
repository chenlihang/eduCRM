package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.CustomerTransfer;
import cn.wolfcode.crm.query.QueryObjects;

import java.util.List;

public interface CustomerTransferMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CustomerTransfer entity);

    CustomerTransfer selectByPrimaryKey(Long id);

    List<CustomerTransfer> selectAll();

    int updateByPrimaryKey(CustomerTransfer entity);

    int queryCount(QueryObjects qo);

    List<CustomerTransfer> queryList(QueryObjects qo);
}