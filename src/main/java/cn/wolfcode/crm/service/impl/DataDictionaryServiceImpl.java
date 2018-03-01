package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.DataDictionary;
import cn.wolfcode.crm.mapper.DataDictionaryItemMapper;
import cn.wolfcode.crm.mapper.DataDictionaryMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IDataDictionaryService;
import cn.wolfcode.crm.util.PageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 实现类
 *
 * @author CrystalBaby
 */
@Service
public class DataDictionaryServiceImpl implements IDataDictionaryService{
    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;
    @Autowired
    private DataDictionaryItemMapper dataDictionaryItemMapper;

    @Override
    public void saveOrUpdate(DataDictionary entity) {
        if (entity.getId() == null) {
            dataDictionaryMapper.insert(entity);
        }else{
            dataDictionaryMapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public void delete(Long id) {
        dataDictionaryItemMapper.deleteByParentId(id);
        dataDictionaryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public DataDictionary get(Long id) {
        return dataDictionaryMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<DataDictionary> list() {
        return dataDictionaryMapper.selectAll();
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int count = dataDictionaryMapper.queryCount(qo);
        if(count<=0){
            return PageResults.EMPTY_PAGE;
        }
        return new PageResults(qo.getCurrentPage(),qo.getPageSize(),dataDictionaryMapper.queryList(qo),count);
    }
}
