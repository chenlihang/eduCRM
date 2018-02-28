package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.SystemMenu;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface SystemMenuMapper {
   /* int deleteByPrimaryKey(Long id);

    int insert(SystemMenu entity);

    SystemMenu selectByPrimaryKey(Long id);

    List<SystemMenu> selectAll();

    int updateByPrimaryKey(SystemMenu entity);*/

    int queryCount(QueryObject qo);

    List<SystemMenu> queryList(QueryObject qo);

    List<SystemMenu> getRootMenu();
}