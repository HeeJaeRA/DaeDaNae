package co.yedam.restaurant.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yedam.restaurant.service.ReservationVO;
import co.yedam.restaurant.service.RestaurantVO;

public interface RestaurantMapper {
	
	public List<RestaurantVO> selectAllList();
	
	public List<RestaurantVO> selectRandomList();
	
	public List<RestaurantVO> selectCategory(@Param("category") String rsCate);

	public List<RestaurantVO> selectAddress(@Param("address") String rsGu);

	public List<RestaurantVO> selectSearch(@Param("word") String word);
	
	//관리자 차트
	public List<Map<String, Object>> getResCountByLike();
	
	public List<Map<String, Object>> getPopResList();
	
	public RestaurantVO getRestaurant(@Param("rcode") String rcode);
	
	//예약등록
	public int getReser(ReservationVO vo);
	
	//예약리스트
	public List<ReservationVO> reservationAll(String id);

	public List<ReservationVO> reserMemberList();

	public int addRestaurant(RestaurantVO vo);

	public int markRestaurnat(@Param("uid") String uid, @Param("rcode") String rcode);
	
	public List<RestaurantVO> selectBookMarkList(String id);

	public int removeRestaurant(String rsCode);
}
