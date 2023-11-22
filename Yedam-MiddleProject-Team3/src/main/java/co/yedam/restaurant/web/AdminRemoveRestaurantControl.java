package co.yedam.restaurant.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class AdminRemoveRestaurantControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String rco = req.getParameter("rco");
		RestaurantService svc = new RestaurantServiceImpl();
		// RestaurantVO vo = svc.getRestaurant(Integer.parseInt(rco));

		Map<String, String> map = new HashMap<>();

		if (svc.removeRestaurant(rco)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}

		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
