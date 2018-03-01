package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.SystemLog;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.query.SystemLogQueryObject;
import cn.wolfcode.crm.util.PageResult;

import java.util.List;

public interface ISystemLogService {

    List<SystemLog> selectAll();

    PageResult query(QueryObject qo);
}
