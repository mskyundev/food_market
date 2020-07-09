package com.team3.service;

import java.util.List;
import java.util.Map;

import com.team3.vo.ProductReviewVO;

public interface ProductReviewService {

	//리뷰 입력하기 
	public void reviewWrite(ProductReviewVO ProductReviewVO) throws Exception;
	
	//리뷰 전체 갯수 세기
	public int reviewCountData() throws Exception;
	
	//해당 상품에 대한 리뷰 리스트 만들기 
	//상품 번호 들고가서 리뷰 list 불러오기 
	public List<ProductReviewVO> reviewListCriteria(Map<String,Object> map) throws Exception;
	
	//상품 번호 가지고 가서 review list 최대갯수 구하기 
	public int reviewListCountData(ProductReviewVO ProductReviewVO) throws Exception;
	
	//평점 평균 구하기
	public double reviewStarAVG(int product_pd_idx) throws Exception;
}

