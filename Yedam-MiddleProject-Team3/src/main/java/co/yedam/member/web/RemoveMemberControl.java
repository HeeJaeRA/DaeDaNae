package co.yedam.member.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.member.service.MemberService;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class RemoveMemberControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		
		Map<String, String> map = new HashMap<>();
		
		MemberService mvc = new MemberServiceImpl();
		if(mvc.memberRemove(id)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		
		Gson gson = new GsonBuilder().create(); 
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
