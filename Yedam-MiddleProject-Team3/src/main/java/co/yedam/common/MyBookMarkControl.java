package co.yedam.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.coupon.service.CouponService;
import co.yedam.coupon.service.CouponVO;
import co.yedam.coupon.serviceImpl.CouponServiceImpl;
import co.yedam.member.service.FollowVO;
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;
import co.yedam.restaurant.service.ReservationVO;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class MyBookMarkControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "main/myPage.tiles";
		System.out.println("hello");
		//세션에서 받아오라...
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logId");
		
		RestaurantService rvc = new RestaurantServiceImpl();
		CouponService cvc = new CouponServiceImpl();
//		MemberService mvc = new MemberServiceImpl();
		
		List<ReservationVO> bookingList = rvc.reservationList(id);
		List<RestaurantVO> bookList = rvc.selectBookMarkList(id);
		List<CouponVO> copList = cvc.getMyCoupon(id);
		
//		FollowVO vo = mvc.getFollower(id);
//		FollowVO vo2 = mvc.getFollowing(id);
		
		int ccnt = cvc.couponCnt(id);

		req.setAttribute("bookList", bookList);
		req.setAttribute("bookingList", bookingList);
		req.setAttribute("copList", copList);
		req.setAttribute("ccnt", ccnt);
		
//		req.setAttribute("vo", vo);
//		req.setAttribute("vo2", vo2);

		System.out.println(ccnt);
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
