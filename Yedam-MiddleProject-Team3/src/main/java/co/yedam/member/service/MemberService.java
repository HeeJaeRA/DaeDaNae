package co.yedam.member.service;

import java.util.List;

public interface MemberService {
	// 로그인 처리
	public MemberVO loginCheck(String id, String pw);
	public List<MemberVO> memberList();

	// 회원가입시 중복확인
	public MemberVO memberId(String id);
	public MemberVO memberNick(String nickName);

	// 회원가입 시 등록
	public boolean addMember(MemberVO vo);
	
	// 관리자 멤버 삭제
	public boolean memberRemove(String id);
	
}
