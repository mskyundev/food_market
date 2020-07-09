package com.team3.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.ProductDAO;
import com.team3.page.FindCriteria;
import com.team3.vo.MemberVO;
import com.team3.vo.ProductVO;

@Service
public class ProductServiceImp implements ProductService {

	@Inject
	private ProductDAO ProductDAO;
	
	@Override
	public void write(ProductVO ProductVO) throws Exception{
		ProductDAO.insert(ProductVO);
	}
	
	@Override
	public ProductVO read(Integer bid) throws Exception{
		return ProductDAO.read(bid);
	}
//	@Override
//	public ProductVO readtest(Integer bid) throws Exception{
//		return ProductDAO.readtest(bid);
//	}
	
	@Override
	public void modify(ProductVO ProductVO) throws Exception{
		ProductDAO.update(ProductVO);
	}
	
	@Override
	public void hitUp(Integer bid) throws Exception{
		ProductDAO.hitUp(bid);
	}
	
	@Override
	public void remove(Integer bid) throws Exception{
		ProductDAO.delete(bid);
	}
	
//	@Override
//	public List<ProductVO> list() throws Exception{
//		return ProductDAO.list();
//	}
//	
	
	
	//판매자 페이지 
	@Override
	public List<ProductVO> sellerListCriteria(Map map) throws Exception{
		return ProductDAO.sellerListCriteria(map);
	}
	//판매자 페이지
	@Override
	public int sellerListCountData(MemberVO mvo) throws Exception{
		return ProductDAO.sellerListCountData(mvo);
	} 
	
	//상품 전체 갯수 세기
	@Override
	public int listCountData() throws Exception {
		return ProductDAO.listCountData();
	}
	
	@Override
	public List<ProductVO> listFind(FindCriteria findCri) throws Exception{
		return ProductDAO.listFind(findCri);
	}
	
	@Override
	public int findCountData(FindCriteria findCri) throws Exception{
		return ProductDAO.findCountData(findCri);
	}


}
