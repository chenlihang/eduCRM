package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.DataDictionaryItem;
import cn.wolfcode.crm.mapper.DataDictionaryItemMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IDataDictionaryItemService;
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
public class DataDictionaryItemServiceImpl implements IDataDictionaryItemService {
    @Autowired
    private DataDictionaryItemMapper dataDictionaryItemMapper;


    @Override
    public void saveOrUpdate(DataDictionaryItem entity) {
        if (entity.getId() == null) {
            dataDictionaryItemMapper.insert(entity);
        }else{
            dataDictionaryItemMapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public void delete(Long id) {
        dataDictionaryItemMapper.deleteByPrimaryKey(id);
    }

    @Override
    public DataDictionaryItem get(Long id) {
        return dataDictionaryItemMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<DataDictionaryItem> list() {
        return dataDictionaryItemMapper.selectAll();
    }

    @Override
    public List<DataDictionaryItem> selectItemByParentSn(String sn) {
        return this.dataDictionaryItemMapper.selectItemByParentSn(sn);
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int count = dataDictionaryItemMapper.queryCount(qo);
        if(count<=0){
            return PageResults.EMPTY_PAGE;
        }
        return new PageResults(qo.getCurrentPage(),qo.getPageSize(),dataDictionaryItemMapper.queryList(qo),count);
    }
}
