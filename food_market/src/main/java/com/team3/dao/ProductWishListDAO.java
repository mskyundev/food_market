package com.team3.dao;

import java.util.List;
import java.util.Map;

import com.team3.vo.ProductVO;
import com.team3.vo.ProductWishListVO;

public interface ProductWishListDAO {
	public int wishListSelect(ProductWishListVO ProductWishListVO) throws Exception;

	public void wishListWrite(ProductWishListVO ProductWishListVO) throws Exception;
	
	public int wishListCountData() throws Exception;
	
	public void wishListDelete(ProductWishListVO ProductWishListVO) throws Exception;
	
	public int wishListProductCountData(int product_pd_idx) throws Exception;
	
	public List<ProductVO> wishListMember(Map map) throws Exception;
	
	public int wishListMemberCountData(String mb_id) throws Exception;
//
//	public List<pd_reviewVO> reviewListCriteria(Map map) throws Exception;
//	//판매자 페이지	
//	public int reviewListCountData(pd_reviewVO pd_reviewVO) throws Exception;
//	
//	public double reviewStarAVG(int product_pd_idx)  throws Exception;

}
