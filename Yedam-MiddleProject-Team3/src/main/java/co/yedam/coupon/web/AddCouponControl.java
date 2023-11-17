package co.yedam.coupon.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.coupon.service.CouponService;
import co.yedam.coupon.service.CouponVO;
import co.yedam.coupon.serviceImpl.CouponServiceImpl;
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class AddCouponControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String userId = req.getParameter("userId");
		String couponType = req.getParameter("couponType");
		
		System.out.println(userId);
		System.out.println(couponType);
		MemberService mvc = new MemberServiceImpl();
		CouponService cvc = new CouponServiceImpl();
		List<MemberVO> list = mvc.memberList();
		List<CouponVO> clist = cvc.getCoupon();
		
		req.setAttribute("memList", list);
		req.setAttribute("copList", clist);
		
//		CouponVO vo = new CouponVO();
//		vo.setUserId(userId);
//		vo.setCouponType(couponType);
		
		Map<String, String> map = new HashMap<>();
		
		
		if(cvc.addCoupon(userId, couponType)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		Gson gson = new GsonBuilder().create(); 
		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
