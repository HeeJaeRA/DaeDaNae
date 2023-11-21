package co.yedam.member.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.common.Command;
import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class ModifyMControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		MemberVO vo = new MemberVO();
		MemberService svc = new MemberServiceImpl();

		String saveDir = req.getServletContext().getRealPath("images");
		int size = 10 * 2048 * 2048;

		try {
			MultipartRequest mr = new MultipartRequest(req, saveDir, size, "UTF-8", new DefaultFileRenamePolicy());
			String id = mr.getParameter("id");
			String pw = mr.getParameter("pw");
			String name = mr.getParameter("name");
			String birthDay= mr.getParameter("birthDay");
			String phone = mr.getParameter("phone");
			String address = mr.getParameter("address");
			String img = mr.getFilesystemName("image");
//			String gender = mr.getParameter("gender");  
			
			vo.setUserId(id);
			vo.setUserPw(pw);
			vo.setUserName(name);
			vo.setBirthDay(birthDay);
			vo.setPhone(phone);
			vo.setAddress(address);
			vo.setImage(img);
//			vo.setGender(gender);
			
			System.out.println(vo);

		} catch (Exception e) {
			e.printStackTrace();
		} // try.catch

		//req.setAttribute("vo", vo);

		System.out.println(vo);
	
		if (svc.modifyMember(vo)) {
			try {
				resp.sendRedirect("myPage.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("modifyMemF.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}// execute
}// class
