package com.team3.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.page.PageCriteria;
import com.team3.vo.ProductQnaVO;

@Repository
public class ProductQnaDAOImp implements ProductQnaDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void qnainsert(ProductQnaVO qvo) throws Exception {
		sqlSession.insert("productqnainsert", qvo);
	}

//	@Override
//	public List<ProductQnaVO> list(ProductQnaVO qvo) throws Exception {
//		
//		return sqlSession.selectList("productqnalist");
//	}

	@Override
	public int getBoardReRef(ProductQnaVO qvo) throws Exception {
		
		return sqlSession.selectOne("getBoardReRef",qvo);
	}

	@Override
	public int maxnum(ProductQnaVO qvo) throws Exception {
		
		return sqlSession.selectOne("maxnum", qvo);
	}

	@Override
	public void qnareplyupdate(ProductQnaVO qvo) throws Exception {
		
		sqlSession.update("qnareplyupdate", qvo);
	}

	@Override
	public void qnareplywrite(ProductQnaVO qvo) throws Exception {
		
		sqlSession.insert("qnareplywrite",qvo);
	}

	@Override
	public ProductQnaVO getBoardReplyInfo(int qna_num) throws Exception {
		
		return sqlSession.selectOne("getBoardReplyInfo",qna_num);
	}

	@Override
	public List<ProductQnaVO> list(Map map) throws Exception {
		
		return sqlSession.selectList("productqnalist", map);
	}

	@Override
	public int countData(PageCriteria pCria) throws Exception {
		
		return sqlSession.selectOne("countData", pCria);
	}


	
//	@Override
//	public ProductQnaVO read(int qna_num) throws Exception {
//		
//		return sqlSession.selectOne("qnaread",qna_num);
//	}


	
	
	


}
