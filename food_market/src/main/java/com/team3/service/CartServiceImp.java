package com.team3.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.CartDAO;
import com.team3.vo.CartVO;

@Service
public class CartServiceImp implements CartService {


	@Inject
	CartDAO cartDAO;
	
	//장바구니신규 추가
	@Override
	public void insert(CartVO cartdto) {
		cartDAO.insert(cartdto);
	}

	//장바구니 목록
	@Override
	public List<CartVO> listcart(String mb_id) {
		
		return cartDAO.listcart(mb_id);
	}
	
	//장바구니 선택삭제
	@Override
	public void delete(CartVO cartdto) {
		cartDAO.delete(cartdto);
	}
	
	


	//장바구니 전체삭제
	@Override
	public void deleteAll(String mb_id) {
		cartDAO.deleteAll(mb_id);
	}
	
	//장바구니 금액
	@Override
	public int cartmoney(String mb_id) {
		return cartDAO.cartmoney(mb_id);
	}
	
	
	//장바구니 갯수
	@Override
	public int countCart(String mb_id, int pd_idx) {
		return cartDAO.countCart(mb_id, pd_idx);
	}
	
	//장바구니 기존상품 갯수추가
	@Override
	public void updateCart(CartVO cartdto) {
		cartDAO.updateCart(cartdto);
	}

	//장바구니 상품 수량변경
	@Override
	public void modifyCart(CartVO cartdto) {
		cartDAO.modifyCart(cartdto);
	}
	
	
}

