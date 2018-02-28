package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Department;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.util.PageResult;

import java.util.List;

public interface IDepartmentService {
    int deleteByPrimaryKey(Long id);

    int saveOrUpdate(Department entity);

    Department selectByPrimaryKey(Long id);

    List<Department> selectAll();

    PageResult query(QueryObject qo);

    Department selectByName(String name);
}
