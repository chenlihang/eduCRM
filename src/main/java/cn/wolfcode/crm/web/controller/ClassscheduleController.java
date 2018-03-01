package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Classschedule;
import cn.wolfcode.crm.query.ClassroomQueryObject;
import cn.wolfcode.crm.query.EmployeeQueryObject;
import cn.wolfcode.crm.service.IClassscheduleService;
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
@RequestMapping("classschedule")
public class ClassscheduleController {
    @Autowired
    private IClassscheduleService classscheduleService;

    @RequestMapping("view")
    @RequiresPermissions("classroom:view")
    @PermissionName("课程列表")
    public String view(Model model, @ModelAttribute("qo") ClassroomQueryObject qo) {
        model.addAttribute("result", classscheduleService.query(qo));
        return "classschedule/view";

    }

    @RequestMapping("query")
    @ResponseBody
    public PageResults query(EmployeeQueryObject qo) {
        return classscheduleService.query(qo);
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Classschedule> listAll() {
        return classscheduleService.selectAll();
    }



}
