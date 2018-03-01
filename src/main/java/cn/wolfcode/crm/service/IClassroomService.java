package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Classroom;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.util.PageResults;

import java.util.List;

public interface IClassroomService {
    int deleteByPrimaryKey(Long id);

    int insert(Classroom classroom);

    int saveOrUpdate(Classroom classroom);

    Classroom selectByPrimaryKey(Long id);



    List<Classroom> selectAll();

    int updateByPrimaryKey(Classroom classroom);

    PageResults query(QueryObjects qo);

    void updateState(Long id);
}
