package com.team3.service;

import java.util.List;

import com.team3.vo.CartVO;
import com.team3.vo.OrdersVO;

public interface OrdersService {
	//주문 정보추가
		void insertorder(OrdersVO odVO);
		//주문 상품정보 추가
		void insertorder_pd(OrdersVO odVO);
		//주문정보 조회
		List<OrdersVO> listorder(OrdersVO odVO);
		//주문 상세정보 조회
		List<OrdersVO> orderdetail(OrdersVO odVO);
		//주문완료된  후 장바구니 내 주문상품 삭제
		void deletecart(CartVO cartVO);
		//주문취소 후 정보 삭제
		void delete_order(OrdersVO odVO);
		//주문취소 후 상품정보 삭제
		void delete_order_pd(OrdersVO odVO);
		//배송상태 변경
		void update_delivery(OrdersVO odVO);
		//주문완료 총 합계금액
		String selectpay(OrdersVO odVO);
		//주문완료 후 상품 재고 차감
		void updateSub_pd_amount(OrdersVO odVO);
		//주문취소 후 상품 재고 추가
		void updateAdd_pd_amount(OrdersVO odVO);
	}


