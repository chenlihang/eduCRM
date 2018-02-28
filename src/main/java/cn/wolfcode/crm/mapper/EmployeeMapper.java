package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.query.QueryObjects;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee entity);

    Employee selectByPrimaryKey(Long id);

//    List<Employee> selectAll();

    int updateByPrimaryKey(Employee entity);

    int queryCount(QueryObjects qo);

    List<Employee> queryList(QueryObjects qo);

    void updateState(Long id);

    void deleteRoleRelation(Long id);

    void insertRoleRelation(@Param("employeeId") Long employeeId,@Param("roles") List roles);

    List<Employee> selectAll();

    Employee selectByUsername(String username);

    List <String> selectPermissionResourceByEmployeeId(Long id);

    List<String> selectRoleNameByEmployeeId(Long id);
}