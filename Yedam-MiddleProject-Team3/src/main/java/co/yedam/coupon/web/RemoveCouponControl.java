package co.yedam.coupon.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;
import co.yedam.coupon.service.CouponService;
import co.yedam.coupon.service.CouponVO;
import co.yedam.coupon.serviceImpl.CouponServiceImpl;

public class RemoveCouponControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		String cc = req.getParameter("cc");

		CouponService cvc = new CouponServiceImpl();
		cvc.delCoupon(id, cc);
		try {
			resp.sendRedirect("admin/adRemoveCoupon.tiles");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}