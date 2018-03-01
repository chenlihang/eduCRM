package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.SystemLog;
import cn.wolfcode.crm.mapper.SystemLogMapper;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.query.SystemLogQueryObject;
import cn.wolfcode.crm.service.ISystemLogService;
import cn.wolfcode.crm.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemLogServiceImpl implements ISystemLogService{
    @Autowired
    private SystemLogMapper systemLogMapper;

    @Override
    public List<SystemLog> selectAll() {
        return systemLogMapper.selectAll();
    }

    @Override
    public PageResult query(QueryObject qo) {
        int count = systemLogMapper.queryCount(qo);
        if (count == 0) {
            return PageResult.EMPTY_RESULT;
        }
        List<SystemLog> list = systemLogMapper.queryList(qo);

        return new PageResult(count,list);
    }
}
