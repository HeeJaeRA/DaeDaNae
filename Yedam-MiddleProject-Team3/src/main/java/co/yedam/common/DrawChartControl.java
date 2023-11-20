package co.yedam.common;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class DrawChartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		RestaurantService svc = new RestaurantServiceImpl();
		List<Map<String, Object>> list = svc.getResCountByLike();
//		List<Map<String, Object>> list2 = svc.getPopResList();
		
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(list));
//			resp.getWriter().print(gson.toJson(list2));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
