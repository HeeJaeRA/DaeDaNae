package co.yedam.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
=======
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

>>>>>>> branch 'develop' of https://github.com/HeeJaeRA/DaeDaNae.git

public class AdminMainControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
<<<<<<< HEAD
//		String path = "admin/adMain.tiles";
//		ProductService svc = new ProductServiceImpl();
//		List<ProductVO> list = svc.productList();
//		
//		System.out.println(list);
//		
//		req.setAttribute("list", list);
//		
//		try {
//			req.getRequestDispatcher(path).forward(req, resp);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
=======
		String path = "admin/adMain.tiles";
		MemberService mvc = new MemberServiceImpl();
		RestaurantService rvc = new RestaurantServiceImpl();
		List<MemberVO> memList = mvc.memberList();
		List<RestaurantVO> resList = rvc.selectAllList();
		
		
		req.setAttribute("memList", memList);
		req.setAttribute("resList", resList);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
>>>>>>> branch 'develop' of https://github.com/HeeJaeRA/DaeDaNae.git
	
	}

}
