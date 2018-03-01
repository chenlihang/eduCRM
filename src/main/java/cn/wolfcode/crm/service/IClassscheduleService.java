package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Classschedule;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IClassscheduleService {



    Classschedule selectByPrimaryKey(Long id);



    List<Classschedule> selectAll();


    PageResults query(QueryObjects qo);

}
