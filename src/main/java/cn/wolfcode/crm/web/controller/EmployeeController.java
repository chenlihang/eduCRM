package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Department;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.query.EmployeeQueryObject;
import cn.wolfcode.crm.service.IDepartmentService;
import cn.wolfcode.crm.service.IEmployeeService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PageResult;
import cn.wolfcode.crm.util.PermissionName;
import jxl.CellType;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("employee")
public class EmployeeController {
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IDepartmentService departmentService;

    @RequestMapping("view")
    @RequiresPermissions("employee:view")
    @PermissionName("员工列表")
    public String view(Model model) {
        model.addAttribute("url", "/employee/view.do");
        model.addAttribute("employees", employeeService.selectAll());
        return "employee/view";
    }

    @RequestMapping("list")
    @ResponseBody
    public void list(Model model) {
        model.addAttribute("url", "/employee/view.do");

    }
    @RequestMapping("query")
    @ResponseBody
    public PageResult query(EmployeeQueryObject qo) {
        return employeeService.query(qo);
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Employee> listAll   () {
        return employeeService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Employee employee) {
        try {
            employeeService.saveOrUpdate(employee);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().setErrorMsg("保存失败");
        }
        return new JsonResult();
    }

    @RequestMapping("updateState")
    @ResponseBody
    public JsonResult updateState(Long id) {
        employeeService.updateState(id);
        return new JsonResult();
    }

    @RequestMapping("exportXls")
    @ResponseBody
    public void exportXls(HttpServletResponse response) throws IOException, WriteException {
        try {
            //文件下载响应头
            response.setHeader("Content-Disposition", "attachment;filename=employee.xls");
            //创建xls文件
            WritableWorkbook workbook = Workbook.createWorkbook(response.getOutputStream());
            //创建工作簿
            WritableSheet sheet = workbook.createSheet("employee", 0);
            //添加标题
            sheet.addCell(new Label(0, 0, "用户名"));
            sheet.addCell(new Label(1, 0, "真实姓名"));
            sheet.addCell(new Label(2, 0, "电话"));
            sheet.addCell(new Label(3, 0, "邮箱"));
            sheet.addCell(new Label(4, 0, "部门"));
            sheet.addCell(new Label(5, 0, "入职日期"));
            sheet.addCell(new Label(6, 0, "状态"));
            sheet.addCell(new Label(7, 0, "是否管理员"));
            //把数据库查询到的内容添加到xls中
            List <Employee> list = employeeService.selectAll();
            for (int i = 1; i <= list.size(); i++) {
                Employee e = list.get(i - 1);
                sheet.addCell(new Label(0, i, e.getUsername() != null ? e.getUsername() : ""));
                sheet.addCell(new Label(1, i, e.getRealname() != null ? e.getRealname() : ""));
                sheet.addCell(new Label(2, i, e.getTel() != null ? e.getTel() : ""));
                sheet.addCell(new Label(3, i, e.getEmail() != null ? e.getEmail() : ""));
                sheet.addCell(new Label(4, i, e.getDept() != null ? e.getDept().getName() : ""));
                if (e.getInputTime() != null) {
                    sheet.addCell(new DateTime(5, i, e.getInputTime()));
                } else {
                    sheet.addCell(new Label(5, i, ""));
                }
                sheet.addCell(new Label(6, i, e.getState() != null ? e.getState().toString() : ""));
                sheet.addCell(new Label(7, i, e.getAdmin() != null ? e.getAdmin().toString() : ""));
            }
            //写入数据
            workbook.write();
            //关闭资源
            workbook.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("importXls")
    @ResponseBody
    public void importXls(MultipartFile file) throws IOException, WriteException {
        try {
            Workbook workbook = Workbook.getWorkbook(file.getInputStream());
            Sheet sheet = workbook.getSheet(0);
            int rows = sheet.getRows();
            for (int i = 1;i<rows;i++){
                Employee e = new Employee();
                e.setUsername(sheet.getCell(0,i).getContents());
                e.setRealname(sheet.getCell(1,i).getContents());
                e.setTel(sheet.getCell(2,i).getContents());
                e.setEmail(sheet.getCell(3,i).getContents());
                Department dept = departmentService.selectByName(sheet.getCell(4,i).getContents());
                e.setDept(dept);
                Date date=null;
                if(sheet.getCell(5,i).getType() == CellType.DATE){
                    DateCell dc = (DateCell)sheet.getCell(5,i);
                    date = dc.getDate();
                }
                e.setInputTime(date);
                e.setState("true".equals(sheet.getCell(6,i).getContents()));
                e.setAdmin("true".equals(sheet.getCell(7,i).getContents()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
