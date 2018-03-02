package cn.wolfcode.crm.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ClassroomQueryObject extends QueryObjects{
    private String keyword;
    private Boolean state;
}
