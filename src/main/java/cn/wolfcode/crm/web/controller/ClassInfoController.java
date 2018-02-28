package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.ClassInfo;
import cn.wolfcode.crm.query.ClassInfoQueryObject;
import cn.wolfcode.crm.service.IClassInfoService;
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
@RequestMapping("classInfo")
public class ClassInfoController {
    @Autowired
    private IClassInfoService classInfoService;

    @RequestMapping("view")
    @RequiresPermissions("classInfo:view")
    @PermissionName("班级列表")
    public String view(){
        return "classInfo/view";
    }

    @RequestMapping("query")
    @ResponseBody
    public PageResult query(ClassInfoQueryObject qo) {
        return classInfoService.query(qo);
    }


    @RequestMapping("listAll")
    @ResponseBody
    public List<ClassInfo> list(){
        return classInfoService.selectAll();
    }

    @RequestMapping("updateState")
    @ResponseBody
    public JsonResult updateState(Long id) {
        classInfoService.updateState(id);
        return new JsonResult();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(ClassInfo classInfo){
        try {
            classInfoService.saveOrUpdate(classInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().setErrorMsg("保存/更新失败");
        }
        return new JsonResult();
    }
}
