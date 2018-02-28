package cn.wolfcode.crm.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Collections;
import java.util.List;

@Getter@AllArgsConstructor@NoArgsConstructor
public class PageResult {
    public static final PageResult EMPTY_RESULT=new PageResult(0, Collections.EMPTY_LIST);
    private int total;
    private List rows;

}
