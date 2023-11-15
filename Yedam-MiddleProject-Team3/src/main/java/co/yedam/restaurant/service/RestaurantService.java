package co.yedam.restaurant.service;

import java.util.List;

public interface RestaurantService {
	
	public List<RestaurantVO> selectAllList();
	
	public List<RestaurantVO> selectCategory(String rsCate);
	public List<RestaurantVO> selectAddress(String rsGu);
	
	public RestaurantVO getRestaurant(String rcode);

}
