package co.yedam.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;

public class EventBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		try {
			req.getRequestDispatcher("board/eventBoard.tiles").forward(req, resp); 
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
