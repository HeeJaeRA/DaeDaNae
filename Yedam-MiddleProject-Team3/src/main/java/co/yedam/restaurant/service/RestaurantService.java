package co.yedam.restaurant.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface RestaurantService {

	public List<RestaurantVO> selectAllList();

	public List<RestaurantVO> selectRandomList();

	public List<RestaurantVO> selectCategory(String rsCate);

	public List<RestaurantVO> selectAddress(String rsGu);

	public List<RestaurantVO> selectSearchList(String rsName);

	public RestaurantVO getRestaurant(String rcode);

	// 레스토랑 인기 차트
	public List<Map<String, Object>> getResCountByLike();

	public List<Map<String, Object>> getPopResList();

	// 레스토랑 예약현황(등록)
	public boolean addReser(ReservationVO vo);

	// 레스토랑 예약 목록
	public List<ReservationVO> reservationList(String id);

	// 레스토랑 예약목록(회원별)_관리자페이지에서
	public List<ReservationVO> reserMemberList();

	public boolean addRestaurant(RestaurantVO vo);

	public boolean removeRestaurant(String rsCode);


	// 북마크
	public boolean markRestaurnat(String uid, String rcode);
	
	public List<RestaurantVO> selectBookMarkList(String id);
	
	public List<ReservationVO> getReservationInfo(String uid, String rcode);
	
}
