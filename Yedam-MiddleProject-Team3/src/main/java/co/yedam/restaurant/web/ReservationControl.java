package co.yedam.restaurant.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.member.service.MemberVO;
import co.yedam.restaurant.service.ReservationVO;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class ReservationControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		ReservationVO vo = new ReservationVO();
		MemberVO mvo = new MemberVO();
		RestaurantVO rvo = new RestaurantVO();
		RestaurantService svc = new RestaurantServiceImpl();
		String id= req.getParameter("id");
		String rsCode= req.getParameter("rsCode");
		String date= req.getParameter("date");
		String time= req.getParameter("time");
		//String buyAble= req.getParameter("buyable");
		
		mvo.setUserId(id);
		rvo.setRsCode(rsCode);
		vo.setDate(date);
		vo.setTime(time);
		//vo.setBuyAble(Integer.parseInt(buyAble));
		
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Map<String, Object> map = new HashMap<>();	
		
		if(svc.addReser(vo)) {
			map.put("vo", vo);
			map.put("retCode", "Success");
			//svc.updateAble();
		}else{
			map.put("retCode", "Fail");
		}
		
		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//

}//
