package com.team3.page;



public class PageCriteria {
	//페이지 기준 설정하기 
	private int page; //시작 페이지
	private int numPerPage; //한 페이지 당 게시글 수 

	//컨트롤러에서 자동으로 생성된다. 
	public PageCriteria(){
		this.page = 1;
		this.numPerPage = 15;
	}
	
	//페이지당 게시글수 설정
	public PageCriteria(int page, int numPerPage){
		this.page = page;
		this.numPerPage = numPerPage;
	}
	
	//현재 페이지 저장하기
	public void setPage(int page) {
		if(page<=0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setNumPerPage(int numPerPage){
		if (numPerPage <=0 || numPerPage > 100){
			this.numPerPage = 10;
			return;
		}
		
		this.numPerPage = numPerPage;
	}
	
	public int getPage(){
		return page;
	}
	
	public int getStartPage(){
		return (this.page-1)*numPerPage;
	}
	
	public int getNumPerPage(){
		return this.numPerPage;
	}
	
	@Override
	public String toString(){
		return "PageCriteria [page="+page+","+"numPerPage="+numPerPage+"]";
	}
	

}
