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

		String nickname = req.getParameter("nickname");
		MemberVO vo = null;
		//vo.setNickName(nickName);

		Gson gson = new GsonBuilder().create();
		MemberService svc = new MemberServiceImpl();
		Map<String, Object> map = new HashMap<>();
		vo=svc.memberNick(nickname);
		if (vo!= null) {
			map.put("vo", vo);
			map.put("retCode", "Exists");
		} else {
			map.put("retCode", "NotEzists");
		}

		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}