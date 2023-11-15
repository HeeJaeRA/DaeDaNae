package co.yedam.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class FreeBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "board/freeBoardList.tiles";
		
		// boardNo : 1 => DB search => jsp.
	
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.selectFreeList();

		req.setAttribute("freeList", list);
		//System.out.println(vo);
		// 요청재지정.
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}