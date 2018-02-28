package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Contact;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IContactService {
    int deleteByPrimaryKey(Long id);

    int insert(Contact entity);

    int saveOrUpdate(Contact entity);

    Contact selectByPrimaryKey(Long id);

    List<Contact> selectAll();

    int updateByPrimaryKey(Contact entity);

    PageResults query(QueryObjects qo);

}
