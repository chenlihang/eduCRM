package cn.wolfcode.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class ContactQueryObject extends QueryObjects{
    private String keyword;

    private Long keyaccountId;

}
