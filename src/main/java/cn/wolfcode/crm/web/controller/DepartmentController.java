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
    @Autowired
    private IEmployeeService employeeService;

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
}
