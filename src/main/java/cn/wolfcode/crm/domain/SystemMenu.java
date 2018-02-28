package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter@Setter@ToString
public class SystemMenu extends BaseDomain{
    private String name;
    private String href;
    private List<SystemMenu> children;
    /*private Permission permission;*/
}