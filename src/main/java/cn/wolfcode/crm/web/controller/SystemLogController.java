package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.mapper.SystemLogMapper;
import cn.wolfcode.crm.query.SystemLogQueryObject;
import cn.wolfcode.crm.service.ISystemLogService;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("systemLog")
public class SystemLogController {
    @Autowired
    private ISystemLogService systemLogService;
    @RequestMapping("view")
    @RequiresPermissions("systemLog:view")
    @PermissionName("系统日志页面")
    public String view(){
        return "systemLog/view";
    }
    @RequestMapping("query")
    @ResponseBody
    public PageResult query(SystemLogQueryObject qo){
        return systemLogService.query(qo);
    }
}
