package com.team3.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.OrdersDAO;
import com.team3.vo.CartVO;
import com.team3.vo.OrdersVO;

@Service
public class OrdersServiceImp implements OrdersService {

	@Inject
	OrdersDAO OrdersDAO;
	//주문 정보 추가
	@Override
	public void insertorder(OrdersVO odVO) {
		OrdersDAO.insertorder(odVO);
	}
	//주문 상품정보 추가
	@Override
	public void insertorder_pd(OrdersVO odVO) {
		OrdersDAO.insertorder_pd(odVO);
	}
	//주문 상세정보 조회
	@Override
	public List<OrdersVO> orderdetail(OrdersVO odVO) {
		return OrdersDAO.orderdetail(odVO);
	}
	//주문완료 후 상품 재고 차감
	@Override
	public void updateSub_pd_amount(OrdersVO odVO) {
		OrdersDAO.updateSub_pd_amount(odVO);
		
	}
	//주문완료 총 합계 금액
	@Override
	public String selectpay(OrdersVO odVO) {
		
		return OrdersDAO.selectpay(odVO);
	}
	//주문 정보 조회
	@Override
	public List<OrdersVO> listorder(OrdersVO odVO) {
		return OrdersDAO.listorder(odVO);
	}
	//주문취소 후 상품 재고 추가
	@Override
	public void updateAdd_pd_amount(OrdersVO odVO) {
		OrdersDAO.updateAdd_pd_amount(odVO);
		
	}
	//주문완료 후 장바구니 내 주문상품 삭제
	@Override
	public void deletecart(CartVO cartVO) {
		OrdersDAO.deletecart(cartVO);
		
	}
	//배송상태 변경
	@Override
	public void update_delivery(OrdersVO odVO) {
		OrdersDAO.update_delivery(odVO);
	}
	//주문취소 후 주문정보 삭제
	@Override
	public void delete_order(OrdersVO odVO) {
		OrdersDAO.delete_order(odVO);
	}
	//주문취소 후 주문 상품정보 삭제
	@Override
	public void delete_order_pd(OrdersVO odVO) {
		OrdersDAO.delete_order_pd(odVO);
	}

	
}


