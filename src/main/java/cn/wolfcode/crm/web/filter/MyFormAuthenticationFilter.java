package cn.wolfcode.crm.web.filter;

import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.RequestlUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class MyFormAuthenticationFilter extends FormAuthenticationFilter {

    /*如果用的是普通的表单提交的方式,可以直接通过shiro的filter的属性successUrl来配置成功后的跳转页面*/
    /*复写onLonginesSuccess方法,可以由我们来控制登录成功之后需要做的事情*/
    /*如果用ajax的方式来请求,因为必须有返回结果给到页面,如果直接用successUrl的方式配置,
    那么前台就会把返回的页面当做是相应的内容,放到data中,而不是在浏览器做渲染,所以要自己复写这2个方法,
    写一个json结果给页面,然后由页面来控制跳转*/
    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        response.getWriter().write(new ObjectMapper().writeValueAsString(new JsonResult()));
        return false;
    }
    @Override
    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request, ServletResponse response) {
        String errorMsg = "";
        if (e instanceof UnknownAccountException) {
            errorMsg = "账号不存在";
        } else if (e instanceof IncorrectCredentialsException) {
            errorMsg = "账号或密码错误";
        } else {
            errorMsg = "其他异常信息";
        }
        try {
            response.getWriter().write(new ObjectMapper().writeValueAsString(new JsonResult()));
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        return false;
    }


    /*
    * 复写这个方法,可以重复登录(第二次登录把第一次登录的信息给覆盖了)
    * 其实当前用户只可能有一次,但是shiro默认的配置是如果登录过一次,在还没注销的情况之下,不允许再次登录,即使是同一个用户也不行
    * 所以复写该方法
    */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        if (isLoginRequest(request,response)) {
            Subject subject = SecurityUtils.getSubject();
            if (subject.isAuthenticated()) {
                subject.logout();
            }
        }
        RequestlUtil.requestThreadLocal.set((HttpServletRequest) request);

        return super.isAccessAllowed(request, response, mappedValue);
    }
}
