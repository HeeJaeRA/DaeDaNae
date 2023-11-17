package co.yedam.restaurant.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.member.service.MemberVO;
import co.yedam.restaurant.service.ReservationVO;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class ReservationControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		ReservationVO rvo = new ReservationVO();
		//MemberVO mvo = new MemberVO();
		//RestaurantVO vo = new RestaurantVO();
		RestaurantService svc = new RestaurantServiceImpl();
		//String을 date로 변환
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		//세션값 넘겨받기
		//HttpSession session = req.getSession();
		String id = (String) req.getAttribute("id");
		String rsCode= (String) req.getAttribute("rcode");
		//파라미터로 받을 값
		String date= req.getParameter("date");
		String time= req.getParameter("time");
		String buyAble= req.getParameter("buyAble");
		System.out.println("date"+date);
		System.out.println("time"+time);
		System.out.println("buyAble"+buyAble);
		
		rvo.setUserId(id);
		rvo.setRsCode(rsCode);
		try {
			rvo.setDate(formatter.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		rvo.setTime(time);
		rvo.setBuyAble(Integer.parseInt(buyAble));
		System.out.println( "rvo"+rvo);
		//req.setAttribute("vo", vo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Map<String, Object> map = new HashMap<>();	
		
		if(svc.addReser(rvo)) {
			map.put("rvo", rvo);
			map.put("retCode", "Success");
			
			//svc.updateAble();
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
