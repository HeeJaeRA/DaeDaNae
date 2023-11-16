package co.yedam.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.member.mapper.MemberMapper;
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;

public class MemberServiceImpl implements MemberService{
	
SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true);	//true를 넣어주면 자동 commit이 됨
	
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	
	//로그인 시 필요함
	@Override
	public MemberVO loginCheck(@Param("id")String id, @Param("pw")String pw) {
		return mapper.getUser(id, pw);
	}
	//회원가입시 아이디, 닉네임 중복확인시 필요함
	@Override
	public MemberVO memberId(@Param("id")String id) {
		return mapper.memberId(id);
	}
	@Override
	public MemberVO memberNick(@Param("nickName")String nickName) {
		return mapper.memberNick( nickName);
	}
	@Override
	public List<MemberVO> memberList() {
		return mapper.memberList();
	}
	//회원가입
	@Override
	public boolean addMember(MemberVO vo) {
	
		return mapper.insert(vo)==1;
	}

}
