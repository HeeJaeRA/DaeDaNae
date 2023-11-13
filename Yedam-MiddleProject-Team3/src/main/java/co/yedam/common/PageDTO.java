package co.yedam.common;

public class PageDTO {
	
	int total;
	int currentPage;
	boolean prev, next;
	int startPage, endPage;
	int boardNo;
	
	public PageDTO(int boardNo, int total, int currnetPage) {
		this.boardNo = boardNo;
		this.total = total;
		this.currentPage = currnetPage;
		
		int lastPage = (int) Math.ceil(total / 5.0);
		
		this.endPage = (int) Math.ceil(currnetPage / 10.0) * 10;
		this.startPage = this.endPage - 9;
		
		this.endPage = this.endPage > lastPage ? lastPage : this.endPage;
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < lastPage;
	}

}
