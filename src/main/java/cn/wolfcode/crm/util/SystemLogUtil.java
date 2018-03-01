package cn.wolfcode.crm.util;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.domain.SystemLog;
import cn.wolfcode.crm.mapper.SystemLogMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

public class SystemLogUtil {
    @Autowired
    private SystemLogMapper systemLogMapper;

    public void writeLog(JoinPoint joinPoint){
        SystemLog log = new SystemLog();
        log.setOpTime(new Date());
        Subject subject = SecurityUtils.getSubject();
        Object principal = subject.getPrincipal();
        if (principal != null){
            log.setOpUser((Employee) principal);
        }

        HttpServletRequest request = RequestlUtil.requestThreadLocal.get();
        //设置操作的IP
        log.setOpIP(request.getRemoteAddr());
        //表达式
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        log.setFunction(className + ":" + methodName);

        try {
            log.setParams(new ObjectMapper().writeValueAsString(joinPoint.getArgs()));
        }catch (JsonProcessingException e){
            e.printStackTrace();
        }

        systemLogMapper.insert(log);
    }
}
