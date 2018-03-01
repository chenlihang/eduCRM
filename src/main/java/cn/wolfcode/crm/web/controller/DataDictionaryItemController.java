package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.DataDictionaryItem;
import cn.wolfcode.crm.query.DataItemQueryObject;
import cn.wolfcode.crm.service.IDataDictionaryItemService;
import cn.wolfcode.crm.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * controller
 * @author CrystalBaby
 */
@Controller
@RequestMapping("dataDictionaryItem")
public class DataDictionaryItemController {
    @Autowired
    private IDataDictionaryItemService dataDictionaryItemService;

   @RequestMapping("view")
   public Object query(Model model, @ModelAttribute("qo")DataItemQueryObject qo){
       model.addAttribute("result", dataDictionaryItemService.query(qo));
       return "dataDictionaryItem/view";
   }
    @RequestMapping("input")
    public String list(Model model, Long id) throws Exception {
        if (id != null) {
            model.addAttribute("entity", dataDictionaryItemService.get(id));
        }
        return "dataDictionaryItem/input";
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(DataDictionaryItem entity){
        JsonResult result = new JsonResult();
        try {
            dataDictionaryItemService.saveOrUpdate(entity);
            return  result;
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg(e.getMessage());
            return result;
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public JsonResult changeState(Long id){
        JsonResult result = new JsonResult();
        try {
            dataDictionaryItemService.delete(id);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg(e.getMessage());
            return result;
        }
    }



    @RequestMapping({"listItem"})
    public List<DataDictionaryItem> listItem(String sn,Model model) {
        model.addAttribute("result", dataDictionaryItemService.selectItemByParentSn(sn));
        return this.dataDictionaryItemService.selectItemByParentSn(sn);
    }

    @RequestMapping({"getItemBySn"})
    @ResponseBody
    public List<DataDictionaryItem> selectItemByParentSn(String sn) {
        Object items = new ArrayList();

        try {
            items = this.dataDictionaryItemService.selectItemByParentSn(sn);
        } catch (Exception var4) {
            var4.printStackTrace();
        }

        return (List)items;
    }

}
