package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Keyaccount;
import cn.wolfcode.crm.query.KeyaccountQueryObject;
import cn.wolfcode.crm.service.IKeyaccountService;
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
@RequestMapping("keyaccount")
public class KeyaccountController {
    @Autowired
    private IKeyaccountService keyaccountService;

    @RequestMapping("view")
    @RequiresPermissions("keyaccount:view")
    @PermissionName("大客户列表")
    public String view(@ModelAttribute("qo") KeyaccountQueryObject qo, Model model) {

        PageResults result = keyaccountService.query(qo);

        model.addAttribute("result", result);


        return "keyaccount/view";
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Keyaccount> list() {
        return keyaccountService.selectAll();
    }


    @RequestMapping("input")
    public String input(Keyaccount entity, Model model)

    {

        if (entity.getId() != null) {
            Keyaccount enitity = keyaccountService.selectByPrimaryKey(entity.getId());
            model.addAttribute("entity", entity);
        }
        return "keyaccount/input";

    }


    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Keyaccount enitiy) {

        if(keyaccountService.saveOrUpdate(enitiy)>0)
        {
            return new JsonResult();
        }
        else
        {

        return new JsonResult().setErrorMsg("保存失败");
        }


    }
}
