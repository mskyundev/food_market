package com.team3.service;

import javax.servlet.http.HttpSession;

import com.team3.vo.MemberVO;

public interface MemberService {

	//회원가입
	public void MemberJoin(MemberVO mVO) throws Exception; 
	// 회원가입 이메일 인증
	public String emailCheck(MemberVO mVO);
	// 비밀번호 찾기-조회
	public MemberVO findCheck(MemberVO mVO);
	// 비밀번호 찾기-수정
	public void ChangePw(MemberVO mVO) throws Exception;
	// 회원가입 아이디 중복체크
	public String idCheck(MemberVO mVO) throws Exception;
	// 로그인
	public boolean Login(MemberVO mVO, HttpSession session) throws Exception;
	// 회원정보조회
	public MemberVO MemberInfo(MemberVO mVO) throws Exception;
	// 회원정보 수정
	public void MemberModify(MemberVO mVO) throws Exception;
	// 회원정보-ID/PW 일치여부확인
	public boolean MemberCheck(MemberVO mVO) throws Exception;
	// 비밀번호 변경 - 회원정보
	public void MemberModifyPw(MemberVO mVO) throws Exception;
	// 회원 탈퇴
	public void MemberDelete(MemberVO mVO) throws Exception;
	// 로그아웃	
	public void logout(HttpSession session);
	
	// 몰라이거 성균아 살려줘 이게뭐야
	public String adminId(MemberVO mVO) throws Exception;
	
}

