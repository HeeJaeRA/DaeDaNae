package co.yedam.restaurant.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

		//세션값 넘겨받기
		//HttpSession session = req.getSession();
		String id =  req.getParameter("id");
		String rsCode=  req.getParameter("rcode");
		String nickname= req.getParameter("nickname");
		System.out.println("id" + id);
		System.out.println(rsCode);
		//@DateTimeFormat
		//@JsonFormat
		//파라미터로 받을 값
		String date= req.getParameter(("date"));
		String time= req.getParameter("time");
		String buyAble= req.getParameter("buyAble");
		System.out.println("date"+date);
		System.out.println("time"+time);
		System.out.println("buyAble"+buyAble);
		ReservationVO rvo = new ReservationVO();
		
		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd");
//		try {
//			rvo.setResDate(formatter.parse(date));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	
		RestaurantService svc = new RestaurantServiceImpl();
		
		
		rvo.setUserId(id);
		rvo.setRsCode(rsCode);
		rvo.setNickname(nickname);
		
		rvo.setResDate(date);
//		try {
//			rvo.setResDate(formatter.parse(date));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}

		rvo.setResTime(time);
		rvo.setBuyAble(Integer.parseInt(buyAble));
				
		
		System.out.println( "rvo"+rvo);
		//req.setAttribute("vo", vo);
		
		Gson gson = new GsonBuilder().setDateFormat("YYYY-MM-dd").create();
		Map<String, Object> map = new HashMap<>();	
		
		if(svc.addReser(rvo)) {
			map.put("rvo", rvo);
			map.put("retCode", "Success");
			
//			try {
//				resp.sendRedirect("restaurantList.do");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
		}else{
			map.put("retCode", "Fail");
//			try {
//				resp.sendRedirect("reservationForm.do");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
		}
		
		
		
		
		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//

}//
