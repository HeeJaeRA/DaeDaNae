package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FrontController extends HttpServlet {

	Map<String, Command> map = new HashMap<>();

	@Override
	public void init() throws ServletException {
		
//		map.put("/main.do", new MainPageControl());
		//로그인, 로그아웃, 회원가입
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/join.do", new JoinControl());
		//리뷰댓글
		//map.put("/review.do", new ReviewControl());
		//map.put("/addReview.do", new AddReviewControl());
		//map.put("/updateReview.do", new UpdateReviewControl());
		//map.put("/removeReview.do", new RemoveReviewControl());
		
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");

		String uri = req.getRequestURI();
		String context = req.getServletContext().getContextPath();
		String page = uri.substring(context.length());

		Command controller = map.get(page);
		controller.execute(req, resp);
	}

}
