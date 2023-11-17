package co.yedam.coupon.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.coupon.service.CouponService;
import co.yedam.coupon.serviceImpl.CouponServiceImpl;

public class RemoveCouponControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		String cc = req.getParameter("cc");

		Map<String, String> map = new HashMap<>();
		
		CouponService cvc = new CouponServiceImpl();
		if(cvc.delCoupon(id, cc)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		Gson gson = new GsonBuilder().create(); 
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}