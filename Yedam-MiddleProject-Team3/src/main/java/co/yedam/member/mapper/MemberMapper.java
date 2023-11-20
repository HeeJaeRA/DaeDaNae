package co.yedam.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.member.service.MemberVO;

public interface MemberMapper {
	// 로그인 관련
	public MemberVO getUser(@Param("id") String id, @Param("pw") String pw);
	public List<MemberVO> memberList();

	// 회원가입시 아이디, 닉네임 중복확인용
	public MemberVO memberId(@Param("id") String id);
	public MemberVO memberNick(@Param("nickname") String nickname);

	// 회원가입시 등록
	public int insert(MemberVO vo);
	
	// 관리자 멤버 삭제
	public boolean deleteMember(String id);
	
	//회원 수정
	public int memUpdate(MemberVO vo);

}
