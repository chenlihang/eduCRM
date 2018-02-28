package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.SystemMenu;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ISystemMenuService;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("systemMenu")
public class SystemMenuController {
    @Autowired
    private ISystemMenuService systemMenuService;

    @RequestMapping("loadMenu")
    @ResponseBody
    public List<SystemMenu> loadMenu(){
        return systemMenuService.loadMenu();
    }

    @RequestMapping("view")
    @RequiresPermissions("systemMenu:view")
    @PermissionName("菜单列表")
    public String view(){
        return "systemMenu/view";
    }

    @RequestMapping("query")
    @ResponseBody
    public PageResult query(QueryObject qo){
        return systemMenuService.query(qo);
    }
}
