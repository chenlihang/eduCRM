package cn.wolfcode.crm.realm;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.mapper.EmployeeMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MyRealm extends AuthorizingRealm{
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public String getName() {
        return "MyRealm";
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String principal = (String) authenticationToken.getPrincipal();
        Employee e = employeeMapper.selectByUsername(principal);
        if (e == null) {
            return null;
        }
        System.out.println(e);
        return new SimpleAuthenticationInfo(e,e.getPassword(), this.getName());
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("----------------");
        Employee user = (Employee) SecurityUtils.getSubject().getPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if (user.getAdmin()) {
            info.addRole("admin");
            info.addStringPermission("*:*");
            return info;
        }
        List<String> permissions = employeeMapper.selectPermissionResourceByEmployeeId(user.getId());
        List <String> roles = employeeMapper.selectRoleNameByEmployeeId(user.getId());
        info.addRoles(roles);
        info.addStringPermissions(permissions);
        return info;
    }
}
