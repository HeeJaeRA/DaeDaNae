package co.yedam.restaurant.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;
import co.yedam.restaurant.service.ReservationVO;
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
		
		HttpSession session = req.getSession();
		
		String rcode = req.getParameter("rcode");
		String uid = (String) session.getAttribute("logId");
		
		RestaurantService svc = new RestaurantServiceImpl();
		RestaurantVO vo = svc.getRestaurant(rcode);

		List<RestaurantVO> allList = svc.selectRandomList();
		List<RestaurantVO> nearList = svc.selectAddress(vo.getRsGu());
		List<RestaurantVO> typeList = svc.selectCategory(vo.getRsCategory());

		List<ReservationVO> myReservList = svc.getReservationInfo(uid, rcode);
		
		ReviewService svcR = new ReviewServiceImpl();
		ReviewVO voR = svcR.cntStar(rcode);
		List<ReviewVO> voRc = svcR.checkReview(rcode, uid);
		
		req.setAttribute("vo", vo);
		
		req.setAttribute("allList", allList);
		req.setAttribute("addressList", nearList);
		req.setAttribute("categoryList", typeList);
		
		req.setAttribute("reservList", myReservList);
		
		req.setAttribute("reviewCnt", voR);
		req.setAttribute("reviewCheck", voRc);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
