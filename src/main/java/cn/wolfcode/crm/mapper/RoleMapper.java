package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.query.QueryObjects;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role entity);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role entity);

    int queryCount(QueryObjects qo);

    List<Role> queryList(QueryObjects qo);

    void deletePermissionRelation(Long id);

    void insertPermissionRelation(@Param("roleId") Long id, @Param("permissions") List<Permission> permissions);

    List<Long> selectByEmployeeId(Long employeeId);
}