package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.query.CustomerTransferQueryObjects;
import cn.wolfcode.crm.service.ICustomerTransferService;
import cn.wolfcode.crm.service.IDepartmentService;
import cn.wolfcode.crm.util.PageResults;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("customerTransfer")
public class CustomerTransferController {
    @Autowired
    private ICustomerTransferService customerTransferService;
    @Autowired
    private IDepartmentService departmentService;

    @RequestMapping("view")
    @RequiresPermissions("customerTransfer:view")
    @PermissionName("移交历史列表")
    public String view(Model model, @ModelAttribute("qo")CustomerTransferQueryObjects qo) {
        model.addAttribute("result", customerTransferService.query(qo));
        return "customerTransfer/view";
    }

    @RequestMapping("query")
    @ResponseBody
    public PageResults query(CustomerTransferQueryObjects qo) {
        return customerTransferService.query(qo);
    }


   /* @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(CustomerTransfer customerTransfer) {
        try {
            customerTransferService.saveOrUpdate(customerTransfer);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().setErrorMsg("保存失败");
        }
        return new JsonResult();
    }*/

}
