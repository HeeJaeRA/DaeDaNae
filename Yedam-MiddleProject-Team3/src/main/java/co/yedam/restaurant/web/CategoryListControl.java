package co.yedam.restaurant.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class CategoryListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "restaurant/restaurantList.tiles";
		
		String cate = req.getParameter("category");
		
		RestaurantService svc = new RestaurantServiceImpl();
		List<RestaurantVO> list = svc.selectCategory(cate);

		req.setAttribute("mlist", list);

		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
