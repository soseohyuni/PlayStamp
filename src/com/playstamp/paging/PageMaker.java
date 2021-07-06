package com.playstamp.paging;

public class PageMaker
{
	// 페이징에 관련된 버튼들을 만드는 기능을 하는 클래스
	
	// pageMaker 클래스를 사용하려면 setCri()와 setTotalCount()를 먼저 호출해서
	// 값을 세팅해야 한다.
	
	private Criteria cri;
	private int totalCount;		//-- 총 게시글 수
	private int startPage;		//-- 화면에 보여질 첫 번째 페이지 번호 (시작 페이지 번호)
	private int endPage;		//-- 화면에 보여질 마지막 페이지 번호 (끝 페이지 번호)
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;	//-- 화면 하단에 보여지는 페이지 버튼의 수
	
	// 현재 페이지 번호 가져오기
	public Criteria getCri()
	{
	    return cri;
	}

	public void setCri(Criteria cri)
	{
	    this.cri = cri;
	}
	
	public int getTotalCount()
	{
	    return totalCount;
	}
	
	// 총 게시글 수 세팅시, calData() 메소드를 호출 해 페이징 관련 버튼 계산
	public void setTotalCount(int totalCount)
	{
	    this.totalCount = totalCount;
	    calcData();
	}
	
	// 끝 페이지 번호, 시작 페이지 번호,
	// 이전, 다음 버튼들을 구하는 메소드
	private void calcData()
	{
		// 마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글 수
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
 
        // 시작 페이지 번호 = (끝페이지 번호 - 화면에 보여질 페이지 번호의 개수) + 1
        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0) startPage = 1;
        
        // 마지막 페이지 번호 구한 뒤,
        // 끝 페이지 번호보다 작은 경우 마지막 페이지의 번호를 끝 페이지 번호로 저장
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        
        // 이전 버튼 생성 여부 = 시작 페이지 번호 == 1 체크
        prev = startPage == 1 ? false : true;
        
        // 다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글 개수 < 총 게시글의 수 체크
        next = endPage * cri.getPerPageNum() < totalCount ? true : false;  
	 }
	    
	 public int getStartPage()
	 {
	     return startPage;
	 }
	 public void setStartPage(int startPage) 
	 {
	     this.startPage = startPage;
	 }
	 public int getEndPage()
	 {
	      return endPage;
	 }
	 public void setEndPage(int endPage)
	 {
	      this.endPage = endPage;
	 }
	 public boolean isPrev() 
	 {
	      return prev;
	 }
	 public void setPrev(boolean prev) 
	 {
	      this.prev = prev;
	 }
	 public boolean isNext() 
	 {
	      return next;
	 }
	 public void setNext(boolean next) 
	 {
	      this.next = next;
	 }
	 public int getDisplayPageNum() 
	 {
	      return displayPageNum;
	 }
	 public void setDisplayPageNum(int displayPageNum) 
	 {
	      this.displayPageNum = displayPageNum;
	 }

}
