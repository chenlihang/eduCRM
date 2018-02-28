package cn.wolfcode.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class QueryObjects {
    private int pageSize = 5;
    private int currentPage = 1;
    public int getStart(){
        return (currentPage-1)*pageSize;
    }
}
