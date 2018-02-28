package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter@Getter
public class Department extends BaseDomain{
    private String sn;
    private String name;
    private boolean state=true;//true可用
    private Employee manager;
    private Department parent;
}