package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Contact;
import cn.wolfcode.crm.query.QueryObjects;

import java.util.List;

public interface ContactMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Contact entity);

    Contact selectByPrimaryKey(Long id);

    List<Contact> selectAll();

    int updateByPrimaryKey(Contact entity);

    int queryCount(QueryObjects qo);

    List<Contact> queryList(QueryObjects qo);
}