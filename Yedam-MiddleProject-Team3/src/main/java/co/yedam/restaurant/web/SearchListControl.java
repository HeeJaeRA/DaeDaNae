package co.yedam.restaurant.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class SearchListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "restaurant/restaurantSearch.tiles";
		
		String word = req.getParameter("word");
		
		RestaurantService svc = new RestaurantServiceImpl();
		List<RestaurantVO> list = svc.selectSearchList(word);
		
		req.setAttribute("searchWord", word);
		req.setAttribute("mlist", list);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
