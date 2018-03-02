package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Customer;
import cn.wolfcode.crm.domain.DataDictionary;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.mapper.CustomerMapper;
import cn.wolfcode.crm.mapper.DataDictionaryMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.ICustomerService;
import cn.wolfcode.crm.util.PageResults;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CustomerServiceImpl implements ICustomerService {
    @Autowired
    private CustomerMapper mapper;
    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Customer entity) {
        return mapper.insert(entity);
    }

    @Override
    public int saveOrUpdate(Customer entity) {
        if (entity.getId() == null) {
            Subject subject = SecurityUtils.getSubject();
            Employee employee = (Employee) subject.getPrincipal();
            entity.setInputUser(employee);
            entity.setInputTime(new Date());
            return mapper.insert(entity);
        } else {
            return mapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public Customer selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Customer> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Customer entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int count = mapper.queryCount(qo);
        if (count == 0) {
            return PageResults.EMPTY_PAGE;
        }
        List <Customer> list = mapper.queryList(qo);
        return new PageResults(qo.getCurrentPage(),qo.getPageSize(),list,count);
    }


    /**
     *
     * 获取所有字典明细放入List中
     * @return List DataDictionaryItem明细对象
     */

    @Override
    public List<DataDictionary> getDataDictionaryItemList1(){
        return dataDictionaryMapper.selectAll();
    }


}
