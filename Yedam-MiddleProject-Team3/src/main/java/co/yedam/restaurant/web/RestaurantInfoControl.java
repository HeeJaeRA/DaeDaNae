package co.yedam.restaurant.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class RestaurantInfoControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "restaurant/restaurantInfo.tiles";
		
		String rcode = req.getParameter("rcode");
		
		RestaurantService svc = new RestaurantServiceImpl();
		RestaurantVO vo = svc.getRestaurant(rcode);
		
		System.out.println(vo);
		
		List<RestaurantVO> allList = svc.selectAllList();
		List<RestaurantVO> nearList = svc.selectAddress(vo.getRsGu());
		List<RestaurantVO> typeList = svc.selectCategory(vo.getRsCategory());
		
		req.setAttribute("vo", vo);
		req.setAttribute("allList", allList);
		req.setAttribute("addressList", nearList);
		req.setAttribute("categoryList", typeList);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
