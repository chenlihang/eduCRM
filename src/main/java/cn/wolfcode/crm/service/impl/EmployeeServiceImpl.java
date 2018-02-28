package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.mapper.EmployeeMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IEmployeeService;
import cn.wolfcode.crm.util.PageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements IEmployeeService {
    @Autowired
    private EmployeeMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Employee entity) {
        return mapper.insert(entity);
    }

    @Override
    public void saveOrUpdate(Employee entity) {
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
    public Employee selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Employee> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Employee entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResults.EMPTY_PAGE;
        }
        List <Employee> list = mapper.queryList(qo);
        return new PageResults(qo.getCurrentPage(), qo.getPageSize(), mapper.queryList(qo), count);
    }


    @Override
    public void updateState(Long id) {
        mapper.updateState(id);
    }
}
