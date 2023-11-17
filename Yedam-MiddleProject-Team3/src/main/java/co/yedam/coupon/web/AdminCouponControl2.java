package co.yedam.coupon.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.coupon.service.CouponService;
import co.yedam.coupon.service.CouponVO;
import co.yedam.coupon.serviceImpl.CouponServiceImpl;
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;



public class AdminCouponControl2 implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "admin/adCouponAdd.tiles";
		CouponService cvc = new CouponServiceImpl();
		List<CouponVO> clist = cvc.getCoupon();
		
		MemberService mvc = new MemberServiceImpl();
		List<MemberVO> list = mvc.memberList();
		
		
		System.out.println(list);
		System.out.println(clist);
		
		req.setAttribute("copList", clist);
		req.setAttribute("memList", list);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
