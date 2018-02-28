package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.SystemMenu;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.util.PageResult;

import java.util.List;

public interface ISystemMenuService {
    /*int deleteByPrimaryKey(Long id);

    int insert(SystemMenu entity);

    int saveOrUpdate(SystemMenu entity);

    SystemMenu selectByPrimaryKey(Long id);

    List<SystemMenu> selectAll();

    int updateByPrimaryKey(SystemMenu entity);*/

    PageResult query(QueryObject qo);

    List<SystemMenu> loadMenu();
}
