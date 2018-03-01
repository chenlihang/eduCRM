package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Classmanagement;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;
//增删改查的操作
public interface IClassmanagementService {
    int deleteByPrimaryKey(Long id);

    int insert(Classmanagement classmanagement);

    int saveOrUpdate(Classmanagement classmanagement);

    Classmanagement selectByPrimaryKey(Long id);



    List<Classmanagement> selectAll();

    int updateByPrimaryKey(Classmanagement classmanagement);

    PageResults query(QueryObjects qo);
    //状态的操作
    void updateState(Long id);
}
