package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface PermissionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Permission entity);

    Permission selectByPrimaryKey(Long id);

    List<Permission> selectAll();

    int updateByPrimaryKey(Permission entity);

    int queryCount(QueryObject qo);

    List<Permission> queryList(QueryObject qo);

    List<Permission> selectByRoleId(Long roleId);

    List<String> getAllResources();
}