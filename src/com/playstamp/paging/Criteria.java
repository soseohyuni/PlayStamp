package com.playstamp.paging;


public class Criteria
{
	// 특정 페이지 조회를 위한 페이징 처리 클래스
	//-- 게시글 조회 쿼리에 전달될 파라미터를 담을 클래스
	
	private int page;          //-- 페이지
	private int perPageNum;    //-- 한 번에 보여줄 게시물 수
	private int rowStart;
	private int rowEnd;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		
		// 페이지가 음수가 되지 않게 설정
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		
		// 페이지당 보여줄 게시글 수가 변하지 않게 설정
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	// 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호
	public int getPageStart() {
		// 현재 페이지의 게시글 시작번호 = (현재 페이지번호 - 1) * 페이지당 보여줄 게시글 개수
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
}
