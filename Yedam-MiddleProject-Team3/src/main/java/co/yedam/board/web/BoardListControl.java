package co.yedam.board.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class BoardListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String path = "board/boardList.tiles";
		
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.boardList();

		req.setAttribute("list", list);

		// 다른페이지로 이동할정보를 가지고있다
		// 페이지 요청(boardList.do) -> 요청 재 지정(board/boardList.jsp).
		
		RequestDispatcher rd = req.getRequestDispatcher(path);// .forward(req, resp);
		try {
			rd.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
