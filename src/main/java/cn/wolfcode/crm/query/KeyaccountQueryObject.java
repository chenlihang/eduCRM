package cn.wolfcode.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class KeyaccountQueryObject extends QueryObjects{
    private String keyword;
    private Long subjectId=-1L;

}
