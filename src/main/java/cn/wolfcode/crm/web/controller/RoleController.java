package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IRoleService;
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
@RequestMapping("role")
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @RequestMapping("view")
    @RequiresPermissions("role:view")
    @PermissionName("角色列表")
    public String view(){
        return "role/view";
    }

    @RequestMapping("query")
    @ResponseBody
    public PageResult query(QueryObject qo){
        return roleService.query(qo);
    }

    @RequestMapping("selectByEmployeeId")
    @ResponseBody
    public Object selectByEmployeeId(Long employeeId){
        return roleService.selectByEmployeeId(employeeId);
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Role> listAll(){
        return roleService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Role role){
        try {
            roleService.saveOrUpdate(role);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().setErrorMsg("保存失败");
        }
        return new JsonResult();
    }

    @RequestMapping("updateState")
    @ResponseBody
    public JsonResult updateState(Long id){
        return new JsonResult();
    }
}
