package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter@Setter
public class Role extends BaseDomain{
    private String name;
    private String sn;
    private List<Permission> permissions = new ArrayList<>();
}