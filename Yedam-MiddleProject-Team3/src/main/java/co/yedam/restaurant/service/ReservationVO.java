package co.yedam.restaurant.service;

import lombok.Data;

@Data
public class ReservationVO {
	
	private String userId;
	private String rsCode;
	private String nickname;
	//@DateTimeFormat( pattern = "YYYY-MM-dd")
	private String resDate; //얘를 문자로 받을까... 날짜로 받을까...
	private String resTime;//얘도
	private int seatcnt;
	private String rsName;

}
