package com.team3.page;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

/*
 * [페이징 처리]

 # endPage와 startPage 구하기
   - endPage 구하기:
     endPage = (Math.ceil(현재페이지번호 / 페이지 목록에 나타낼 페이지 번호의 수)* 페이지 목록에 나타낼 페이지 번호의 수)
   - startPage 구하기 :  
     startPage = (endPage - 페이지 목록에 나타낼 페이지 번호의 수) +1
 
 # totalData(총 게시글 갯수)와 endPage(마지막 페이지)의 재계산
                   Math.ceil : 올림함수
 	finalEndPage = Math.ceil(totalData / 페이지에 보여줄 글의 갯수)
 	if(endPage > finalEndPage){
 		endPage = finalEndPage
 	}
  
 # Boolean타입 
   Prev(이전)과 next(다음) 계산
   prev = start == 1 ? false : true; //start가 1이면 이전페이지가 없으므로 false 1이 아니면 이전 페이지가 있으므로 true
   next = endPage * 페이지에 보여줄 글의 갯수 > totalData(총 게시글 갯수) ? false : true
    7 * 10 > 100개(false)이면 게시글이 더 있다는 뜻 ->  next가 보여야한다(true).
    7 * 10 > 50 개 (true)이면 게시글이 더 없다는 뜻 -> next가 없어도 되므로 false를 준다. 
 */
public class PagingMaker {
	
	private int totalData; // 모든 개시글 갯수
	private int startPage; // 한 페이지 목록의 시작번호
	private int endPage; // 한 페이지 목록의 끝번호
	private boolean prev; // true false 이전 페이지
	private boolean next; // true false 다음 페이지
	 
	private int displayPageNum = 10; //페이지 목록에 나타낼 페이지 번호의 수 예시 5개  ◀ 1 2 3 4 5 ▶
	
	private PageCriteria cri; //PageCriteria 객체 생성하기
	
	//setter
	public void setCri(PageCriteria cri){
		this.cri = cri;
	}
	
	//총 게시글 갯수 구하기 setter
	public void setTotalData(int totalData){
		this.totalData = totalData; 
		
		getPagingData(); //메서드 실행하기
	}
	
	
	private void getPagingData(){
		//Math.ceil : 올림 함수
		//cri.getPage() : 현재 페이지 구하기
		
								//현재 페이지 / 페이지 목록에 나타낼 페이지 번호의 수 * 페이지 목록에 나타낼 페이지 번호의 수
	//	   	20  =                       11  /  10.0(올림처리 하기 위해)   * 10
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum);
	//       11   =  ( 20 - 10 ) + 1 
		startPage = (endPage - displayPageNum) + 1;
		
	//                              총 게시글 갯수  /  한페이지 당 갯수
		//         5                   44          /  10
		int finalEndPage = (int)(Math.ceil(totalData/(double)cri.getNumPerPage()));
		//     1   >    5
		if(endPage > finalEndPage){
			endPage = finalEndPage;
		}
		
		prev = startPage == 1? false: true;
		
		next = endPage*cri.getNumPerPage() >= totalData ? false : true;
		
//		System.out.println("\n현재 페이지 : "+cri.getPage()+"\n startPage : "+startPage+" \n   endPage : "+endPage+"\n");
//		System.out.println("총 게시글 수 : "+totalData);
	}//getPagingData()
	
	
	//url만들기
	public String makeURI(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("numPerPage", cri.getNumPerPage())
				.build();		

//		System.out.println("\n uriComponents.toUriString()  : "+uriComponents.toUriString()+"\n");
		//uriComponents.toUriString()  : ?page=1&numPerPage=10
		return uriComponents.toUriString();
	}
	
	//검색 기능
	public String makeFind(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("numPerPage", cri.getNumPerPage())
				.queryParam("findType", ((FindCriteria)cri).getFindType())
				.queryParam("keyword", ((FindCriteria)cri).getKeyword())
				.build();
		
//		System.out.println("\n uriComponents.toUriString()  : "+uriComponents.toUriString()+"\n");
		return uriComponents.toUriString();
	}
	
	
	
	
	//setter, getter
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalData() {
		return totalData;
	}

	public PageCriteria getCri() {
		return cri;
	}
	
	
	
	
	
	
	
	
}

