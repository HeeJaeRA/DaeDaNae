package co.yedam.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;
import co.yedam.reply.service.ReplyService;
import co.yedam.reply.serviceImpl.ReplyServiceImpl;

public class GetBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "board/getBoard.tiles";
		
		// boardNo : 1 => DB search => jsp.
		String bco = req.getParameter("bco");
		BoardService svc = new BoardServiceImpl();
		BoardVO vo = svc.getBoard(Integer.parseInt(bco)); // 문자->숫자
		req.setAttribute("bco", vo);
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("logId");
		MemberService mvc = new MemberServiceImpl();
		MemberVO vom = mvc.memberGet(id);
		
		req.setAttribute("mem", vom);
		
		
//		ReplyService rvc = new ReplyServiceImpl();
//		ReplyVO voR = rvc.getReply(0)
		
		

		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
