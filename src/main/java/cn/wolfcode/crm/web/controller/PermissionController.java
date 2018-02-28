package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IPermissionService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("permission")
public class PermissionController {
    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("view")
    @RequiresPermissions("permission:view")
    @PermissionName("权限列表")
    public String view(){
        return "permission/view";
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Permission> list(){
        return permissionService.selectAll();
    }

    @RequestMapping("query")
    @ResponseBody
    public PageResult query(QueryObject qo){
        return permissionService.query(qo);
    }

    @RequestMapping("selectByRoleId")
    @ResponseBody
    public List<Permission> selectByRoleId(Long roleId){
        return permissionService.selectByRoleId(roleId);
    }

    @RequestMapping("load")
    @ResponseBody
    public JsonResult saveOrUpdate(){
        try {
            permissionService.load();
        }catch (Exception e){
            e.printStackTrace();
            return new JsonResult().setErrorMsg("加载失败");
        }
        return new JsonResult();
    }
}
