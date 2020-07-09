package com.team3.dao;

import java.util.List;
import java.util.Map;

import com.team3.vo.ProductReviewVO;

public interface ProductReviewDAO {

	public void reviewWrite(ProductReviewVO ProductReviewVO) throws Exception;
	
	public int reviewCountData() throws Exception;

	public List<ProductReviewVO> reviewListCriteria(Map map) throws Exception;
	//판매자 페이지	
	public int reviewListCountData(ProductReviewVO ProductReviewVO) throws Exception;
	
	public double reviewStarAVG(int product_pd_idx)  throws Exception;
	
}
