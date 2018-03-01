package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Classroom;
import cn.wolfcode.crm.mapper.ClassroomMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IClassroomService;
import cn.wolfcode.crm.util.PageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassroomServiceImpl implements IClassroomService {
    @Autowired
    private ClassroomMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Classroom entity) {
        return mapper.insert(entity);
    }

    @Override
    public int saveOrUpdate(Classroom entity) {
        if (entity.getId() == null) {
             mapper.insert(entity);
        }
             mapper.updateByPrimaryKey(entity);

        return 0;
    }

    @Override
    public Classroom selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Classroom> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Classroom entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResults.EMPTY_PAGE;
        }
        List <Classroom> list = mapper.queryList(qo);
        return new PageResults(qo.getCurrentPage(), qo.getPageSize(), mapper.queryList(qo), count);
    }


    @Override
    public void updateState(Long id) {
        mapper.updateState(id);
    }
}
