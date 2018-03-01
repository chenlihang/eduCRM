package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Department;
import cn.wolfcode.crm.service.IDepartmentService;
import cn.wolfcode.crm.service.IEmployeeService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("department")
public class DepartmentController {
    @Autowired
    private IDepartmentService departmentService;

    @RequestMapping("view")
    @RequiresPermissions("department:view")
    @PermissionName("部门列表")
    public String view(){
        return "department/view";
    }

    @RequestMapping("query")
    @ResponseBody
    public List<Department> query(){
        return departmentService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("department:saveOrUpdate")
    @PermissionName("部门新增或编辑")
    public JsonResult saveOrUpdate(Department department){
        JsonResult result = new JsonResult();
        try {
            departmentService.saveOrUpdate(department);
            return result;
        }catch (Exception e){
            e.printStackTrace();
            return result.setErrorMsg("操作失败");
        }
    }
    @RequestMapping("dismiss")
    @ResponseBody
    @RequiresPermissions("department:dismiss")
    @PermissionName("部门解散")
    public JsonResult dismiss(Long id){
        JsonResult result = new JsonResult();
        try {
            departmentService.dismiss(id);
            return result;
        }catch (Exception e){
            e.printStackTrace();
            return result.setErrorMsg("解散失败");
        }
    }
}
