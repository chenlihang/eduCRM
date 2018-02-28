package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Classmanagement;
import cn.wolfcode.crm.domain.Classroom;
import cn.wolfcode.crm.query.QueryObjects;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassmanagementMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Classmanagement entity);

    Classmanagement selectByPrimaryKey(Long id);

    List<Classmanagement> selectAll();

    int updateByPrimaryKey(Classmanagement entity);
    int queryCount(QueryObjects qo);

    List<Classroom> queryList(QueryObjects qo);
    void updateState(Long id);

    void deleteRoleRelation(@Param("employee_id") Long employee_id, @Param("role_id")Long role_id);

    void insertRoleRelation(@Param("employee_id") Long employee_id, @Param("role_id")Long role_id);
}