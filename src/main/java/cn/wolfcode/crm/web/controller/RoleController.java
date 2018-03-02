package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.query.EmployeeQueryObject;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IPermissionService;
import cn.wolfcode.crm.service.IRoleService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("view")
    @RequiresPermissions("role:view")
    @PermissionName("角色列表")
    public String view(Model model, @ModelAttribute("qo")QueryObjects qo){
        model.addAttribute("result", roleService.query(qo));
        return "role/view";
    }

//    @RequestMapping("query")
//    @ResponseBody
//    public PageResult query(QueryObject qo){
//        return roleService.query(qo);
//    }

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

    @RequestMapping("input")
    public String input(Long id,Model model) {
        if (id != null) {
            model.addAttribute("entity", roleService.selectByPrimaryKey(id));
        }
        model.addAttribute("permissions",permissionService.selectAll());
        return "role/input";
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Role role,Long[] ids){
        try {
            roleService.saveOrUpdate(role,ids);
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
