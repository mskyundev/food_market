package com.team3.dao;

import com.team3.vo.MemberVO;

public interface MemberDAO {
	
	// ID중복체크
	public String idCheck(MemberVO mVO) throws Exception;
	// email 중복체크
	public String emailCheck(MemberVO mVO);
	// 비밀번호 찾기
	public MemberVO findCheck(MemberVO mVO);
	// 회원가입
	public void MemberJoin(MemberVO mVO) throws Exception;
	// 로그인
	public boolean Login(MemberVO mVO) throws Exception;
	// 회원정보
	public MemberVO MemberInfo(MemberVO mVO) throws Exception;
	// 회원정보-ID/PW 일치여부확인
	public boolean MemberCheck(MemberVO mVO) throws Exception;
	// 회원정보 수정
	public void MemberModify(MemberVO mVO) throws Exception;
	// 비밀번호 수정
	public void MemberModifyPw(MemberVO mVO) throws Exception;
	// 비밀번호 찾기
	public void ChangePw(MemberVO mVO) throws Exception;
	// 회원탈퇴
	public void MemberDelete(MemberVO mVO) throws Exception;
	
	// 지워도 될까?
	public String adminId(MemberVO mVO) throws Exception;
}


