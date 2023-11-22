package co.yedam.common;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class LoginFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) {
		
		String path = "main/loginForm.tiles";
		
		try {
			req.getRequestDispatcher(path).forward(req, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
