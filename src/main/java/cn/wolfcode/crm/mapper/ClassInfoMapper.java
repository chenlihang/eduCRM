package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.ClassInfo;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface ClassInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ClassInfo entity);

    ClassInfo selectByPrimaryKey(Long id);

    List<ClassInfo> selectAll();

    int updateByPrimaryKey(ClassInfo entity);

    int queryCount(QueryObject qo);

    List<ClassInfo> queryList(QueryObject qo);

    void updateState(Long id);
}