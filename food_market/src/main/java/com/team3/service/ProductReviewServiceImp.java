package com.team3.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.ProductReviewDAO;
import com.team3.vo.ProductReviewVO;

@Service
public class ProductReviewServiceImp implements ProductReviewService {

	@Inject
	private ProductReviewDAO ProductReviewDAO;
	
	@Override
	public void reviewWrite(ProductReviewVO ProductReviewVO) throws Exception{
		ProductReviewDAO.reviewWrite(ProductReviewVO);
	}
	
	@Override
	public int reviewCountData() throws Exception {
		return ProductReviewDAO.reviewCountData();
	}

	@Override
	public List<ProductReviewVO> reviewListCriteria(Map<String,Object> map) throws Exception{
		return ProductReviewDAO.reviewListCriteria(map);
	}

	@Override
	public int reviewListCountData(ProductReviewVO ProductReviewVO) throws Exception{
		return ProductReviewDAO.reviewListCountData(ProductReviewVO);
	} 
	
	
	//평점 평균 구하기
	@Override
	public double reviewStarAVG(int product_pd_idx) throws Exception{
		return ProductReviewDAO.reviewStarAVG(product_pd_idx);
	} 
	

}
