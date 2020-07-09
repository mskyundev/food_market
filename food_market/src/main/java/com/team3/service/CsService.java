package com.team3.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.team3.vo.AskVO;
import com.team3.vo.CsFileVO;
import com.team3.vo.CsVO;

public interface CsService {
	public List<AskVO> selectAsk(Map<String, Object> map) throws Exception;
	public int countAsk() throws Exception;
	public List<AskVO> searchAsk(Map<String, Object> map) throws Exception;
	public int countSearchAsk(String keyword) throws Exception;
	public List<AskVO> findAsk(Map<String, Object> map) throws Exception;
	public int countFindAsk(int type) throws Exception;
	public void writeCS(HttpServletRequest request, CsVO csVO, CsFileVO csFileVO) throws Exception;
	public int maxCount() throws Exception;
	public List<CsVO> selectCS(Map<String, Object> map) throws Exception;
	public int countCS() throws Exception;
	public Map<String, Object> viewCS(int cs_idx) throws Exception;
	public void updateCS(CsVO csVO) throws Exception;
	public void deleteCS(int cs_idx) throws Exception;
	public void replyCS(CsVO csVO) throws Exception;
	public List<CsVO> csList(Map<String, Object> map);
	public int csCount(Map<String, Object> map);
	public int cs_typeCount(Map<String, Object> map);
	public List<CsVO> cs_typeList(Map<String, Object> map);
}
