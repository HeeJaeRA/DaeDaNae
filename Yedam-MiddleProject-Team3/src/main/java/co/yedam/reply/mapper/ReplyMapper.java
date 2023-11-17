package co.yedam.reply.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yedam.reply.service.ReplyVO;

//DAO, mapper : select, insert, update, delete 사용
public interface ReplyMapper {
	public List<ReplyVO> replyList(@Param("boardCode") int boardCode, @Param("page") int page); //목록.
	public ReplyVO selectReply(int replyCode);//단건조회
	public int insertReply(ReplyVO vo);//등록
	public int updateReply(ReplyVO vo);//수정
	public int deleteReply(int replyCode);//삭제
	
	public int getTotalCnt(int boardCode);
	public List<Map<String, Object>> getReplyCountByWriter();
	
	
}
