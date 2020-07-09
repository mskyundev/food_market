package com.team3.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.vo.PreOrdersVO;

@Repository
public class PreOrdersDAOImp implements PreOrdersDAO {
	
	@Inject
	SqlSession sqlSession;
	
	private static final String Namespace = "com.team3.mapper.orderMapper";
	
	//임시 결제 정보 추가
	@Override
	public void insertorder(PreOrdersVO PreOrdersVO) {
		sqlSession.insert(Namespace + ".insertpre" , PreOrdersVO);
	}
	//임시 결제 정보 조회
	@Override
	public List<PreOrdersVO> listpre(String mb_id) {
		return sqlSession.selectList(Namespace + ".selectPre", mb_id);
	}
	//결제할 총 금액
	@Override
	public int preSumMoney(String mb_id) {
		
		return sqlSession.selectOne(Namespace + ".preSumMoney", mb_id);
	}
	//임시 결제정보 유무 확인
	@Override
	public int countpre(String mb_id) {
		return sqlSession.selectOne(Namespace + ".countpre" , mb_id);
	}
	//임시 결제정보 삭제
	@Override
	public void deletepre(String mb_id) {
		sqlSession.delete(Namespace + ".deletepre" , mb_id);
	}
	

}
