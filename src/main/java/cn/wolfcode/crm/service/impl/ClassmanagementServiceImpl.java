package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Classmanagement;
import cn.wolfcode.crm.mapper.ClassmanagementMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IClassmanagementService;
import cn.wolfcode.crm.util.PageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassmanagementServiceImpl implements IClassmanagementService {
    @Autowired
    private ClassmanagementMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Classmanagement entity) {
        return mapper.insert(entity);
    }

    @Override
    public int saveOrUpdate(Classmanagement entity) {
        if (entity.getId() == null) {
             mapper.insert(entity);
        }
             mapper.updateByPrimaryKey(entity);

        return 0;
    }

    @Override
    public Classmanagement selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Classmanagement> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Classmanagement entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResults.EMPTY_PAGE;
        }
        List <Classmanagement> list = mapper.queryList(qo);
        return new PageResults(qo.getCurrentPage(), qo.getPageSize(), mapper.queryList(qo), count);
    }


    @Override
    public void updateState(Long id) {
        mapper.updateState(id);
    }
}
