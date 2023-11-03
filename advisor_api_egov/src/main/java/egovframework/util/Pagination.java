package egovframework.util;


public class Pagination {
    private static final int DEFAULT_CURRENT_PAGE = 1;
    private static final int DEFAULT_CNT_PER_PAGE = 10;
    private static final int DEFAULT_PAGE_SIZE = 5;

    private int currentPage;
    private int cntPerPage;
    private int pageSize;
    private int totalRecordCount;
    private int totalPageCount;
    private int firstPage;
    private int lastPage;
    private int prevBlock;
    private int nextBlock;
    private int offset;

    public Pagination() {
        this.currentPage = DEFAULT_CURRENT_PAGE;
        this.cntPerPage = DEFAULT_CNT_PER_PAGE;
        this.pageSize = DEFAULT_PAGE_SIZE;
    }

    public void setTotalRecordCount(int totalRecordCount) {
        this.totalRecordCount = totalRecordCount;

        if (totalRecordCount > 0) {
            calculation();
        }
    }

    private void calculation() {
        totalPageCount = (totalRecordCount - 1) / getCntPerPage() + 1;
        if (getCurrentPage() > totalPageCount) {
            setCurrentPage(totalPageCount);
        }

        firstPage = Math.max(1, getCurrentPage() - (getPageSize() / 2 - 1));
        lastPage = Math.min(firstPage + getPageSize() - 1, totalPageCount);

        getNextBlock();
        getPrevBlock();

        offset = (getCurrentPage() - 1) * getCntPerPage();
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getCntPerPage() {
        return cntPerPage;
    }

    public void setCntPerPage(int cntPerPage) {
        this.cntPerPage = cntPerPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getTotalRecordCount() {
        return totalRecordCount;
    }

    public int getPrevBlock() {
        this.prevBlock = currentPage - 1;
        if (this.prevBlock < 1) this.prevBlock = 1;
        return this.prevBlock;
    }

    public void setPrevBlock(int prevBlock) {
        this.prevBlock = prevBlock;
    }

    public int getNextBlock() {
        this.nextBlock = currentPage + 1;
        if (this.nextBlock > this.totalPageCount) this.nextBlock = this.totalPageCount;
        return this.nextBlock;
    }

    public void setNextBlock(int nextBlock) {
        this.nextBlock = nextBlock;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    @Override
    public String toString() {
        return "Pagination [currentPage=" + currentPage + ", cntPerPage=" + cntPerPage + ", pageSize=" + pageSize
                + ", totalRecordCount=" + totalRecordCount + ", totalPageCount=" + totalPageCount + ", firstPage="
                + firstPage + ", lastPage=" + lastPage + ", prevBlock=" + prevBlock + ", nextBlock=" + nextBlock
                + ", offset=" + offset + "]";
    }
}

