package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.util.PageResult;

import java.util.List;

public interface IEmployeeService {
    int deleteByPrimaryKey(Long id);

    int insert(Employee entity);

    void saveOrUpdate(Employee entity);

    Employee selectByPrimaryKey(Long id);

//    List<Employee> selectAll();

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee entity);

    PageResult query(QueryObject qo);

    void updateState(Long id);
}
