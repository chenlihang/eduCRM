package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Keyaccount;
import cn.wolfcode.crm.query.QueryObjects;

import java.util.List;

public interface KeyaccountMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Keyaccount record);

    Keyaccount selectByPrimaryKey(Long id);

    List<Keyaccount> selectAll();

    int updateByPrimaryKey(Keyaccount record);

    int queryCount(QueryObjects qo);

    List<Keyaccount> queryList(QueryObjects qo);
}