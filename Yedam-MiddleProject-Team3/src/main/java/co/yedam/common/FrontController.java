<<<<<<< HEAD
package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.web.AddBoardControl;
import co.yedam.board.web.BoardFormControl;
import co.yedam.board.web.BoardListControl;
import co.yedam.board.web.FreeBoardControl;
import co.yedam.board.web.GetBoardControl;
import co.yedam.board.web.ModifyBoardControl;
import co.yedam.board.web.ModifyControl;
import co.yedam.board.web.NoticeBoardControl;
import co.yedam.board.web.QnaBoardControl;
import co.yedam.board.web.RemoveBoardControl;
import co.yedam.member.web.AdminCouponControl;
import co.yedam.member.web.AdminmemberListControl;
import co.yedam.restaurant.web.AddressListControl;
import co.yedam.restaurant.web.AdminRestaurantListControl;
import co.yedam.restaurant.web.CategoryListControl;
import co.yedam.restaurant.web.RestaurantInfoControl;
import co.yedam.restaurant.web.RestaurantListControl;

public class FrontController extends HttpServlet {

	Map<String, Command> map = new HashMap<>();

	@Override
	public void init() throws ServletException {

		map.put("/boardList.do", new BoardListControl());
		map.put("/getBoard.do", new GetBoardControl());
		map.put("/noticeBoard.do", new NoticeBoardControl());
		map.put("/qnaBoard.do", new QnaBoardControl());
		map.put("/freeBoard.do", new FreeBoardControl());
		
		map.put("/boardForm.do", new BoardFormControl());
		map.put("/addBoard.do", new AddBoardControl());
		//수정화면 수정버튼 누를때 구현
		map.put("/modifyForm.do", new ModifyControl());
		map.put("/modifyBoard.do", new ModifyBoardControl());
		//삭제화면..
		map.put("/removeBoard.do", new RemoveBoardControl());

		//로그인, 로그아웃, 회원가입
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/joinForm.do", new JoinFormControl());
		map.put("/join.do", new JoinControl());
		
		//리뷰댓글
		//map.put("/review.do", new ReviewControl());
		//map.put("/addReview.do", new AddReviewControl());
		//map.put("/updateReview.do", new UpdateReviewControl());
		//map.put("/removeReview.do", new RemoveReviewControl());
		
		map.put("/restaurantList.do", new RestaurantListControl());
		map.put("/addressList.do", new AddressListControl());
		map.put("/categoryList.do", new CategoryListControl());
		map.put("/restaurantInfo.do", new RestaurantInfoControl());

		//관리자 페이지
		map.put("/adMain.do", new AdminMainControl());
		map.put("/adMemberList.do", new AdminmemberListControl());
		map.put("/adRestaurantList.do", new AdminRestaurantListControl());
		map.put("/adCouponList.do", new AdminCouponControl());
		map.put("/chartForm.do", new ChartFormControl());
		map.put("/drawChart.do", new DrawChartControl());
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
=======
package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.web.AddBoardControl;
import co.yedam.board.web.BoardFormControl;
import co.yedam.board.web.BoardListControl;
import co.yedam.board.web.FreeBoardControl;
import co.yedam.board.web.GetBoardControl;
import co.yedam.board.web.ModifyBoardControl;
import co.yedam.board.web.ModifyControl;
import co.yedam.board.web.NoticeBoardControl;
import co.yedam.board.web.QnaBoardControl;
import co.yedam.board.web.RemoveBoardControl;
import co.yedam.restaurant.web.AddressListControl;
import co.yedam.restaurant.web.CategoryListControl;
import co.yedam.restaurant.web.RestaurantInfoControl;
import co.yedam.restaurant.web.RestaurantListControl;


public class FrontController extends HttpServlet {

	Map<String, Command> map = new HashMap<>();

	@Override
	public void init() throws ServletException {

		map.put("/boardList.do", new BoardListControl());
		map.put("/getBoard.do", new GetBoardControl());
		map.put("/noticeBoard.do", new NoticeBoardControl());
		map.put("/qnaBoard.do", new QnaBoardControl());
		map.put("/freeBoard.do", new FreeBoardControl());
		
		map.put("/boardForm.do", new BoardFormControl());
		map.put("/addBoard.do", new AddBoardControl());
		//수정화면 수정버튼 누를때 구현
		map.put("/modifyForm.do", new ModifyControl());
		map.put("/modifyBoard.do", new ModifyBoardControl());
		//삭제화면..
		map.put("/removeBoard.do", new RemoveBoardControl());

		//로그인, 로그아웃
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		//회원가입
		map.put("/joinForm.do", new JoinFormControl());
		map.put("/join.do", new JoinControl());
		//회원가입시 중복확인
		map.put("/repeatedId.do", new RepeatedIdControl());
		map.put("/repeatedNick.do", new RepeatedNickControl());
		
		//리뷰댓글
		//map.put("/review.do", new ReviewControl());
		//map.put("/addReview.do", new AddReviewControl());
		//map.put("/updateReview.do", new UpdateReviewControl());
		//map.put("/removeReview.do", new RemoveReviewControl());
		
		map.put("/restaurantList.do", new RestaurantListControl());
		map.put("/addressList.do", new AddressListControl());
		map.put("/categoryList.do", new CategoryListControl());
		map.put("/restaurantInfo.do", new RestaurantInfoControl());

		map.put("/adMain.do", new AdminMainControl());	
		
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
>>>>>>> refs/remotes/origin/develop
