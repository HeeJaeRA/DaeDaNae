package co.yedam.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.member.mapper.MemberMapper;
import co.yedam.member.service.FollowVO;
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
	public MemberVO memberNick(@Param("nickname")String nickname) {
		return mapper.memberNick(nickname);
	}
	//멤버리스트 조회
	@Override
	public List<MemberVO> memberList() {
		return mapper.memberList();
	}
	//멤버 단건조회
	public MemberVO memberGet(@Param("id")String id) {
		return mapper.selectMem(id);
	}
	//아이디 찾기
	public MemberVO searchId(@Param("name")String name, @Param("phone")String phone) {
			return mapper.searchId(name, phone);
		}
	public MemberVO searchPw(@Param("id")String id, @Param("phone")String phone) {
		return mapper.searchPw(id, phone);
	}
	//회원가입
	@Override
	public boolean addMember(MemberVO vo) {
	
		return mapper.insert(vo)==1;
	}
	//회원 정보 수정
	public boolean modifyMember(MemberVO vo) {
		return mapper.memUpdate(vo) ==1;
	}
	public boolean modifyPw(MemberVO vo) {
		return mapper.pwUpdate(vo) ==1;
	}
	@Override
	public boolean memberRemove(String id) {
		return mapper.deleteMember(id);
	}
	@Override
	public FollowVO getFollower(String id) {
		return mapper.getFollower(id);
	}
	@Override
	public FollowVO getFollowing(String id) {
		return mapper.getFollowing(id);
	}
}
