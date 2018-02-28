package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.SystemMenu;
import cn.wolfcode.crm.service.ISystemMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private ISystemMenuService systemMenuService;

    @RequestMapping("login")
    public String login(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
        /*String failure = (String) request.getAttribute("shiroLoginFailure");
        System.out.println(failure);*/
        return "redirect:/login.jsp";
    }

    @RequestMapping("main")
    public String main(Model model){
        List <SystemMenu> systemMenus = systemMenuService.loadMenu();
        model.addAttribute("menus", systemMenus);
        return "main2";
    }
}
