package co.yedam.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class JoinControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		MemberVO vo = new MemberVO();
		MemberService svc = new MemberServiceImpl();
		List<MemberVO> list = svc.memberList();

		String saveDir = req.getServletContext().getRealPath("images");
		int size = 10 * 2048 * 2048;

		try {
			MultipartRequest mr = new MultipartRequest(req, saveDir, size, "UTF-8", new DefaultFileRenamePolicy());
			String id = mr.getParameter("id");
			String pw = mr.getParameter("pw");
			String name = mr.getParameter("name");
			String nickName = mr.getParameter("nickName");
			// String grade = mr.getParameter("grade");
			String phone = mr.getParameter("phone");
			String address = mr.getParameter("address");
			//String gunGu = mr.getParameter("gunGu");
			String img = mr.getFilesystemName("image");
			String gender = mr.getParameter("gender");

			vo.setUserId(id);
			vo.setUserPw(pw);
			vo.setUserName(name);
			vo.setNickName(nickName);
			// vo.setGrade(grade);
			vo.setPhone(phone);
			vo.setAddress(address);
			//vo.setGunGu(gunGu);
			vo.setImage(img);
			vo.setGender(gender);

		} catch (Exception e) {
			e.printStackTrace();
		} // try.catch

		req.setAttribute("list", list);
		req.setAttribute("vo", vo);

		System.out.println(vo);
		System.out.println(list);

		if (svc.addMember(vo)) {
			try {
				resp.sendRedirect("restaurant/restaurantList.tiles");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("main/joinForm.tiles");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}// execute
}// class
