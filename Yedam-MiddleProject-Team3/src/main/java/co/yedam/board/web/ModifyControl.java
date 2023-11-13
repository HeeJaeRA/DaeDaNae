package co.yedam.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class ModifyControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 수정화면오픈
		String path = "WEB-INF/board/modifyForm.do";
		
		String bno = req.getParameter("bno");
		BoardService svc = new BoardServiceImpl();
		BoardVO vo = svc.getBoard(Integer.parseInt(bno));
		req.setAttribute("vo", vo);
		
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
