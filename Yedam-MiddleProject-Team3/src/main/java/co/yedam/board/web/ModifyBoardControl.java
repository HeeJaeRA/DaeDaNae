package co.yedam.board.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class ModifyBoardControl implements Command {
//수정 누르면 수정화면 가서 바꾼후 목록으로
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 파라메터활용 -> 데이터수정 -> 목록 이동.

		BoardVO vo = new BoardVO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String b = req.getParameter("bco");
		System.out.println("bco : " + b);
		String boardTitle = req.getParameter("boardTitle");
		String userId = req.getParameter("userId");
		System.out.println("title:" + boardTitle);
		System.out.println("userId:" + userId);
		int boardCode = Integer.parseInt(req.getParameter("bco"));
		
		

		String boardContent = req.getParameter("boardContent");

	

		vo.setBoardCode(boardCode);
		
		vo.setBoardTitle(boardTitle);
		vo.setUserId(userId);
	
		
		vo.setBoardContent(boardContent);

	

		BoardService svc = new BoardServiceImpl();
		if (svc.editBoard(vo)) {
			try {
				resp.sendRedirect("boardList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			try {
				resp.sendRedirect("modifyForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
