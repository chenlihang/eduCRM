package cn.wolfcode.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class KeyaccountQueryObject extends QueryObjects{
    private String keyword;
    private Long subjectId=-1L;

    public String getKeyword()
    {
        return this.keyword.length()==0||this.keyword==null?null:this.keyword;
    }

}
