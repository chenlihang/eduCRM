package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IPermissionService {
    int deleteByPrimaryKey(Long id);

    int insert(Permission entity);

    int saveOrUpdate(Permission entity);

    Permission selectByPrimaryKey(Long id);

    List<Permission> selectAll();

    int updateByPrimaryKey(Permission entity);

    PageResults query(QueryObjects qo);

    List<Permission> selectByRoleId(Long id);

    void load();
}
