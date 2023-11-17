package co.yedam.reply.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import co.yedam.common.DataSourceMybatis;
import co.yedam.reply.mapper.ReplyMapper;
import co.yedam.reply.service.ReplyService;
import co.yedam.reply.service.ReplyVO;

public class ReplyServiceImpl implements ReplyService {

	private SqlSession session = DataSourceMybatis.getInstance().openSession(true);
	private ReplyMapper mapper = session.getMapper(ReplyMapper.class);
	@Override
	public List<ReplyVO> replyList(int boardCode, int page) {
		// TODO Auto-generated method stub
		return mapper.replyList(boardCode,page);
	}

	@Override
	public ReplyVO getReply(int replyCode) {
		// TODO Auto-generated method stub
		return mapper.selectReply(replyCode);
	}

	@Override
	public boolean addReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertReply(vo) > 0;
	}

	@Override
	public boolean editReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateReply(vo) > 0;
	}

	@Override
	public boolean delReply(int replyCode) {
		// TODO Auto-generated method stub
		return mapper.deleteReply(replyCode) > 0;
	}

	@Override
	public int getTotalCnt(int boardCode) {
		return mapper.getTotalCnt(boardCode);
	}

	@Override
	public List<Map<String, Object>> getReplyCountByWriter() {
		return mapper.getReplyCountByWriter();
	}

}
