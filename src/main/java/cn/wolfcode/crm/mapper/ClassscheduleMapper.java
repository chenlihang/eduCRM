package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Classschedule;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.query.QueryObjects;

import java.util.List;

public interface ClassscheduleMapper {


    Classschedule selectByPrimaryKey(Long id);

    List<Classschedule> selectAll();
    int queryCount(QueryObjects qo);

    List<Classschedule> queryList(QueryObjects qo);

}