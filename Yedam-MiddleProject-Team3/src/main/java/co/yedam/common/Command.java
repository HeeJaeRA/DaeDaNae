package co.yedam.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp);
	
}
