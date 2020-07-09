package com.team3.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.team3.dao.MemberDAO;
import com.team3.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
	@Inject
	private MemberDAO mDao;

	
	public void setDAO(MemberDAO mDao) {
		this.mDao = mDao;
	}

	// 1. 회원가입
	@Override
	public void MemberJoin(MemberVO mVO) throws Exception {
		mDao.MemberJoin(mVO);
	}
	@Override
	public MemberVO findCheck(MemberVO mVO) {
		MemberVO result = mDao.findCheck(mVO);
		return result;
	}
	@Override
	public void ChangePw(MemberVO mVO) throws Exception {
		mDao.ChangePw(mVO);
	}

	@Override
	public String emailCheck(MemberVO mVO) {
		String result = mDao.emailCheck(mVO);
		System.out.println("서비스: " + result);
		System.out.println(mVO.getMb_email());
		return result;
	}
	// 1_1. ID 중복 체크
	@Override
	public String idCheck(MemberVO mVO) throws Exception {
		String result = mDao.idCheck(mVO);
		System.out.println("서비스: " + result);
		System.out.println(mVO.getMb_id());
		return result;
	}

	// 2. 로그인 처리
	@Override
	public boolean Login(MemberVO mVO, HttpSession session) throws Exception {
		boolean result = mDao.Login(mVO);
		
		if (result) {
			MemberVO mVOInfo = MemberInfo(mVO);
			
			session.setAttribute("mb_id", mVOInfo.getMb_id());
			session.setAttribute("mb_name", mVOInfo.getMb_name());
			session.setAttribute("mb_seller", mVOInfo.getMb_seller());
		}
		return result;
	}

	// 3. 회원정보 출력
	@Override
	public MemberVO MemberInfo(MemberVO mVO) throws Exception {
		return mDao.MemberInfo(mVO);
	}
	// 3_1. 회원정보 수정
	@Override
	public void MemberModify(MemberVO mVO) throws Exception {
		mDao.MemberModify(mVO);
	}
	// 3_2. 회원정보-ID/PW 일치여부확인
	@Override
	public boolean MemberCheck(MemberVO mVO) throws Exception {
		return mDao.MemberCheck(mVO);
	}

	// 3_3. 비밀번호 변경 - 회원정보
	@Override
	public void MemberModifyPw(MemberVO mVO) throws Exception {
		mDao.MemberModifyPw(mVO);
	}
	

	// 6. 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	// 7. 회원탈퇴
	@Override
	public void MemberDelete(MemberVO mVO) throws Exception {
		mDao.MemberDelete(mVO);
	}
	

	@Override
	public String adminId(MemberVO mVO) throws Exception {
		String resultID = mDao.adminId(mVO);
		return resultID;
	}
}

