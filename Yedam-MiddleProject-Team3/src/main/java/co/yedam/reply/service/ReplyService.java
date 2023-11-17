package co.yedam.reply.service;

import java.util.List;
import java.util.Map;

public interface ReplyService {

	//목록 단건 추가 수정 삭제
	
	public List<ReplyVO> replyList(int boardCode,int page);
	public ReplyVO getReply(int replyCode);
	public boolean addReply(ReplyVO vo);
	public boolean editReply(ReplyVO vo);
	public boolean delReply(int replyCode);
	
	//댓글건수
	public int getTotalCnt(int boardCode);
	
	//차트 데이터
	public List<Map<String, Object>> getReplyCountByWriter();
	
	
}
