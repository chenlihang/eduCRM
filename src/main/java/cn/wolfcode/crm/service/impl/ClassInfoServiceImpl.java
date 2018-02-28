package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.ClassInfo;
import cn.wolfcode.crm.mapper.ClassInfoMapper;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IClassInfoService;
import cn.wolfcode.crm.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassInfoServiceImpl implements IClassInfoService {
    @Autowired
    private ClassInfoMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(ClassInfo entity) {
        return mapper.insert(entity);
    }

    @Override
    public int saveOrUpdate(ClassInfo entity) {
        if (entity.getId() == null) {
            return mapper.insert(entity);
        } else {
            return mapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public ClassInfo selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <ClassInfo> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(ClassInfo entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    @Override
    public PageResult query(QueryObject qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResult.EMPTY_RESULT;
        }
        List <ClassInfo> list = mapper.queryList(qo);
        return new PageResult(count, list);
    }

    @Override
    public void updateState(Long id) {
        mapper.updateState(id);
    }
}
