package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.DataDictionary;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IDataDictionaryService;
import cn.wolfcode.crm.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * controller
 * @author CrystalBaby
 */
@Controller
@RequestMapping("dataDictionary")
public class DataDictionaryController {
    @Autowired
    private IDataDictionaryService dataDictionaryService;
   @RequestMapping("view")
   public String view(Model model, @ModelAttribute("qo")QueryObjects qo) throws Exception {
       model.addAttribute("result", dataDictionaryService.query(qo));
       return "dataDictionary/view";
   }
   @RequestMapping("list")
   @ResponseBody
   public Object query(QueryObjects qo){
       return dataDictionaryService.query(qo);
   }

    @RequestMapping("listAll")
    @ResponseBody
    public Object listAll() {
        return dataDictionaryService.list();
    }

    @RequestMapping("input")
    public String list(Model model, Long id) throws Exception {
        if (id != null) {
            model.addAttribute("entity", dataDictionaryService.get(id));
        }
        return "dataDictionary/input";
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(DataDictionary entity){
        JsonResult result = new JsonResult();
        try {
            dataDictionaryService.saveOrUpdate(entity);
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
            dataDictionaryService.delete(id);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg(e.getMessage());
            return result;
        }
    }


}
