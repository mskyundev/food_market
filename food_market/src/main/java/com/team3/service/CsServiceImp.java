package com.team3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;

import com.team3.dao.CsDAO;
import com.team3.vo.AskVO;
import com.team3.vo.CsFileVO;
import com.team3.vo.CsVO;

@Service
public class CsServiceImp implements CsService {

//	@Resource(name="fileUtils")
//	private FileUtils fileUtils;
	
	@Inject
	private CsDAO dao;
	
	@Override
	public List<AskVO> selectAsk(Map<String, Object> map) throws Exception {
		return dao.selectAsk(map);
	}
	
	@Override
	public int countAsk() throws Exception {
		return dao.countAsk();
	}

	@Override
	public List<AskVO> searchAsk(Map<String, Object> map) throws Exception {
		return dao.searchAsk(map);
	}

	@Override
	public int countSearchAsk(String keyword) throws Exception {
		return dao.countSearchAsk(keyword);
	}
	
	@Override
	public List<AskVO> findAsk(Map<String, Object> map) throws Exception {
		return dao.findAsk(map);
	}

	@Override
	public int countFindAsk(int type) throws Exception {
		return dao.countFindAsk(type);
	}
	
	@Override
	public void writeCS(CsVO csVO) throws Exception {
		dao.writeCS(csVO);
	}

	@Override
	public int maxCount() throws Exception {
		return dao.maxCount();
	}

	@Override
	public List<CsVO> selectCS(Map<String, Object> map) throws Exception {
		return dao.selectCS(map);
	}
	
	@Override
	public int countCS() throws Exception {
		return dao.countCS();
	}

	@Override
	public Map<String, Object> viewCS(int cs_idx) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("read", dao.viewCS(cs_idx));
		List<Map<String, Object>> list = dao.selectCsFile(cs_idx);
		resultMap.put("fileList", list);
		
		return resultMap;
	}

	@Override
	public void updateCS(CsVO csVO) throws Exception {
		dao.updateCS(csVO);		
	}

	@Override
	public void deleteCS(int cs_idx) throws Exception {
		dao.deleteCS(cs_idx);		
	}

	@Override
	public void replyCS(CsVO csVO) throws Exception {
		dao.replyCS(csVO);
	}
	
	//============================ admin 사용  ============================
	
	// cs전체 리스트
	@Override
	public List<CsVO> csList(Map<String, Object> map) {
		return dao.csList(map);
	}
	// 전체 목록 수
	@Override
	public int csCount(Map<String, Object> map) {
		return dao.csCount(map);
	}
	// cs 타입별 리스트
	@Override
	public List<CsVO> cs_typeList(Map<String, Object> map) {
		return dao.cs_typeList(map);
	}
	// cs 타입별 목록 수
	@Override
	public int cs_typeCount(Map<String, Object> map) {
		return dao.cs_typeCount(map);
	}

	
	

}
