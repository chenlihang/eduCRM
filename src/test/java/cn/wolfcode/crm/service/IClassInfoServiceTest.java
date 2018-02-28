package cn.wolfcode.crm.service;

import cn.wolfcode.crm.query.ClassInfoQueryObject;
import cn.wolfcode.crm.util.PageResult;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class IClassInfoServiceTest {
    @Autowired
    private IClassInfoService classInfoService;

    @Test
    public void deleteByPrimaryKey() {
    }

    @Test
    public void insert() {
    }

    @Test
    public void saveOrUpdate() {
    }

    @Test
    public void selectByPrimaryKey() {
    }

    @Test
    public void selectAll() {
    }

    @Test
    public void updateByPrimaryKey() {
    }

    @Test
    public void query() {
        ClassInfoQueryObject queryObject = new ClassInfoQueryObject();
        queryObject.setKeyword("java");
        PageResult pageResult = classInfoService.query(queryObject);
        System.out.println(pageResult);
    }
}