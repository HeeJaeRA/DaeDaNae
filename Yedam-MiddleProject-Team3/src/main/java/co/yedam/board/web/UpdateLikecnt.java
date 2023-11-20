package co.yedam.board.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.board.service.BoardService;

import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;


public class UpdateLikecnt implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String boardCode = req.getParameter("bco");

		BoardService svc = new BoardServiceImpl();

		Map<String, Object> map = new HashMap<>();
		
		if (svc.likecnt(Integer.parseInt(boardCode))) {
			try {
				map.put("retCode", "OK");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			map.put("retCode", "NG");
		}

		resp.setContentType("text/json; charset=UTF-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
