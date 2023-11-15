package co.yedam.restaurant.service;

import java.util.List;
import java.util.Map;

public interface RestaurantService {
	
	public List<RestaurantVO> selectAllList();
	
	public List<RestaurantVO> selectCategory(String rsCode);
	public List<RestaurantVO> selectAddress(String rsGu);

	//레스토랑 인기 차트
	public List<Map<String, Object>> getResCountByLike();
}
