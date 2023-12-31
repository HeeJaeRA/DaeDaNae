package co.yedam.restaurant.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.restaurant.mapper.RestaurantMapper;
import co.yedam.restaurant.service.ReservationVO;
import co.yedam.restaurant.service.RestaurantService;
import co.yedam.restaurant.service.RestaurantVO;

public class RestaurantServiceImpl implements RestaurantService{
	
	SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true);
	
	RestaurantMapper mapper = sqlSession.getMapper(RestaurantMapper.class);

	@Override
	public List<RestaurantVO> selectAllList() {
		return mapper.selectAllList();
	}
	
	@Override
	public List<RestaurantVO> selectRandomList() {
		return mapper.selectRandomList();
	}

	@Override
	public List<RestaurantVO> selectCategory(String rsCate) {
		return mapper.selectCategory(rsCate);
	}

	@Override
	public List<RestaurantVO> selectAddress(String rsGu) {
		return mapper.selectAddress(rsGu);
	}
	
	@Override
	public List<RestaurantVO> selectSearchList(String rsName) {
		return mapper.selectSearch(rsName);
	}
	
	@Override
	public RestaurantVO getRestaurant(String rcode) {
		return mapper.getRestaurant(rcode);
	}
	//관리자 차트
	@Override
	public List<Map<String, Object>> getResCountByLike() {
		return mapper.getResCountByLike();
	}
	@Override
	public List<Map<String, Object>> getPopResList() {
		return mapper.getPopResList();
	}	
	//예약현황 등록
	@Override
	public boolean addReser(ReservationVO vo) {
		
		return mapper.getReser(vo)==1;
	}
	@Override
	public List<ReservationVO> reservationList(String id) {
		return mapper.reservationAll(id);
	}

	@Override
	public List<ReservationVO> reserMemberList() {
		return mapper.reserMemberList();
	}

	//음식점추가
	@Override
	public boolean addRestaurant(RestaurantVO vo) {
		return mapper.addRestaurant(vo) == 1;
	}

	@Override
	public boolean removeRestaurant(String rsCode) {
		
		return mapper.removeRestaurant(rsCode) ==1;
	}

	@Override
	public boolean markRestaurnat(String uid, String rcode) {
		return (mapper.markRestaurnat(uid, rcode) == 1);
	}

	@Override
	public List<RestaurantVO> selectBookMarkList(String id) {
		return mapper.selectBookMarkList(id);
	}
	
	@Override
	public List<ReservationVO> getReservationInfo(String uid, String rcode) {
		return mapper.getReservationInfo(uid, rcode);
	}

	@Override
	public boolean likeRS(String rcode) {
		return (mapper.likeRestaurant(rcode) == 1);
	}

}
