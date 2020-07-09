package com.team3.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.CsFileDAO;

@Service
public class CsFileServiceImp implements CsFileService {

	@Inject
	private CsFileDAO csFileDAO;

	@Override
	public Map<String, Object> selectFileInfo(int idx) throws Exception {
		return csFileDAO.selectFileInfo(idx);
	}
	
	
}
