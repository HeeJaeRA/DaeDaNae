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
		
		if (req.getMethod().equals("GET")) {

		} else if (req.getMethod().equals("POST")) { // 18행 IF...GET방식과 POST방식 비교
			String saveDir = req.getServletContext().getRealPath("resources/images/boardimg");
			int size = 5*1024*1024;
			//MultipartRequest mr;
			try {
				MultipartRequest mr = //
						new MultipartRequest(req,  //요청정보
								saveDir, //저장 경로
								size, //최대 업로드 가능한 파일 크기
								"UTF-8", //인코딩 방식
								new DefaultFileRenamePolicy()//리네임 정책
								);

				String boardCategory = mr.getParameter("boardCategory");
				String boardTitle = mr.getParameter("boardTitle");
				String userId = mr.getParameter("userId");		
				String boardContent = mr.getParameter("boardContent");
				String image1 = mr.getFilesystemName("image1");
				String image2 = mr.getFilesystemName("image2");
				String image3 = mr.getFilesystemName("image3");
				vo.setBoardCategory(boardCategory);
				vo.setBoardTitle(boardTitle);
				vo.setUserId(userId);
				vo.setBoardContent(boardContent);
				vo.setImage1(image1);
				vo.setImage2(image2);
				vo.setImage3(image3);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//end of if.
				
		BoardService svc = new BoardServiceImpl();
		if (svc.addBoard(vo)) {
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
				resp.sendRedirect("boardForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}// end of execute

}