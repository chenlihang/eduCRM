package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Department;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.util.PageResult;

import java.util.List;

public interface IDepartmentService {
    int deleteByPrimaryKey(Long id);

    int insert(Department entity);

    int saveOrUpdate(Department entity);

    Department selectByPrimaryKey(Long id);

    List<Department> selectAll();

    int updateByPrimaryKey(Department entity);

    PageResult query(QueryObject qo);

    Department selectByName(String name);
}
