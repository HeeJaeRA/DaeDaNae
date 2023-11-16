package co.yedam.review.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.common.PageDTO;
import co.yedam.review.service.ReviewService;
import co.yedam.review.service.ReviewVO;
import co.yedam.review.serviceImpl.ReviewServiceImpl;

public class ReviewListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		resp.setContentType("text/json; charset=UTF-8");

		String rsCode = req.getParameter("rscode");
		String page = req.getParameter("page");
		page = page == null ? "1" : page;

		ReviewService svc = new ReviewServiceImpl();

		PageDTO dto = new PageDTO(Integer.parseInt(rsCode), svc.getTotalCnt(Integer.parseInt(rsCode)), Integer.parseInt(page));

		List<ReviewVO> list = svc.reviewList(rsCode);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("dto", dto);

		resp.setContentType("text/json; charset=UTF-8");
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
