package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Customer;
import cn.wolfcode.crm.query.CustomerQueryObject;
import cn.wolfcode.crm.service.ICustomerService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("customer")
public class CustomerController {
    @Autowired
    private ICustomerService customerService;

    @RequestMapping("view")
    @RequiresPermissions("customer:view")
    @PermissionName("客户列表")
    public String view(Model model, @ModelAttribute("qo")CustomerQueryObject qo) {
        model.addAttribute("result", customerService.query(qo));
        return "customer/view";
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Customer entity) {
        try {
           int i= customerService.saveOrUpdate(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().setErrorMsg("保存失败");
        }
        return new JsonResult();
    }

    @RequestMapping("delete")
    @ResponseBody
    public Object delete(Long id) throws Exception{
        if(id!=null){
            customerService.deleteByPrimaryKey(id);
        }
        return new JsonResult();
    }




}
