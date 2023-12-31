package co.yedam.member.service;

import java.util.List;

public interface MemberService {
	// 로그인 처리
	public MemberVO loginCheck(String id, String pw);
	public List<MemberVO> memberList();
	//멤버 단건조회
	public MemberVO memberGet(String id);
	//아이디 찾기
	public MemberVO searchId(String name, String phone);
	public MemberVO searchPw(String id, String phone);
	// 회원가입시 중복확인
	public MemberVO memberId(String id);
	public MemberVO memberNick(String nickname);
	// 회원가입 시 등록
	public boolean addMember(MemberVO vo);
	//회원 정보 수정
	public boolean modifyMember(MemberVO vo);
	public boolean modifyPw(MemberVO vo);
	
	// 관리자 멤버 삭제
	public boolean memberRemove(String id);

	//팔로워 출력
	public FollowVO getFollower(String id);
	
	//팔로잉 출력
	public FollowVO getFollowing(String id);
	
}
