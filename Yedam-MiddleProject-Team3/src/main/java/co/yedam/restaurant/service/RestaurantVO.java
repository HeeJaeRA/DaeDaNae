package co.yedam.restaurant.service;

import lombok.Data;

@Data
public class RestaurantVO {
	String rsCode;
	String rsCategory;
	String rsName;
	String rsAddress;
	String rsGu;
	String rsDong;
	String phone;
	String rsDesc;
	String image1;
	String image2;
	String image3;
	int likecnt;
	int starcnt;

}
