package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Classroom;
import cn.wolfcode.crm.query.ClassroomQueryObject;
import cn.wolfcode.crm.query.EmployeeQueryObject;
import cn.wolfcode.crm.service.IClassroomService;
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
@RequestMapping("classroom")
public class ClassroomController {
    @Autowired
    private IClassroomService classroomService;

    @RequestMapping("view")
    @RequiresPermissions("classroom:view")
    @PermissionName("教室管理列表")
    public String view(Model model, @ModelAttribute("qo") ClassroomQueryObject qo) {
        model.addAttribute("result", classroomService.query(qo));
        return "classroom/view";

    }

    @RequestMapping("query")
    @ResponseBody
    public PageResults query(EmployeeQueryObject qo) {
        return classroomService.query(qo);
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Classroom> listAll() {
        return classroomService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Classroom entity) {
        try {
            int i = classroomService.saveOrUpdate(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().setErrorMsg("保存失败");
        }
        return new JsonResult();
    }

    @RequestMapping("updateState")
    @ResponseBody
    public JsonResult updateState(Long id) {
        classroomService.updateState(id);
        return new JsonResult();
    }
}
