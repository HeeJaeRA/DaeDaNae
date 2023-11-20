package co.yedam.review.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.review.service.ReviewService;
import co.yedam.review.service.ReviewVO;
import co.yedam.review.serviceImpl.ReviewServiceImpl;

public class AddReviewControl implements Command {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ReviewVO vo = new ReviewVO();
		ReviewService svc = new ReviewServiceImpl();
		
		String rsCode = req.getParameter("rscode");
		String userId = req.getParameter("userid");
		String nickname = req.getParameter("nickname");
		String writeContent = req.getParameter("writecontent");
		String starTaste = req.getParameter("startaste");
		String starPrice = req.getParameter("starprice");
		String starService = req.getParameter("starservice");

		vo.setRsCode(rsCode);
		vo.setUserId(userId);
		vo.setNickname(nickname);
		vo.setWriteContent(writeContent);
		vo.setStarTaste(Integer.parseInt(starTaste));
		vo.setStarPrice(Integer.parseInt(starPrice));
		vo.setStarService(Integer.parseInt(starService));
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		Map<String, Object> map = new HashMap<>();
		
		if (svc.addReview(vo) && svc.updateMoney(userId)) {
			try {
				map.put("retCode", "OK");
				map.put("vo", vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			map.put("retCode", "NG");
		}
		
		resp.setContentType("text/json; charset=UTF-8");
		
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
 	}

}
