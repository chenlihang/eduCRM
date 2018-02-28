package cn.wolfcode.crm.util;

import javax.servlet.http.HttpServletRequest;

public class RequestlUtil {

    public static ThreadLocal<HttpServletRequest> requestThreadLocal = new ThreadLocal <>();
}
