package co.yedam.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;
import co.yedam.reply.service.ReplyService;
import co.yedam.reply.service.ReplyVO;
import co.yedam.reply.serviceImpl.ReplyServiceImpl;

public class GetBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "board/getBoard.tiles";
		
		// boardNo : 1 => DB search => jsp.
		String bco = req.getParameter("bco");
		BoardService svc = new BoardServiceImpl();
		BoardVO vo = svc.getBoard(Integer.parseInt(bco)); // 문자->숫자
		
		ReplyService rvc = new ReplyServiceImpl();
//		ReplyVO voR = rvc.getReply(0)
		
		req.setAttribute("bco", vo);
		
//		req.setAttribute("rvvo", voR);
		// 요청재지정.
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
