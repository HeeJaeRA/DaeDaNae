package co.yedam.restaurant.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yedam.restaurant.service.RestaurantVO;

public interface RestaurantMapper {
	
	public List<RestaurantVO> selectAllList();
	
	public List<RestaurantVO> selectCategory(@Param("category") String rsCate);

	public List<RestaurantVO> selectAddress(@Param("address") String rsGu);

	public List<Map<String, Object>> getResCountByLike();
	
	public RestaurantVO getRestaurant(@Param("rcode") String rcode);
	
	
}
