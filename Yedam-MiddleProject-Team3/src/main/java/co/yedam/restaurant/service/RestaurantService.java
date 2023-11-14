package co.yedam.restaurant.service;

import java.util.List;

public interface RestaurantService {
	
	public List<RestaurantVO> selectAllList();
	
	public List<RestaurantVO> selectCategory(String rsCode);
	public List<RestaurantVO> selectAddress(String rsGu);

}
