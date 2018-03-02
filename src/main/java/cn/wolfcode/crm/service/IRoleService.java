package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IRoleService {
    int deleteByPrimaryKey(Long id);

    int insert(Role entity);

    void saveOrUpdate(Role entity,Long[] ids);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role entity);

    PageResults query(QueryObjects qo);

    Object selectByEmployeeId(Long employeeId);
}
