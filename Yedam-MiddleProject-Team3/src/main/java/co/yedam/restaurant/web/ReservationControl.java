package co.yedam.restaurant.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.restaurant.service.ReservationVO;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class ReservationControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		//파라미터로 받을 값
		String date= req.getParameter("date");
		String time= req.getParameter("time");
		String buyAble= req.getParameter("buyAble");
		System.out.println("date"+date);
		System.out.println("time"+time);
		System.out.println("buyAble"+buyAble);
		ReservationVO rvo = new ReservationVO();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			rvo.setResDate(formatter.parse(date));
		} catch (Exception e) {
			e.printStackTrace();
		}
		rvo.setResTime(time);
		rvo.setBuyAble(Integer.parseInt(buyAble));
				
		
		RestaurantService svc = new RestaurantServiceImpl();
		
		//세션값 넘겨받기
		//HttpSession session = req.getSession();
		String id = (String) req.getAttribute("id");
		String rsCode= (String) req.getAttribute("rcode");
		System.out.println(id);
		System.out.println(rsCode);
		
		rvo.setUserId(id);
		rvo.setRsCode(rsCode);
		
		System.out.println( "rvo"+rvo);
		//req.setAttribute("vo", vo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Map<String, Object> map = new HashMap<>();	
		
		if(svc.addReser(rvo)) {
			map.put("rvo", rvo);
			map.put("retCode", "Success");
			
			try {
				resp.sendRedirect("restaurantInfo.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else{
			map.put("retCode", "Fail");
			try {
				resp.sendRedirect("reservationForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//

}//
