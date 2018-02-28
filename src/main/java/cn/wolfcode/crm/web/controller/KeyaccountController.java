package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Keyaccount;
import cn.wolfcode.crm.service.IKeyaccountService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("keyaccount")
public class KeyaccountController {
    @Autowired
    private IKeyaccountService keyaccountService;

    @RequestMapping("view")
    @RequiresPermissions("keyaccount:view")
    @PermissionName("大客户列表")
    public String view(){
        return "keyaccount/view";
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Keyaccount> list(){
        return keyaccountService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Keyaccount keyaccount){
        return new JsonResult();
    }
}
