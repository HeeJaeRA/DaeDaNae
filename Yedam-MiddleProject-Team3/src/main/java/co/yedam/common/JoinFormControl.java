package co.yedam.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JoinFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "main/joinForm.tiles";
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		}catch(Exception e){
			e.printStackTrace();
		}

	}

}
