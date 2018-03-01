package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Classroom;
import cn.wolfcode.crm.query.QueryObjects;

import java.util.List;

public interface ClassroomMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Classroom entity);

    Classroom selectByPrimaryKey(Long id);

    List<Classroom> selectAll();

    int updateByPrimaryKey(Classroom entity);
    int queryCount(QueryObjects qo);

    List<Classroom> queryList(QueryObjects qo);
    void updateState(Long id);
}