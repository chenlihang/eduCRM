package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IEmployeeService {
    int deleteByPrimaryKey(Long id);

    int insert(Employee entity);

    void saveOrUpdate(Employee entity);

    Employee selectByPrimaryKey(Long id);

//    List<Employee> selectAll();

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee entity);

    PageResults query(QueryObjects qo);

    void updateState(Long id);
}
