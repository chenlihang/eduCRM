package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class Department extends BaseDomain{
    private String name;
    private String sn;
    private boolean state=true;//true可用
}