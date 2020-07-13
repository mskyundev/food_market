package com.team3.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.vo.ProductReviewVO;

@Repository
public class ProductReviewDAOImp implements ProductReviewDAO {


	private static final String namespace="com.team3.mappers.productReviewMapper";
	
	@Inject
	private SqlSession sqlSession;
	

	@Override
	public void reviewWrite(ProductReviewVO ProductReviewVO) throws Exception {
		sqlSession.insert(namespace + ".reviewWrite", ProductReviewVO);
	}
	
	//전체 리뷰 갯수 불러오기
	@Override
	public int reviewCountData() throws Exception {
		int reviewCountData = sqlSession.selectOne("reviewCountData");
		
		if(reviewCountData ==0) {
			reviewCountData=1;
		}
		
		return reviewCountData;
	}

	@Override
	public List<ProductReviewVO> reviewListCriteria(Map map) throws Exception {
		return sqlSession.selectList(namespace + ".reviewListCriteria",map);
	}

	@Override
	public int reviewListCountData(ProductReviewVO ProductReviewVO) throws Exception {
		return sqlSession.selectOne("reviewListCountData",ProductReviewVO);
	}

	@Override
	public double reviewStarAVG(int product_pd_idx) throws Exception {
	
		return sqlSession.selectOne("reviewStarAVG",product_pd_idx);
	}
}



