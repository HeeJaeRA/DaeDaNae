package co.yedam.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import co.yedam.member.service.MemberVO;

public interface MemberMapper {
	//로그인 관련
		public MemberVO getUser(@Param("id") String id, @Param("pw") String pw);
		public List<MemberVO> memberList();
	//회원가입시 등록
		public int insert(MemberVO vo);	
}
