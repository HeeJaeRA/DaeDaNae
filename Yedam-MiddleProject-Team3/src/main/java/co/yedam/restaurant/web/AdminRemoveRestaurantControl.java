package co.yedam.restaurant.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class AdminRemoveRestaurantControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String rco = req.getParameter("rco");
		RestaurantService svc = new RestaurantServiceImpl();
		//RestaurantVO vo = svc.getRestaurant(Integer.parseInt(rco));

		if (svc.removeRestaurant(Integer.parseInt(rco))) {
			try {
				resp.sendRedirect("adRestaurantList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
		try {
			resp.sendRedirect("adRestaurantList.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
}
