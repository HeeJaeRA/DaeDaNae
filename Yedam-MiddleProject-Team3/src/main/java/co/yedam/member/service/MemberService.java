package co.yedam.member.service;

import java.util.List;

public interface MemberService {
	//로그인 처리
		public MemberVO loginCheck(String id, String pw);
		public List<MemberVO> memberList();
		
	//회원가입 시 등록
	public boolean addMember(MemberVO vo);
	
	//회원 쿠폰 관리
	public List<MemberVO> couponList();
	public List<MemberVO> addCoupon();
}
