package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.mapper.PermissionMapper;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IPermissionService;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.lang.reflect.Method;
import java.util.Collection;
import java.util.List;

@Service
public class PermissionServiceImpl implements IPermissionService {
    @Autowired
    private PermissionMapper mapper;
    @Autowired
    private ApplicationContext ctx;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Permission entity) {
        return mapper.insert(entity);
    }

    @Override
    public int saveOrUpdate(Permission entity) {
        if (entity.getId() == null) {
            return mapper.insert(entity);
        } else {
            return mapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public Permission selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Permission> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Permission entity) {
        return mapper.updateByPrimaryKey(entity);
    }


    @Override
    public PageResult query(QueryObject qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResult.EMPTY_RESULT;
        }
        List <Permission> list = mapper.queryList(qo);
        return new PageResult(count, list);
    }

    @Override
    public List <Permission> selectByRoleId(Long roleId) {
        return mapper.selectByRoleId(roleId);
    }

    @Override
    public void load() {
        List<String> resources=mapper.getAllResources();
        Collection <Object> beans = ctx.getBeansWithAnnotation(Controller.class).values();
        for (Object bean : beans) {
            Method[] methods = bean.getClass().getDeclaredMethods();
            for (Method method : methods) {
                RequiresPermissions anno = method.getAnnotation(RequiresPermissions.class);
                if (anno != null) {
                    if (!resources.contains(anno.value()[0])) {
                        String permissionName = method.getAnnotation(PermissionName.class).value();
                        Permission permission = new Permission(permissionName, anno.value()[0]);
                        mapper.insert(permission);
                    }
                }
            }
        }
    }
}
