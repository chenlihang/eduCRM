package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.SystemMenu;
import cn.wolfcode.crm.mapper.SystemMenuMapper;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ISystemMenuService;
import cn.wolfcode.crm.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemMenuServiceImpl implements ISystemMenuService {
    @Autowired
    private SystemMenuMapper mapper;

    /*@Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SystemMenu entity) {
        return mapper.insert(entity);
    }

    @Override
    public int saveOrUpdate(SystemMenu entity) {
        if (entity.getId() == null) {
            return mapper.insert(entity);
        } else {
            return mapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public SystemMenu selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <SystemMenu> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(SystemMenu entity) {
        return mapper.updateByPrimaryKey(entity);
    }*/

    @Override
    public PageResult query(QueryObject qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResult.EMPTY_RESULT;
        }
        List <SystemMenu> list = mapper.queryList(qo);
        return new PageResult(count, list);
    }

    @Override
    public List <SystemMenu> loadMenu() {
        List <SystemMenu> menuList = mapper.getRootMenu();
        /*Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        List<SystemMenu> menuList = (List <SystemMenu>) session.getAttribute("MENU_LIST");
        if (menuList == null) {
            menuList = mapper.getRootMenu();
            handleMenu(menuList);
            session.setAttribute("MENU_LIST",menuList);
        }*/
        return menuList;
    }


    /*private void handleMenu(List <SystemMenu> menuList) {
        Subject subject = SecurityUtils.getSubject();
        Iterator <SystemMenu> iterator = menuList.iterator();
        while (iterator.hasNext()) {
            SystemMenu menu = iterator.next();
            if (menu.getPermission() != null) {
                if (!subject.isPermitted(menu.getPermission().getResource())) {
                    iterator.remove();
                    continue;
                }
                if (menu.getChildren().size() > 0) {
                    handleMenu(menu.getChildren());
                }
            }
        }
    }*/
}
