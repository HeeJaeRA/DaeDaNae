package co.yedam.restaurant.web;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.common.Command;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;
import co.yedam.restaurant.serviceImpl.RestaurantServiceImpl;

public class AdminAddRestaurantControl implements Command {


	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		RestaurantVO vo = new RestaurantVO();
		
		if (req.getMethod().equals("GET")) {

		} else if (req.getMethod().equals("POST")) { // 18행 IF...GET방식과 POST방식 비교
			String saveDir = req.getServletContext().getRealPath("resources/images");
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

				String rsCode = mr.getParameter("rs_code");
				String rsCategory = mr.getParameter("rs_category");
				String rsName = mr.getParameter("rs_name");		
				String rsAddress = mr.getParameter("rs_address");		
				String rsGu = mr.getParameter("rs_gu");		
				String rsDong = mr.getParameter("rs_dong");		
				String phone = mr.getParameter("phone");		
				String rsDesc = mr.getParameter("rs_desc");		
				String image1 = mr.getFilesystemName("image1");
				String image2 = mr.getFilesystemName("image2");
				String image3 = mr.getFilesystemName("image3");
				vo.setRsCode(rsCode);
				vo.setRsCategory(rsCategory);
				vo.setRsName(rsName);
				vo.setRsAddress(rsAddress);
				vo.setRsGu(rsGu);
				vo.setRsDong(rsDong);
				vo.setPhone(phone);
				vo.setRsDesc(rsDesc);
				vo.setImage1(image1);
				vo.setImage2(image2);
				vo.setImage3(image3);
				
				System.out.println("vo:" + vo);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}//end of if.
				
		RestaurantService svc = new RestaurantServiceImpl();
		svc.addRestaurant(vo);
			try {
				//가게 추가화면에서 저장 버튼을 누르면 adRestaurantList.do로 감↓
				resp.sendRedirect("adRestaurantList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}// end of execute

