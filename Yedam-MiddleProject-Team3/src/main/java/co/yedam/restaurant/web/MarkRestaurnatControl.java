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

public class MarkRestaurnatControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String uid = req.getParameter("id");
		String rcode = req.getParameter("rcode");
		
		RestaurantService rvc = new RestaurantServiceImpl();
		
		Map<String, String> map = new HashMap<>();
		
		Gson gson = new GsonBuilder().create();
		resp.setContentType("text/json;charset=utf-8");
		
		if(rvc.markRestaurnat(uid, rcode)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
