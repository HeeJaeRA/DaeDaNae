package co.yedam.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;

public class BoardFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		//
		HttpSession session = req.getSession();
		if (session.getAttribute("logId") == null) {
			try {
				resp.sendRedirect("loginForm.do");//로그인정보가 없으면 로그인폼으로이동 로그인정보 있으면 정상적으로 감 
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {

			try {
				req.getRequestDispatcher("WEB-INF/board/boardForm.jsp").forward(req, resp); 
			} catch (Exception e) {
				e.printStackTrace();

			}

		}
	}
}
