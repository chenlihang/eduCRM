package cn.wolfcode.crm.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ControllerAdvice
public class ControllerExceptionHandler {
    @ExceptionHandler(AuthorizationException.class)
    public void handleException(HandlerMethod method, HttpServletResponse response) throws IOException {
        if (method.getMethod().isAnnotationPresent(ResponseBody.class)) {
            response.getWriter().write(new ObjectMapper().writeValueAsString(new JsonResult().setErrorMsg("你没有权限执行该操作")));
        }else{
            response.sendRedirect("/static/common/nopermission.jsp");
        }
    }
}
