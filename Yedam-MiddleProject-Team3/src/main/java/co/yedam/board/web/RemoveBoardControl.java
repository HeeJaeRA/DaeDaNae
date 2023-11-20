package co.yedam.board.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class RemoveBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String bco = req.getParameter("bco");
		BoardService svc = new BoardServiceImpl();
		BoardVO vo = svc.getBoard(Integer.parseInt(bco)); 

		if (svc.removeBoard(Integer.parseInt(bco))) {
			switch (vo.getBoardCategory()) {
			case "자유게시판":
				try {
					resp.sendRedirect("freeBoard.do");
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;

			case "QnA게시판":
				try {
					resp.sendRedirect("qnaBoard.do");
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			case "공지사항":
				try {
					resp.sendRedirect("noticeBoard.do");
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
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

//		
//			// 제목 ,내용, 작성자.
//			String title = req.getParameter("title");
//			String writer = req.getParameter("writer");
//			String content = req.getParameter("content");
//			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
//
//			vo.setTitle(title);
//			vo.setWriter(writer);
//			vo.setContent(content);	
//			vo.setBoardNo(boardNo);
//
//		} else if (req.getMethod().equals("POST")) { 
//			String saveDir = req.getServletContext().getRealPath("images");
//			int size = 5 * 1024 * 1024;
//			// MultipartRequest mr;
//			try {
//				MultipartRequest mr = //
//						new MultipartRequest(req, // 요청정보
//								saveDir, // 저장 경로
//								size, // 최대 업로드 가능한 파일 크기
//								"UTF-8", // 인코딩 방식
//								new DefaultFileRenamePolicy()// 리네임 정책
//						);
//				String title = mr.getParameter("title");
//				String writer = mr.getParameter("writer");
//				String content = mr.getParameter("content");
//				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
//
//				vo.setTitle(title);
//				vo.setWriter(writer);
//				vo.setContent(content);
//				vo.setBoardNo(boardNo);
//
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		} // end of if.
//
//		BoardService svc = new BoardServiceImpl();
//		if (svc.editBoard(vo)) {
//			try {
//				resp.sendRedirect("boardList.do");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//
//		} else {
//			try {
//				resp.sendRedirect("modifyForm.do");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//
//	}
//
//	}
//
//}
