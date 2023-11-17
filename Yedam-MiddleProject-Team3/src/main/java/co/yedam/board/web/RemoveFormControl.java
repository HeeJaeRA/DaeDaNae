package co.yedam.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class RemoveFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String bco = req.getParameter("bco");

		BoardService svc = new BoardServiceImpl();
		BoardVO vo = svc.getBoard(Integer.parseInt(bco));
		req.setAttribute("vo", vo);

		try {
			req.getRequestDispatcher("WEB-INF/board/removeForm.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}