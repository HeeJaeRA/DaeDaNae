package co.yedam.coupon.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yedam.coupon.service.CouponVO;
import co.yedam.member.service.MemberVO;
import co.yedam.restaurant.service.RestaurantVO;

public interface CouponMapper {
	

	// 회원 쿠폰 관리
	public List<CouponVO> getCoupon(); //쿠폰리스트
	
	public int insertCoupon(CouponVO vo); //등록
	
	public CouponVO deleteCoupon(String userId, String couponCode); //쿠폰 삭제
}
