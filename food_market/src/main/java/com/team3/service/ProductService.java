package com.team3.service;

import java.util.List;
import java.util.Map;

import com.team3.page.FindCriteria;
import com.team3.vo.MemberVO;
import com.team3.vo.ProductVO;

public interface ProductService {
public void write(ProductVO ProductVO) throws Exception;
	
	public ProductVO read(Integer bid) throws Exception;
		
	public void modify(ProductVO ProductVO) throws Exception;
	
	public void hitUp(Integer bid) throws Exception;
	
	public void remove(Integer bid) throws Exception;
		
	//판매자 페이지
	public List<ProductVO> sellerListCriteria(Map<String,Object> map) throws Exception;
	//판매자 페이지
	public int sellerListCountData(MemberVO mvo) throws Exception;
	
	//상품 전체 갯수 세기
	public int listCountData() throws Exception;
	
	public List<ProductVO> listFind(FindCriteria findCri) throws Exception;
	
	public int findCountData(FindCriteria findCri) throws Exception;
	
}

