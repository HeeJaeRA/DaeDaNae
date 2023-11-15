package co.yedam.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
req.getSession().invalidate();
		
		try {
			resp.sendRedirect("restaurant/restaurantList.tiles");
		} catch (IOException e) {
			
			e.printStackTrace();
		}

	}

}


