package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Classmanagement;
import cn.wolfcode.crm.query.EmployeeQueryObject;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IClassmanagementService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PageResults;
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
@RequestMapping("classmanagement")
public class ClassmanagementController {
    @Autowired
    private IClassmanagementService classmanagementService;

    @RequestMapping("view")
    @RequiresPermissions("classmanagement:view")
    @PermissionName("班级管理列表")
    public String view(Model model, @ModelAttribute("qo") QueryObjects qo) {

        model.addAttribute("result", classmanagementService.query(qo));
        return "classmanagement/view";

    }
    @RequestMapping("input")
    public String input(Long id,Model model) {
        if (id != null) {
            model.addAttribute("entity",classmanagementService.selectByPrimaryKey(id));
        }
        return "classmanagement/input";
    }

    @RequestMapping("query")
    @ResponseBody
    public PageResults query(EmployeeQueryObject qo) {
        return classmanagementService.query(qo);
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Classmanagement> listAll() {
        return classmanagementService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Classmanagement entity) {
        try {
            int i = classmanagementService.saveOrUpdate(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().setErrorMsg("保存失败");
        }
        return new JsonResult();
    }

    @RequestMapping("updateState")
    @ResponseBody
    public JsonResult updateState(Long id) {
        classmanagementService.updateState(id);
        return new JsonResult();
    }
}
