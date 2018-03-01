package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Department;
import cn.wolfcode.crm.mapper.DepartmentMapper;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IDepartmentService;
import cn.wolfcode.crm.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements IDepartmentService {
    @Autowired
    private DepartmentMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }


    @Override
    public int saveOrUpdate(Department entity) {
        if (entity.getId() == null) {
            return mapper.insert(entity);
        } else {
            return mapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public Department selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Department> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public PageResult query(QueryObject qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResult.EMPTY_RESULT;
        }
        List<Department> list = mapper.queryList(qo);
        return new PageResult(count, list);
    }

    @Override
    public Department selectByName(String name) {
        return mapper.selectByName(name);
    }

    @Override
    public void dismiss(Long id) {
        mapper.dismiss(id);
    }
}
