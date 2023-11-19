package co.yedam.restaurant.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class ReservationFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "restaurant/reservation.tiles";
		
		String rcode = req.getParameter("rcode");
		RestaurantService svc = new RestaurantServiceImpl();
		RestaurantVO vo = svc.getRestaurant(rcode);
		req.setAttribute("vo", vo);
		 
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
