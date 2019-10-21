package domain;

import java.io.Serializable;
import java.util.List;

public class PageResult<T> implements Serializable {
    private long totle;
    private List<T> rows;

    private int pageNum;
    private int pageSize;

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotle() {
        return totle;
    }

    public void setTotle(long totle) {
        this.totle = totle;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public PageResult(long totle, List<T> rows) {
        super();
        this.totle = totle;
        this.rows = rows;
    }
}
