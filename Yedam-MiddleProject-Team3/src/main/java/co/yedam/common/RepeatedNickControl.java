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

public class RepeatedNickControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String nickName = req.getParameter("nickName");
		MemberVO vo = new MemberVO();
		vo.setNickName(nickName);

		Gson gson = new GsonBuilder().create();
		MemberService svc = new MemberServiceImpl();
		Map<String, Object> map = new HashMap<>();

		if (svc.memberNick(nickName) == null) {
			map.put("vo", vo);
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}

		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}