package com.team3.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.vo.CartVO;

@Repository
public class CartDAOImp implements CartDAO {
	@Inject
	SqlSession sqlSession;
	private static final String Namespace = "com.team3.mapper.cartMapper";
	
	//장바구니 신규 추가
	@Override
	public void insert(CartVO cartdto) {
		sqlSession.insert(Namespace + ".insertcart" , cartdto);
	}
	
	//장바구니 목록
	@Override
	public List<CartVO> listcart(String mb_id) {
		return sqlSession.selectList(Namespace + ".listCart" , mb_id);
	}
	
	//장바구니 선택삭제
	@Override
	public void delete(CartVO cartdto) {
		sqlSession.delete(Namespace + ".deletecart" , cartdto);
	}

	//장바구니 전체삭제
	@Override
	public void deleteAll(String mb_id) {
		sqlSession.delete(Namespace + ".deleteAll" , mb_id);
		
	}
	

	//장바구니 금액
	@Override
	public int cartmoney(String mb_id) {
		return sqlSession.selectOne(Namespace + ".cartmoney" , mb_id);
	}

	//장바구니 목록 내 동일 상품 확인
	@Override
	public int countCart(String mb_id, int pd_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pd_idx", pd_idx);
		map.put("mb_id", mb_id);
		
		return sqlSession.selectOne(Namespace + ".countcart" , map);
	}

	//장바구니 기존상품 갯수추가
	@Override
	public void updateCart(CartVO cartdto) {
		sqlSession.update(Namespace + ".update" , cartdto);
		
	}

	//장바구니 상품 수량변경
	@Override
	public void modifyCart(CartVO cartdto) {
		sqlSession.update(Namespace + ".modify" , cartdto);
		
	}

}


