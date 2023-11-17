package co.yedam.coupon.service;

import java.util.List;

public interface CouponService {

	// 회원 쿠폰 관리
	public List<CouponVO> getCoupon();
	
	public boolean addCoupon(String userId, String couponCode);
	public boolean delCoupon(String userId, String couponCode);
	
	
	
}
