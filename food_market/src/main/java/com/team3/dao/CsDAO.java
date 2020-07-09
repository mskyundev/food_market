package com.team3.dao;

import java.util.List;
import java.util.Map;

import com.team3.vo.AskVO;
import com.team3.vo.CsFileVO;
import com.team3.vo.CsVO;

public interface CsDAO {
	public List<AskVO> selectAsk(Map<String, Object> map) throws Exception;
	public int countAsk() throws Exception;
	public List<AskVO> searchAsk(Map<String, Object> map) throws Exception;
	public int countSearchAsk(String keyword) throws Exception;
	public List<AskVO> findAsk(Map<String, Object> map) throws Exception;
	public int countFindAsk(int type) throws Exception;
	public void writeCS(CsVO csVO) throws Exception;
	public int maxCount() throws Exception;
	public List<CsVO> selectCS(Map<String, Object> map) throws Exception;
	public int countCS() throws Exception;
	public CsVO viewCS(int cs_idx) throws Exception;
	public void updateCS(CsVO csVO) throws Exception;
	public void deleteCS(int cs_idx) throws Exception;
	public void replyCS(CsVO csVO) throws Exception;
	public List<CsVO> csList(Map<String, Object> map);
	public int csCount(Map<String, Object> map);
	public int cs_typeCount(Map<String, Object> map);
	public List<CsVO> cs_typeList(Map<String, Object> map);
	public List<Map<String, Object>> selectCsFile(int cs_idx);
	public void insertFile(CsFileVO csFileVO) throws Exception;
}

