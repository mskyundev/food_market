package com.team3.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.vo.AskVO;
import com.team3.vo.CsFileVO;
import com.team3.vo.CsVO;

@Repository
public class CsDAOImp implements CsDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.team3.mappers.CsMapper";
	
	@Override
	public List<AskVO> selectAsk(Map<String, Object> map) throws Exception {		
		return sqlSession.selectList(Namespace+".selectAsk", map);
	}

	@Override
	public int countAsk() throws Exception {
		return (Integer)sqlSession.selectOne(Namespace+".countAsk");
	}

	@Override
	public List<AskVO> searchAsk(Map<String, Object> map) {
		return sqlSession.selectList(Namespace+".searchAsk", map);
	}

	@Override
	public int countSearchAsk(String keyword) throws Exception {
		return (Integer)sqlSession.selectOne(Namespace+".countSearchAsk", keyword);
	}
	
	@Override
	public List<AskVO> findAsk(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(Namespace+".findAsk", map);
	}

	@Override
	public int countFindAsk(int type) throws Exception {
		return (Integer)sqlSession.selectOne(Namespace+".countFindAsk", type);
	}

	@Override
	public void writeCS(CsVO csVO) throws Exception {
		sqlSession.insert(Namespace+".insertCS", csVO);		
	}
	
	@Override
	public int maxCount() throws Exception {
		return (Integer)sqlSession.selectOne(Namespace+".maxCount");
	}

	@Override
	public List<CsVO> selectCS(Map<String, Object> map) throws Exception {		
		return sqlSession.selectList(Namespace+".selectCS", map);
	}
	
	@Override
	public int countCS() throws Exception {
		return (Integer)sqlSession.selectOne(Namespace+".countCS");
	}

	@Override
	public CsVO viewCS(int cs_idx) throws Exception {
		
		return sqlSession.selectOne(Namespace+".readCS", cs_idx);
	}

	@Override
	public void updateCS(CsVO csVO) throws Exception {
		sqlSession.update(Namespace+".updateCS", csVO);
	}

	@Override
	public void deleteCS(int cs_idx) throws Exception {
		sqlSession.delete(Namespace+".deleteCS", cs_idx);
		
	}

	@Override
	public void replyCS(CsVO csVO) throws Exception {
		sqlSession.insert(Namespace+".replyCS", csVO);
	}	
	
	@Override
	public List<Map<String, Object>> selectCsFile(int cs_idx) {
		return sqlSession.selectList(Namespace+".selectFileList", cs_idx);
	}

	@Override
	public void insertFile(CsFileVO csFileVO) throws Exception {
		sqlSession.insert(Namespace+".insertCsFile", csFileVO);		
	}

	//============================ admin 사용  ============================
	// 전체 목록 보기
	@Override
	public List<CsVO> csList(Map<String, Object> map) {
		return sqlSession.selectList(Namespace+".csList", map);
	}
	// 전체 목록 수
	@Override
	public int csCount(Map<String, Object> map) {
		return sqlSession.selectOne(Namespace+".csCount",map);
	}
	// cs 타입별 리스트
	@Override
	public List<CsVO> cs_typeList(Map<String, Object> map) {
		return sqlSession.selectList(Namespace+".cs_typeList",map);
	}
	// cs 타입별 목록 수
	@Override
	public int cs_typeCount(Map<String, Object> map) {
		return sqlSession.selectOne(Namespace+".cs_typeCount",map);
	}

}
