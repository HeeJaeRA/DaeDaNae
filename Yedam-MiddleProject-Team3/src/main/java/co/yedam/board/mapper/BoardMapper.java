package co.yedam.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.board.service.BoardVO;


public interface BoardMapper {
	public List<BoardVO> selectList();
	public List<BoardVO> selectMyList(String uid);
	public List<BoardVO> selectNoticeList();
	public List<BoardVO> selectQnaList();
	public List<BoardVO> selectFreeList();
	public BoardVO select(int boardCode);
	public int boardView(int boardCode);
	public int likecnt(int boardCode);
	public int insert(BoardVO vo);
	public int update(BoardVO vo);
	public int delete(int boardCode);
	
	
	// 로그인관련..
	//public MemberVO getUser(@Param("id") String id, @Param("pw") String pw);//매개값 2개줄수있는방법이없어서
	//public List<MemberVO> memberList();
	
}
