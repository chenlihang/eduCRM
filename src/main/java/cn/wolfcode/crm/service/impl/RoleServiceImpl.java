package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.mapper.RoleMapper;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IRoleService;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private RoleMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Role entity) {
        return mapper.insert(entity);
    }

    @Override
    public void saveOrUpdate(Role entity) {
        if (entity.getId() == null) {
            mapper.insert(entity);
        } else {
            mapper.deletePermissionRelation(entity.getId());
            mapper.updateByPrimaryKey(entity);
        }
        if (entity.getPermissions().size()>0) {
            mapper.insertPermissionRelation(entity.getId(),entity.getPermissions());
        }
    }

    @Override
    public Role selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Role> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Role entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResults.EMPTY_PAGE;
        }
        List <Role> list = mapper.queryList(qo);
        return new PageResults(qo.getCurrentPage(),qo.getPageSize(),list,count);
    }

    @Override
    public List<Long> selectByEmployeeId(Long employeeId) {
        return mapper.selectByEmployeeId(employeeId);
    }
}

