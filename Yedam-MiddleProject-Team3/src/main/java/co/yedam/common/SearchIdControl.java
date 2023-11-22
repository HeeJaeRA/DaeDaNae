package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class SearchIdControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		Map<String, String> map = new HashMap<>();
		MemberService svc = new MemberServiceImpl();
		MemberVO vo = svc.searchId(name, phone);
		System.out.println(vo);
		if(vo!=null) {
			map.put("retCode","일치");
			map.put("id", vo.userId);
			
		}else {
			map.put("retCode","불일치");
		}
		
		Gson gson = new GsonBuilder().create(); 
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
