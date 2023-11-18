package co.yedam.restaurant.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;
import co.yedam.review.service.ReviewVO;
import co.yedam.review.service.ReviewService;
import co.yedam.review.serviceImpl.ReviewServiceImpl;

public class RestaurantInfoControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "restaurant/restaurantInfo.tiles";
		
		String rcode = req.getParameter("rcode");
		
		RestaurantService svc = new RestaurantServiceImpl();
		RestaurantVO vo = svc.getRestaurant(rcode);

		List<RestaurantVO> allList = svc.selectRandomList();
		List<RestaurantVO> nearList = svc.selectAddress(vo.getRsGu());
		List<RestaurantVO> typeList = svc.selectCategory(vo.getRsCategory());
		
		req.setAttribute("vo", vo);
		
		req.setAttribute("allList", allList);
		req.setAttribute("addressList", nearList);
		req.setAttribute("categoryList", typeList);
		
		ReviewService svcR = new ReviewServiceImpl();
		ReviewVO voR = svcR.cntStar(rcode);
		
		req.setAttribute("reviewCnt", voR);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
