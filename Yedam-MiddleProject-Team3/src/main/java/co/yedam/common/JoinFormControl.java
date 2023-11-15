package co.yedam.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.member.service.MemberService;
import co.yedam.member.service.MemberVO;
import co.yedam.member.serviceImpl.MemberServiceImpl;

public class JoinFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String path = "main/joinForm.tiles";
		
		//req.setAttribute("list", list);
		
		

		try {
			req.getRequestDispatcher(path).forward(req, resp);
		}catch(Exception e){
			e.printStackTrace();
		}

	}

}
