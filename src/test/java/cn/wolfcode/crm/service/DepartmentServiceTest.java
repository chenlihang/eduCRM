package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Department;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DepartmentServiceTest {
    @Autowired
    private IDepartmentService departmentService;

    @Test
    public void insert() {
        Department department = new Department();
        department.setName("xiaoxiaoxiao");
        department.setSn("xiao");
        department.setState(true);
        departmentService.insert(department);
    }

    @Test
    public void selectAll() {
        System.out.println(departmentService.selectAll());
    }

    @Test
    public void testMd5() throws Exception{
        Md5Hash md5Hash = new Md5Hash("1", "admin", 2);
        System.out.println(md5Hash);

    }
}