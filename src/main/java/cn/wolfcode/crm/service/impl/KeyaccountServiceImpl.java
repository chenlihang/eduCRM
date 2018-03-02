package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.DataDictionaryItem;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.domain.Keyaccount;
import cn.wolfcode.crm.mapper.KeyaccountMapper;
import cn.wolfcode.crm.query.QueryObjects;
import cn.wolfcode.crm.service.IKeyaccountService;
import cn.wolfcode.crm.util.PageResults;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

@Service
public class KeyaccountServiceImpl implements IKeyaccountService {
    @Autowired
    private KeyaccountMapper keyaccountMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {

        return keyaccountMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Keyaccount entity) {
        return keyaccountMapper.insert(entity);
    }

    @Override
    public int saveOrUpdate(Keyaccount entity) {
        if (entity.getId() == null) {
            return keyaccountMapper.insert(entity);
        } else {
            return keyaccountMapper.updateByPrimaryKey(entity);
        }
    }

    @Override
    public Keyaccount selectByPrimaryKey(Long id) {
        return keyaccountMapper.selectByPrimaryKey(id);
    }

    @Override
    public List <Keyaccount> selectAll() {
        return keyaccountMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Keyaccount entity) {
        return keyaccountMapper.updateByPrimaryKey(entity);
    }

    @Override
    public PageResults query(QueryObjects qo) {
        int totalcount = keyaccountMapper.queryCount(qo);
        if (totalcount == 0) {
            return PageResults.EMPTY_PAGE;
        }


        int currentPage=qo.getCurrentPage();
        int pageSize=qo.getPageSize();
        List <Keyaccount> list = keyaccountMapper.queryList(qo);
        PageResults result = new PageResults(currentPage, pageSize, list, totalcount);
        if(SecurityUtils.getSubject().hasRole("admin")||SecurityUtils.getSubject().hasRole("MarketingMgr"))
        {
            return result;

        }else if (SecurityUtils.getSubject().hasRole("MarketingPerson"))
        {

         Employee principal = (Employee) SecurityUtils.getSubject().getPrincipal();
            Long marketer_id = principal.getId();
            List<?> data = result.getData();
            Iterator<?> iterator = data.iterator();
            while (iterator.hasNext())
            {
                if (!((Keyaccount) iterator).getId().equals(marketer_id))
                {
                    iterator.remove();

                }
                iterator.next();


            }
            return result;

        }else {
            return PageResults.EMPTY_PAGE;
        }
    }

    @Override
    public List<DataDictionaryItem> selectDictionaryItemByDictionarySn(String sn) {
        return keyaccountMapper.selectDictionaryItemByDictionarySn(sn);
    }

    @Override
    public int signContract(Long id,boolean customerStatus) {
        return keyaccountMapper.updateCustomerStatus(id,!customerStatus);
    }


}
