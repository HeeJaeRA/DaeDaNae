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

public class AddBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		BoardVO vo = new BoardVO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
		int boardCode = Integer.parseInt(req.getParameter("boardCode"));
		String boardCategory = req.getParameter("boardCategory");
		String boardTitle = req.getParameter("boardTitle");
		String userID = req.getParameter("userID");
		Date writeDate = null;
		Date updateDate = null;
		
		try {
			writeDate = sdf.parse(req.getParameter("writeDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		
		try {
			updateDate = sdf.parse(req.getParameter("updateDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String boardContent = req.getParameter("boardContent");
		int boardView = Integer.parseInt(req.getParameter("boardView"));
		int likeCnt = Integer.parseInt(req.getParameter("likeCnt"));
		
		vo.setBoardCode(boardCode);
		vo.setBoardCategory(boardCategory);
		vo.setBoardTitle(boardTitle);
		vo.setUserId(userID);
		vo.setWriteDate(writeDate);
		vo.setUpdateDate(updateDate);
		vo.setBoardContent(boardContent);
		vo.setBoardView(boardView);
		vo.setLikeCnt(likeCnt);

		BoardService svc = new BoardServiceImpl();
		if (svc.addBoard(vo)) {
			try {
				resp.sendRedirect("boardList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			try {
				resp.sendRedirect("boardForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}// end of execute

}
