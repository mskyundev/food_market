package com.team3.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.vo.ProductVO;
import com.team3.vo.ProductWishListVO;

@Repository
public class ProductWishListDAOImp implements ProductWishListDAO {

	private static final String namespace="com.team3.mappers.productWishListMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int wishListSelect(ProductWishListVO ProductWishListVO) throws Exception {
		return sqlSession.selectOne("wishListSelect",ProductWishListVO);
	}
	
	@Override
	public void wishListWrite(ProductWishListVO ProductWishListVO) throws Exception {
		sqlSession.insert(namespace + ".wishListWrite", ProductWishListVO);
	}

	@Override
	public int wishListCountData() throws Exception {
		return sqlSession.selectOne("wishListCountData");
	}

	@Override
	public void wishListDelete(ProductWishListVO ProductWishListVO) throws Exception {
		sqlSession.delete(namespace + ".wishListDelete", ProductWishListVO);
	}
	
	@Override
	public int wishListProductCountData(int product_pd_idx) throws Exception {
		return sqlSession.selectOne("wishListProductCountData", product_pd_idx);
	}
	
	@Override
	public List<ProductVO> wishListMember(Map map) throws Exception {
		return sqlSession.selectList(namespace + ".wishListMember",map);
	}
	
	
	@Override
	public int wishListMemberCountData(String mb_id) throws Exception {
		return sqlSession.selectOne("wishListMemberCountData", mb_id);
	}
	
	
//	@Override
//	public List<pd_reviewVO> reviewListCriteria(Map map) throws Exception {
//		return sqlSession.selectList(namespace + ".reviewListCriteria",map);
//	}
//
//	@Override
//	public int reviewListCountData(pd_reviewVO pd_reviewVO) throws Exception {
//		return sqlSession.selectOne("reviewListCountData",pd_reviewVO);
//	}
//
//	@Override
//	public double reviewStarAVG(int product_pd_idx) throws Exception {
//	
//		return sqlSession.selectOne("reviewStarAVG",product_pd_idx);
//	}
}


