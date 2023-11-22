package co.yedam.member.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class ModifyPwControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		MemberVO vo = new MemberVO();
		MemberService svc = new MemberServiceImpl();
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		vo.setUserId(id);
		vo.setUserPw(pw);
		
		if(svc.modifyPw(vo)) {
			try {
				resp.sendRedirect("login.do");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
//		Gson gson = new GsonBuilder().create(); 
//		try {
//			resp.getWriter().print(gson.toJson(vo));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}

	}

}
