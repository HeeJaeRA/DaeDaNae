package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.web.AboutBoardControl;
import co.yedam.board.web.AddBoardControl;
import co.yedam.board.web.BoardFormControl;
import co.yedam.board.web.BoardListControl;
import co.yedam.board.web.EventBoardControl;
import co.yedam.board.web.FreeBoardControl;
import co.yedam.board.web.GetBoardControl;
import co.yedam.board.web.ModifyBoardControl;
import co.yedam.board.web.ModifyControl;
import co.yedam.board.web.NoticeBoardControl;
import co.yedam.board.web.QnaBoardControl;
import co.yedam.board.web.RemoveBoardControl;
import co.yedam.board.web.RemoveFormControl;
import co.yedam.coupon.web.AddCouponControl;
import co.yedam.coupon.web.AdminCouponControl;
import co.yedam.coupon.web.AdminCouponControl2;
import co.yedam.coupon.web.RemoveCouponControl;
import co.yedam.member.web.AdminmemberListControl;
import co.yedam.member.web.RemoveMemberControl;
import co.yedam.reply.web.AddReplyControl;
import co.yedam.reply.web.RemoveReplyControl;
import co.yedam.reply.web.ReplyListControl;
import co.yedam.restaurant.web.AddressListControl;
import co.yedam.restaurant.web.AdminRestaurantListControl;
import co.yedam.restaurant.web.CategoryListControl;
import co.yedam.restaurant.web.MarkRestaurnatControl;
import co.yedam.restaurant.web.ReservationControl;
import co.yedam.restaurant.web.ReservationFormControl;
import co.yedam.restaurant.web.RestaurantInfoControl;
import co.yedam.restaurant.web.RestaurantListControl;
import co.yedam.restaurant.web.SearchListControl;
import co.yedam.review.web.AddReviewControl;
import co.yedam.review.web.LikeReviewControl;
import co.yedam.review.web.RemoveReviewControl;
import co.yedam.review.web.ReviewListControl;


public class FrontController extends HttpServlet {

	Map<String, Command> map = new HashMap<>();

	@Override
	public void init() throws ServletException {
		//게시판
		map.put("/boardList.do", new BoardListControl());
		map.put("/getBoard.do", new GetBoardControl());
		map.put("/noticeBoard.do", new NoticeBoardControl());
		map.put("/qnaBoard.do", new QnaBoardControl());
		map.put("/freeBoard.do", new FreeBoardControl());
		//소개,이벤트
		map.put("/aboutBoard.do", new AboutBoardControl());		
		map.put("/eventBoard.do", new EventBoardControl());
		
		map.put("/boardForm.do", new BoardFormControl());
		map.put("/addBoard.do", new AddBoardControl());
		//수정화면 => 수정버튼 누를때 구현
		map.put("/modifyForm.do", new ModifyControl());
		map.put("/modifyBoard.do", new ModifyBoardControl());
		//삭제화면..
		map.put("/removeForm.do", new RemoveFormControl());
		map.put("/removeBoard.do", new RemoveBoardControl());
		//댓글
		map.put("/addReply.do", new AddReplyControl());
		map.put("/removeReply.do", new RemoveReplyControl());
		map.put("/replyList.do", new ReplyListControl());
		
		//로그인, 로그아웃, 회원가입
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/joinForm.do", new JoinFormControl());
		map.put("/join.do", new JoinControl());
		
		//회원가입시 중복확인
		map.put("/repeatedId.do", new RepeatedIdControl());
		map.put("/repeatedNick.do", new RepeatedNickControl());
		//예약하기
		map.put("/reservationForm.do", new ReservationFormControl());
		//map.put("/pay.do", new PayFormControl());
		//map.put("/pay.do", new PayControl());
		map.put("/reservation.do", new ReservationControl());
		//리뷰댓글
		map.put("/reviewList.do", new ReviewListControl());
		map.put("/addReview.do", new AddReviewControl());
		map.put("/removeReview.do", new RemoveReviewControl());
		map.put("/likeReview.do", new LikeReviewControl());
//		map.put("/updateMoney.do", new UpdateMoneyControl());
		
		map.put("/restaurantList.do", new RestaurantListControl());
		map.put("/addressList.do", new AddressListControl());
		map.put("/categoryList.do", new CategoryListControl());
		map.put("/searchList.do", new SearchListControl());
		map.put("/restaurantInfo.do", new RestaurantInfoControl());

		//마이페이지
		map.put("/myPage.do", new MyPageControl());
		
		//관리자 페이지
		map.put("/adMain.do", new AdminMainControl()); //메인
		
		map.put("/adMemberList.do", new AdminmemberListControl()); //멤버리스트
		map.put("/adRemoveMember.do", new RemoveMemberControl()); //멤버삭제
		
		map.put("/adRestaurantList.do", new AdminRestaurantListControl()); //가게리스트
		
		map.put("/chartForm.do", new ChartFormControl()); //차트
		map.put("/drawChart.do", new DrawChartControl()); //차트1
		map.put("/drawChart2.do", new DrawChartControl2()); //차트2
		
		map.put("/adCouponList.do", new AdminCouponControl()); //쿠폰 삭제용리스트
		map.put("/adCouponListA.do", new AdminCouponControl2()); //쿠폰 발급용리스트
		
		map.put("/adCouponAdd.do", new AddCouponControl()); //쿠폰발급
		map.put("/adRemoveCoupon.do", new RemoveCouponControl()); //쿠폰삭제
		
		map.put("/bookMark.do", new MarkRestaurnatControl());
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
