package co.yedam.board.service;

import java.util.List;


public interface BoardService {
	//목록, 단건조회, 등록, 수정, 삭제 : 
	public List<BoardVO> boardList();
	public List<BoardVO> selectQnaList();
	public List<BoardVO> selectNoticeList();
	public List<BoardVO> selectFreeList();
	
	public BoardVO getBoard(int boardCode);
	public boolean addBoard(BoardVO vo);
	public boolean editBoard(BoardVO vo);
	public boolean removeBoard(int boardCode);
	public boolean likecnt(int boardCode);
	
	
	//로그인처리
//	public MemberVO loginCheck(String id, String pw);
//	public List<MemberVO> memberList();
//	
	
}
