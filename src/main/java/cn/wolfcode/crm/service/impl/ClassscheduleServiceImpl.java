package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Classschedule;
import cn.wolfcode.crm.mapper.ClassscheduleMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IClassscheduleService;
import cn.wolfcode.crm.util.PageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassscheduleServiceImpl implements IClassscheduleService {
    @Autowired
    private ClassscheduleMapper mapper;


    @Override
    public Classschedule selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Classschedule> selectAll() {
        return mapper.selectAll();
    }


    @Override
    public PageResults query(QueryObjects qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResults.EMPTY_PAGE;
        }
        List <Classschedule> list = mapper.queryList(qo);
        return new PageResults(qo.getCurrentPage(), qo.getPageSize(), mapper.queryList(qo), count);
    }
}
