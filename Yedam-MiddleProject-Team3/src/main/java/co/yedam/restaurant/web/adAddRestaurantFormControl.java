package co.yedam.restaurant.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;

public class adAddRestaurantFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		// 로그인 기능 될때까지 일단 주석처리..


		 HttpSession session = req.getSession();
		if (session.getAttribute("logId") == null) {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {

			try {
				req.getRequestDispatcher("admin/adAddRestaurantForm.tiles").forward(req, resp); 
			} catch (Exception e) {
				e.printStackTrace();

			}

		}

	}
}
