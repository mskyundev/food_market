package com.team3.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.vo.CartVO;
import com.team3.vo.OrdersVO;

@Repository
public class OrdersDAOImp implements OrdersDAO {

	@Inject
	SqlSession sqlSession;
	
	private static final String Namespace = "com.team3.mapper.orderMapper";
	
	//주문 정보 추가
	@Override
	public void insertorder(OrdersVO odVO) {
		sqlSession.insert(Namespace + ".insertorder" , odVO);
	}
	//주문 상품정보 추가
	@Override
	public void insertorder_pd(OrdersVO odVO) {
		sqlSession.insert(Namespace + ".od_pd_insert", odVO);
	}
	//주문 정보 조회
	@Override
	public List<OrdersVO> listorder(OrdersVO odVO) {
		return sqlSession.selectList(Namespace + ".selectorder", odVO);
	}
	//주문 상세정보 조회
	@Override
	public List<OrdersVO> orderdetail(OrdersVO odVO) {
		return sqlSession.selectList(Namespace + ".selectorderdetail", odVO);
	}
	//주문완료 후 장바구니 내 주문상품 삭제
	@Override
	public void deletecart(CartVO cartVO) {
		sqlSession.delete(Namespace + ".orderdeletecart", cartVO);
		
	}
	
	//주문 총 합계 금액
	@Override
	public String selectpay(OrdersVO odVO) {
		
		return sqlSession.selectOne(Namespace + ".selectpay", odVO);
	}
	
	//배송상태 변경
	@Override
	public void update_delivery(OrdersVO odVO) {
		sqlSession.update(Namespace+".update_delivery", odVO);
	}
	
	//주문완료 후 상품 재고 차감
	@Override
	public void updateSub_pd_amount(OrdersVO odVO) {
		sqlSession.update(Namespace + ".updateSub_pd_amount", odVO);
		
	}
	//주문취소 후 상품 재고 추가
	@Override
	public void updateAdd_pd_amount(OrdersVO odVO) {
		sqlSession.update(Namespace + ".updateAdd_pd_amount", odVO);
		
	}
	
	//주문취소 후 주문정보 삭제
	@Override
	public void delete_order(OrdersVO odVO) {
		sqlSession.delete(Namespace + ".delete_order" , odVO);
	}
	
	//주문취소 후 주문상품정보 삭제
	@Override
	public void delete_order_pd(OrdersVO odVO) {
		sqlSession.delete(Namespace + ".delete_order_pd" , odVO);
	}
	
}


