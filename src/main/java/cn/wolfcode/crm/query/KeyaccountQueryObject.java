package cn.wolfcode.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class KeyaccountQueryObject extends QueryObjects{
    private String keyword;
    private Long subjectId=-1L;
    private Long marketerId=-1L;
    private  Boolean traceStateCon;

    public String getKeyword()
    {
        return this.keyword==null||this.keyword.length()==0?null:this.keyword;
    }

}
