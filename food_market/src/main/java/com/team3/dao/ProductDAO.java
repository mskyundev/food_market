package com.team3.dao;

import java.util.List;
import java.util.Map;

import com.team3.page.FindCriteria;
import com.team3.vo.MemberVO;
import com.team3.vo.ProductVO;


public interface ProductDAO {
	public void insert(ProductVO productVO) throws Exception;

	public ProductVO read(int bid) throws Exception;

	public void update(ProductVO productVO) throws Exception;

	public void hitUp(int bid) throws Exception;

	public void delete(int bid) throws Exception;

	// 판매자 페이지
	public List<ProductVO> sellerListCriteria(Map map) throws Exception;

	// 판매자 페이지
	public int sellerListCountData(MemberVO mvo) throws Exception;

	// 상품 전체 갯수 세기
	public int listCountData() throws Exception;

	public List<ProductVO> listFind(FindCriteria findCri) throws Exception;

	public int findCountData(FindCriteria findCri) throws Exception;
}
