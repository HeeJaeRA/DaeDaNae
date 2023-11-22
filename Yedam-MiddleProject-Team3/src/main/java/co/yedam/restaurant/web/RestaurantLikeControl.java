package co.yedam.restaurant.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class RestaurantLikeControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String rscode = req.getParameter("rscode");
		
		RestaurantService svc = new RestaurantServiceImpl();
		
		Map<String, Object> map = new HashMap<>();

		if (svc.likeRS(rscode)) {
			try {
				map.put("retCode", "OK");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			map.put("retCode", "NG");
		}

		resp.setContentType("text/json; charset=UTF-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
