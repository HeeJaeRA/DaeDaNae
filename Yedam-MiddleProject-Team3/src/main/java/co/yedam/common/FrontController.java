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
import co.yedam.product.web.ProductInfoControl;
import co.yedam.product.web.ProductListControl;
import co.yedam.restaurant.web.AddressListControl;
import co.yedam.restaurant.web.CategoryListControl;
import co.yedam.restaurant.web.RestaurantListControl;


public class FrontController extends HttpServlet {

	Map<String, Command> map = new HashMap<>();

	@Override
	public void init() throws ServletException {
		

		map.put("/main.do", new MainControl());
		

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
