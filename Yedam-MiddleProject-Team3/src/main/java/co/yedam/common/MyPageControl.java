package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class MyPageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "main/myPage.tiles";

		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("logId");
		
		RestaurantService svc = new RestaurantServiceImpl();
		MemberService mvc = new MemberServiceImpl();
		
		List<RestaurantVO> list = svc.selectAllList();
		List<RestaurantVO> mainList = svc.selectRandomList();
		List<MemberVO> memList = mvc.memberList();
		
		req.setAttribute("list", list);
		req.setAttribute("mlist", mainList);
		req.setAttribute("memList", memList);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
