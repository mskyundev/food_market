package com.team3.service;

import java.util.List;

import com.team3.vo.CartVO;

public interface CartService {
	//장바구니 신규 추가
	void insert(CartVO cartVO);
	//장바구니 목록
	List<CartVO> listcart(String mb_id);
	//장바구니 선택삭제
	void delete(CartVO cartVO);
	//장바구니 전체삭제
	void deleteAll(String mb_id);
	//장바구니 금액
	int cartmoney(String mb_id);
	//장바구니 목록 동일상품 확인
	int countCart(String mb_id , int pd_idx);
	//장바구니 기존 상품 갯수추가
	void updateCart(CartVO cartVO);
	//장바구니 상품 수량변경
	void modifyCart(CartVO cartVO);
}
