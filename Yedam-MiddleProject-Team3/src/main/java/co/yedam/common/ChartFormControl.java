package co.yedam.common;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChartFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.getRequestDispatcher("admin/chart.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
