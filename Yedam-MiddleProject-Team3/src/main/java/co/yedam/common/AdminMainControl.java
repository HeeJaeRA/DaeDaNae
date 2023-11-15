package co.yedam.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class AdminMainControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String path = "admin/adMain.tiles";
		MemberService mvc = new MemberServiceImpl();
		RestaurantService rvc = new RestaurantServiceImpl();
		List<MemberVO> memList = mvc.memberList();
		List<RestaurantVO> resList = rvc.selectAllList();
		
		req.setAttribute("memList", memList);
		req.setAttribute("resList", resList);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
