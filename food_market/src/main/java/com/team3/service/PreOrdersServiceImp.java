package com.team3.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.PreOrdersDAO;
import com.team3.vo.PreOrdersVO;

@Service
public class PreOrdersServiceImp implements PreOrdersService {

	@Inject
	PreOrdersDAO PreOrdersDAO;
	//임시 결제 정보 추가
	@Override
	public void insertorder(PreOrdersVO PreOrdersVO) {
		PreOrdersDAO.insertorder(PreOrdersVO);
	}
	//임시 결제 정보 조회
	@Override
	public List<PreOrdersVO> listpre(String mb_id) {
	
		return PreOrdersDAO.listpre(mb_id);
	}
	//결제할 총 금액
	@Override
	public int preSumMoney(String mb_id) {
		
		return PreOrdersDAO.preSumMoney(mb_id);
	}
	//임시 결제 정보 유무 확인
	@Override
	public int countpre(String mb_id) {
		// TODO Auto-generated method stub
		return PreOrdersDAO.countpre(mb_id);
	}
	//결제 정보 삭제
	@Override
	public void deletepre(String mb_id) {
		PreOrdersDAO.deletepre(mb_id);
	}

}

