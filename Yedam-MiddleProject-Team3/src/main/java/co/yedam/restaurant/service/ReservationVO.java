package co.yedam.restaurant.service;

import java.util.Date;

import lombok.Data;
@Data
public class ReservationVO {
	
	private String userId;
	private String RsCode;
	private Date date; //얘를 문자로 받을까... 날짜로 받을까...
	private String time;//얘도
	private int buyAble;
	
}
