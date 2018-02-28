package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Contact;
import cn.wolfcode.crm.mapper.ContactMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IContactService;
import cn.wolfcode.crm.util.PageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactServiceImpl implements IContactService {
    @Autowired
    private ContactMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Contact entity) {
        return mapper.insert(entity);
    }

    @Override
    public int saveOrUpdate(Contact entity) {
        if (entity.getId() == null) {
            return mapper.insert(entity);
        } else {
            return mapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public Contact selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Contact> selectAll() {
        return mapper.selectAll();
    }
    @Override
    public int updateByPrimaryKey(Contact entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResults.EMPTY_PAGE;
        }
        List <Contact> list = mapper.queryList(qo);
        return new PageResults(qo.getCurrentPage(),qo.getPageSize(),mapper.queryList(qo), count);
    }
}
