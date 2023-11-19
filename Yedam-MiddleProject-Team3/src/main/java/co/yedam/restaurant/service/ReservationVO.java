package co.yedam.restaurant.service;

import java.util.Date;

import lombok.Data;
@Data
public class ReservationVO {
	
	private String userId;
	private String rsCode;
	private String nickname;
	private Date ResDate; //얘를 문자로 받을까... 날짜로 받을까...
	private String ResTime;//얘도
	private int buyAble;
	
}
