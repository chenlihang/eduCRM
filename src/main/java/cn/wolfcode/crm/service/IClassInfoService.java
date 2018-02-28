package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.ClassInfo;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.util.PageResult;

import java.util.List;

public interface IClassInfoService {
    int deleteByPrimaryKey(Long id);

    int insert(ClassInfo entity);

    int saveOrUpdate(ClassInfo entity);

    ClassInfo selectByPrimaryKey(Long id);

    List<ClassInfo> selectAll();

    int updateByPrimaryKey(ClassInfo entity);

    PageResult query(QueryObject qo);

    void updateState(Long id);
}
