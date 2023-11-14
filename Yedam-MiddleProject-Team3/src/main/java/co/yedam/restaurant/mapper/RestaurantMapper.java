package co.yedam.restaurant.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.restaurant.service.RestaurantVO;

public interface RestaurantMapper {
	
	public List<RestaurantVO> selectAllList();
	
	public List<RestaurantVO> selectCategory(@Param("category") String rsCategory);

	public List<RestaurantVO> selectAddress(@Param("address") String rsGu);
	
	
}
