package com.team3.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team3.vo.MemberVO;

@Repository
public class MemberDAOImp implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.team3.mappers.MemberMapper";
	

	public MemberDAOImp() {
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	// 회원가입	
	@Override
	public void MemberJoin(MemberVO mVO) throws Exception {
		sqlSession.insert(Namespace + ".insertMember", mVO);
		
	}
	
	// 비밀번호 찾기-조회
	@Override
	public MemberVO findCheck(MemberVO mVO) {
		MemberVO find = sqlSession.selectOne(Namespace + ".findCheck", mVO);
		return find;
	}
	// 비밀번호 찾기-수정
		@Override
		public void ChangePw(MemberVO mVO) throws Exception {
			sqlSession.update(Namespace+".changePw",mVO);
		}
		
	// 회원가입 이메일 인증
	@Override
	public String emailCheck(MemberVO mVO) {
		return sqlSession.selectOne(Namespace + ".emailCheck", mVO);	
	}	

	// ID중복 확인
	@Override
	public String idCheck(MemberVO mVO) {
		return sqlSession.selectOne(Namespace + ".idCheck", mVO);
	}
	// 로그인
	@Override
	public boolean Login(MemberVO mVO) throws Exception {
		System.out.println(mVO.getMb_id());
		boolean result = false;
		String name = sqlSession.selectOne(Namespace + ".loginMember", mVO);
		if(name == null) {
			
		} else {
			result = true;
		}
		return result;
	}
	// 회원정보
	@Override
	public MemberVO MemberInfo(MemberVO mVO) throws Exception {
		return sqlSession.selectOne(Namespace + ".memberInfo", mVO);	
	}
	

	// 회원정보-ID/PW 일치여부확인
	@Override
	public boolean MemberCheck(MemberVO mVO) throws Exception {
		return Login(mVO);
	}
	// 회원 정보 수정
	@Override
	public void MemberModify(MemberVO mVO) throws Exception {
		sqlSession.update(Namespace+".memberModify",mVO);
	}
	// 비밀번호 변경-회원정보
	@Override
	public void MemberModifyPw(MemberVO mVO) throws Exception {
		sqlSession.update(Namespace+".memberModifyPw",mVO);
	}
	// 회원 탈퇴
	@Override
	public void MemberDelete(MemberVO mVO) throws Exception {
		sqlSession.delete(Namespace+".memberDelete", mVO);
	}
	
	
	// 나도몰라 이건
	@Override
	public String adminId(MemberVO mVO) throws Exception {
		String resultID = sqlSession.selectOne(Namespace+".adminId",mVO);
		return resultID;
	}
}


