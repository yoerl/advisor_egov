package egovframework.util;

public class Pagination {
	
	public Pagination() {
        this.currentPage = 1;
        this.cntPerPage = 10;
        this.pageSize = 5;
    }
	
	// 현재페이지
    private int currentPage;
    
    // 페이지당 출력할 페이지 갯수
    private int cntPerPage;
    
    // 화면 하단 페이지 사이즈 1~10, 10~20 20~30 ...
    private int pageSize;
    
    // 전체 데이터 개수 
    private int totalRecordCount;
    
    // 전체 페이지 개수 
    private int totalPageCount;
    
    // 페이지 리스트의 첫 페이지 번호
    private int firstPage;
    
    // 페이지 리스트의 마지막 페이지 번호
    private int lastPage;
    
    // 이전 페이지 번호 
    private int prevBlock;
    
    // 다음 페이지 번호 
    private int nextBlock;
    
    // SQL의 조건절에 사용되는 Offset
    private int offset;
    
    public void setTotalRecordCount(int totalRecordCount) {
        this.totalRecordCount = totalRecordCount;
 
        if (totalRecordCount > 0) {
            calculation();
        }
    }
 
    private void calculation() {
 
        // 전체 페이지 수 (현재 페이지 번호가 전체 페이지 수보다 크면 현재 페이지 번호에 전체 페이지 수를 저장)
        totalPageCount = ((totalRecordCount - 1) / this.getCntPerPage()) + 1;
        if (this.getCurrentPage() > totalPageCount) {
            this.setCurrentPage(totalPageCount);
        }
 
        // 페이지 리스트의 첫 페이지 번호
        if( this.getCurrentPage() < (double)(pageSize/2) ) {
        	firstPage = 1;
        } else {
        	firstPage = this.getCurrentPage() - (pageSize/2 - 1);	
        }
 
        // 페이지 리스트의 마지막 페이지 번호 (마지막 페이지가 전체 페이지 수보다 크면 마지막 페이지에 전체 페이지 수를 저장)
        lastPage = firstPage + this.getPageSize() - 1;
        if (lastPage > totalPageCount) {
            lastPage = totalPageCount;
        }
 
        //getNextBlock
        getNextBlock();
        getPrevBlock();
        
        // SQL의 조건절에 사용되는 Offset
        offset = (this.getCurrentPage() - 1) * this.getCntPerPage();
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
		if(this.prevBlock < 1) this.prevBlock = 1;
		return this.prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		this.nextBlock = currentPage + 1;
		if(this.nextBlock > this.totalPageCount) this.nextBlock = this.totalPageCount;
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
