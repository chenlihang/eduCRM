package cn.wolfcode.crm.util;

import java.util.Calendar;
import java.util.Date;

/**
 * 日期格式化用于查询结束时间控制
 * @author CrystalBaby
 */

public enum DateUtils {
    instance;

    public Date getEndDate(Date date){
       if(date==null){
           return null;
       }
       Calendar calendar = Calendar.getInstance();
       calendar.setTime(date);
       calendar.set(Calendar.HOUR,23);
       calendar.set(Calendar.SECOND,59);
       calendar.set(Calendar.MINUTE,59);
       return calendar.getTime();
    }
}
