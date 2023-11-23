package co.yedam.board.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class BoardListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		resp.setContentType("text/json; charset=UTF-8");
		
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.boardList();

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Map<String, Object> map = new HashMap<>();

		map.put("boardlist", list);

		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
