package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.util.PageResult;

import java.util.List;

public interface IRoleService {
    int deleteByPrimaryKey(Long id);

    int insert(Role entity);

    void saveOrUpdate(Role entity);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role entity);

    PageResult query(QueryObject qo);

    Object selectByEmployeeId(Long employeeId);
}
