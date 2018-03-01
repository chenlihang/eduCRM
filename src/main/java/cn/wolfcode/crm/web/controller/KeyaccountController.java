package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Keyaccount;
import cn.wolfcode.crm.query.KeyaccountQueryObject;
import cn.wolfcode.crm.service.IContactService;
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
    @Autowired
    private IContactService contactService;

    @RequestMapping("view")
    @RequiresPermissions("keyaccount:view")
    @PermissionName("大客户列表")
    public String view(@ModelAttribute("qo") KeyaccountQueryObject qo, Model model) {

        PageResults result = keyaccountService.query(qo);

        model.addAttribute("result", result);
        model.addAttribute("subjects",keyaccountService.selectDictionaryItemByDictionarySn("subject"));


        return "keyaccount/view";
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Keyaccount> list() {
        return keyaccountService.selectAll();
    }
    @RequestMapping("delete")
    @ResponseBody
    public Object delete(Long id)
    {
        if(keyaccountService.deleteByPrimaryKey(id)>0)
        {
            return new JsonResult();
        }
        else
        {

            return new JsonResult().setErrorMsg("删除操作失败");
        }

    }


    @RequestMapping("input")
    public String input(Long id, Model model)

    {

        if (id != null) {
            Keyaccount enity = keyaccountService.selectByPrimaryKey(id);
            model.addAttribute("enity", enity);
        }
        model.addAttribute("importance",keyaccountService.selectDictionaryItemByDictionarySn("importance"));
        model.addAttribute("intentionLevel",keyaccountService.selectDictionaryItemByDictionarySn("intentionLevel"));
        model.addAttribute("subject",keyaccountService.selectDictionaryItemByDictionarySn("subject"));
        model.addAttribute("college",keyaccountService.selectDictionaryItemByDictionarySn("college"));
        model.addAttribute("contact",contactService.selectAll());
        model.addAttribute("marketer",keyaccountService.selectDictionaryItemByDictionarySn("marketer"));
        model.addAttribute("tracer",keyaccountService.selectDictionaryItemByDictionarySn("tracer"));
        model.addAttribute("type",keyaccountService.selectDictionaryItemByDictionarySn("type"));
        model.addAttribute("education",keyaccountService.selectDictionaryItemByDictionarySn("education"));
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
