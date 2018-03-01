package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Classmanagement;
import cn.wolfcode.crm.query.QueryObjects;

import java.util.List;

public interface ClassmanagementMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Classmanagement entity);

    Classmanagement selectByPrimaryKey(Long id);

    List<Classmanagement> selectAll();

    int updateByPrimaryKey(Classmanagement entity);
    //分页的操作
    int queryCount(QueryObjects qo);

    List<Classmanagement> queryList(QueryObjects qo);
    void updateState(Long id);



   // void deleteRoleRelation(@Param("employee_id") Long employee_id, @Param("role_id")Long role_id);

   // void insertRoleRelation(@Param("employee_id") Long employee_id, @Param("role_id")Long role_id);
}