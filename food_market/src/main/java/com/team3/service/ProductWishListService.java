package com.team3.service;

import java.util.List;
import java.util.Map;

import com.team3.vo.ProductVO;
import com.team3.vo.ProductWishListVO;

public interface ProductWishListService {

	//있는지 없는지
	public int wishListSelect(ProductWishListVO ProductWishListVO) throws Exception;

	//insert
	public void wishListWrite(ProductWishListVO ProductWishListVO) throws Exception;
	
	//count
	public int wishListCountData() throws Exception;

	//delete
	public void wishListDelete(ProductWishListVO ProductWishListVO) throws Exception;
	
	//상품번호 기준 찜 갯수 가져오기 
	public int wishListProductCountData(int product_pd_idx) throws Exception;
	
	//구매자 기준 list들고오기 
	public List<ProductVO> wishListMember(Map<String,Object> map) throws Exception;
	
	public int wishListMemberCountData(String mb_id) throws Exception;
	
//	public double reviewStarAVG(int product_pd_idx) throws Exception;
}

