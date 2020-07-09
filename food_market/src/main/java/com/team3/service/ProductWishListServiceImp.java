package com.team3.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.ProductWishListDAO;
import com.team3.vo.ProductVO;
import com.team3.vo.ProductWishListVO;

@Service
public class ProductWishListServiceImp implements ProductWishListService {

	@Inject
	private ProductWishListDAO ProductWishListDAO;
	
	@Override
	public int wishListSelect(ProductWishListVO ProductWishListVO) throws Exception{
		return ProductWishListDAO.wishListSelect(ProductWishListVO);
	} 
	
	@Override
	public void wishListWrite(ProductWishListVO ProductWishListVO) throws Exception{
		ProductWishListDAO.wishListWrite(ProductWishListVO);
	}
	
	@Override
	public int wishListCountData() throws Exception {
		return ProductWishListDAO.wishListCountData();
	}
	
	
	//삭제
	@Override
	public void wishListDelete(ProductWishListVO ProductWishListVO) throws Exception{
		ProductWishListDAO.wishListDelete(ProductWishListVO);
	}
	
	@Override
	public int wishListProductCountData(int product_pd_idx) throws Exception {
		return ProductWishListDAO.wishListProductCountData(product_pd_idx);
	}
	
	@Override
	public List<ProductVO> wishListMember(Map<String,Object> map) throws Exception{
		return ProductWishListDAO.wishListMember(map);
	}
	
	@Override
	public int wishListMemberCountData(String mb_id) throws Exception {
		return ProductWishListDAO.wishListMemberCountData(mb_id);
	}
	
//
//	@Override
//	public List<pd_reviewVO> reviewListCriteria(Map map) throws Exception{
//		return productReviewDAO.reviewListCriteria(map);
//	}
//

//	
//	//평점 평균 구하기
//	@Override
//	public double reviewStarAVG(int product_pd_idx) throws Exception{
//		return productReviewDAO.reviewStarAVG(product_pd_idx);
//	} 
//	

}