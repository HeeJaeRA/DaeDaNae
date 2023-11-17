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
		String path = "/board/modifyForm.tiles";
		
		String bco = req.getParameter("bco");
		System.out.println(bco);
		BoardService svc = new BoardServiceImpl();
		BoardVO vo = svc.getBoard(Integer.parseInt(bco));
		req.setAttribute("vo", vo);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
