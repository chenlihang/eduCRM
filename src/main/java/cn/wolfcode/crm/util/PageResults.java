package cn.wolfcode.crm.util;

import lombok.Getter;

import java.util.Collections;
import java.util.List;

/**
 * 基础分页
 * @author CrystalBaby
 */
@Getter
public class PageResults {
    public static final PageResults EMPTY_PAGE = new PageResults(1, 5, Collections.EMPTY_LIST, 0);
    private int currentPage;
    private int pageSize;
    private List<?> data;
    private Integer rows;
    private int endPage;
    private int prevPage;
    private int nextPage;

    public PageResults(int currentPage, int pageSize, List<?> data, Integer rows) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.data = data;
        this.rows = rows;
        if (rows <= pageSize) {
            endPage = 1;
            prevPage = 1;
            nextPage = 1;
            return;
        }
        endPage = rows % pageSize == 0 ? rows / pageSize : rows / pageSize + 1;
        prevPage = currentPage - 1 > 0 ? currentPage - 1 : 1;
        nextPage = currentPage + 1 > endPage ? endPage : currentPage + 1;
    }

}
