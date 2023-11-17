package co.yedam.coupon.service;

import lombok.Data;

@Data
public class CouponVO {
	private String userId;
	private String couponCode;
	private String couponType;
	
	private String userName;
	private String nickname;
	private String gender;
}
