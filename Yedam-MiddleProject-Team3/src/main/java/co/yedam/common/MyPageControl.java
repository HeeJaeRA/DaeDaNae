package co.yedam.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.coupon.service.CouponService;
import co.yedam.coupon.service.CouponVO;
import co.yedam.coupon.serviceImpl.CouponServiceImpl;
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class MyPageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String path = "main/myPage.tiles";
		

		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("logId");

		MemberService mvc = new MemberServiceImpl();
		
		List<MemberVO> memList = mvc.memberList();

		req.setAttribute("memList", memList);

		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
