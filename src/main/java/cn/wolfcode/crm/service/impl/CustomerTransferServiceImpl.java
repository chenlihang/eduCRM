package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.CustomerTransfer;
import cn.wolfcode.crm.mapper.CustomerTransferMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.ICustomerTransferService;
import cn.wolfcode.crm.util.PageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerTransferServiceImpl implements ICustomerTransferService {
    @Autowired
    private CustomerTransferMapper mapper;

    /*@Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(CustomerTransfer entity) {
        return mapper.insert(entity);
    }

    @Override
    public void saveOrUpdate(CustomerTransfer entity) {
        if (entity.getId() == null) {
             mapper.insert(entity);
        } else {
            mapper.deleteRoleRelation(entity.getId());
             mapper.updateByPrimaryKey(entity);
        }
        if (entity.getRoles().size()>0) {
            mapper.insertRoleRelation(entity.getId(),entity.getRoles());
        }
    }

    @Override
    public CustomerTransfer selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <CustomerTransfer> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(CustomerTransfer entity) {
        return mapper.updateByPrimaryKey(entity);
    }*/

    @Override
    public PageResults query(QueryObjects qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResults.EMPTY_PAGE;
        }
        List <CustomerTransfer> list = mapper.queryList(qo);
        return new PageResults(qo.getCurrentPage(), qo.getPageSize(), mapper.queryList(qo), count);
    }

}
