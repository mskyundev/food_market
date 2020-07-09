package com.team3.service;

import java.util.List;

import com.team3.vo.PreOrdersVO;

public interface PreOrdersService {
	//임시 결제정보 추가
	void insertorder(PreOrdersVO PreOrdersVO);
	//임시 결제정보 조회
	List<PreOrdersVO> listpre(String mb_id);
	//결제할 총 금액
	int preSumMoney(String mb_id);
	//결제정보 유무 확인
	int countpre(String mb_id);
	//임시 결제정보 삭제
	void deletepre(String mb_id);
}
