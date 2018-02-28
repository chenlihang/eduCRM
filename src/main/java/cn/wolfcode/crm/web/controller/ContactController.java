package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Contact;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IContactService;
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
@RequestMapping("contact")
public class ContactController {
    @Autowired
    private IContactService contactService;

    @RequestMapping("view")
    @RequiresPermissions("contact:view")
    @PermissionName("联系人列表")
    public String view(Model model, @ModelAttribute("qo")QueryObjects qo) {
        model.addAttribute("result", contactService.query(qo));
        return "contact/view";
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Contact> list(){
        return contactService.selectAll();
    }
    @RequestMapping("query")
    @ResponseBody
    public PageResults query(QueryObjects qo){
        return contactService.query(qo);
    }
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Contact contact){
        return new JsonResult();
    }
}
