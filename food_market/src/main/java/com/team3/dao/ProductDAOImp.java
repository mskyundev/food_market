package com.team3.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.page.FindCriteria;
import com.team3.vo.MemberVO;
import com.team3.vo.ProductVO;

@Repository
public class ProductDAOImp implements ProductDAO {

	private static final String namespace="com.team3.mapper.productmapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	
	@Override
	public void insert(ProductVO ProductVO) throws Exception{
		sqlSession.insert(namespace + ".insert", ProductVO);
	}
	// 
	@Override
	public ProductVO read(int bid) throws Exception{
		return sqlSession.selectOne(namespace + ".read", bid);
	}
	// 
	@Override
	public void update(ProductVO bvo) throws Exception{
		sqlSession.update("update", bvo);
	}
	// 
	@Override
	public void hitUp(int bid) throws Exception{
		sqlSession.update("hitUp", bid);
	}
	// 
	@Override
	public void delete(int bid) throws Exception{
		sqlSession.delete("delete", bid);
	}
	
	//판매자 페이지 
	@Override
	public List<ProductVO> sellerListCriteria(Map map) throws Exception{
		return sqlSession.selectList(namespace + ".sellerListCriteria",map);
	}
	//판매자 페이지 
	@Override
	public int sellerListCountData(MemberVO mvo) throws Exception {
		return sqlSession.selectOne(namespace+".sellerListCountData", mvo);
	}
	//상품 전체 갯수 세기
	@Override
	public int listCountData() throws Exception {
		return sqlSession.selectOne(namespace+".listCountData");
	}
	// 
	@Override
	public List<ProductVO> listFind(FindCriteria findCri) throws Exception{
		return sqlSession.selectList("listFind", findCri);
	}
	// 
	@Override
	public int findCountData(FindCriteria findCri) throws Exception{
		return sqlSession.selectOne("findCountData", findCri);
	}
}


